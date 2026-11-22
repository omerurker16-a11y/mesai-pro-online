# Mesai Planlayıcı Pro (Online Bulut Sürümü)

Sıfır derleme (no-build), anlık bulut senkronizasyonlu ve cihazlar arası canlı güncellenen vardiya/mesai planlama uygulaması.

## Kurulum (3 Adım)

### 1. Supabase Veritabanı
1. https://supabase.com üzerinden yeni bir proje oluşturun.
2. **SQL Editor** bölümünde `supabase-setup.sql` dosyasının içeriğini yapıştırıp **Run** deyin.
3. **Project Settings > API** kısmından **Project URL** ve **anon public** anahtarını kopyalayın.

### 2. GitHub'a Yükleme
Bu klasördeki tüm dosyaları yeni bir GitHub deposuna yükleyin (`index.html`, `api/config.js`, `vercel.json`, `manifest.json`, `icon.svg`).

### 3. Vercel'de Yayınlama
1. https://vercel.com üzerinde **Add New > Project** deyip GitHub deponuzu seçin.
2. **Framework Preset**: `Other` (Build Command ve Output Directory boş kalsın).
3. **Environment Variables** bölümüne şu iki değişkeni ekleyin:
   - `SUPABASE_URL` = Supabase Project URL
   - `SUPABASE_ANON_KEY` = Supabase anon public key
4. **Deploy** butonuna basın.
5. **Settings > Deployment Protection** altından Vercel Authentication'ın kapalı olduğundan emin olun.

Artık verilen linkten bilgisayar veya telefondan girdiğinizde tüm değişiklikler 0.6 sn içinde buluta kaydolur ve açık diğer cihazlarda canlı güncellenir.
