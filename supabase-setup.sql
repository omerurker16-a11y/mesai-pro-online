-- Mesai Planlayıcı Pro Online - Supabase Kurulum SQL
-- Supabase Dashboard > SQL Editor içine yapıştırıp "Run" butonuna basın.

create table if not exists public.app_state (
  id uuid primary key,
  state jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- updated_at otomatik güncelleme tetikleyicisi
create or replace function public.set_app_state_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

drop trigger if exists trg_app_state_updated_at on public.app_state;
create trigger trg_app_state_updated_at
before update on public.app_state
for each row execute function public.set_app_state_updated_at();

-- RLS (Row Level Security) ve anon erişim politikası
alter table public.app_state enable row level security;

drop policy if exists "Allow anon read write app_state" on public.app_state;
create policy "Allow anon read write app_state"
on public.app_state
for all
to anon, authenticated
using (true)
with check (true);

-- Canlı cihazlar arası senkronizasyon (Realtime)
do $$
begin
  if not exists (
    select 1
    from pg_publication_tables
    where pubname = 'supabase_realtime'
      and schemaname = 'public'
      and tablename = 'app_state'
  ) then
    alter publication supabase_realtime add table public.app_state;
  end if;
end
$$;
