# ==========================================
# Tahap 1: Builder
# ==========================================
# Menggunakan image Node.js versi 18 (Alpine LTS) yang sangat ringan untuk menghemat ukuran
FROM node:18-alpine AS builder

# Menentukan direktori kerja (working directory) di dalam container
WORKDIR /app

# Menyalin file package.json dan package-lock.json ke dalam container
COPY package*.json ./

# Menginstal seluruh dependensi aplikasi melalui npm
# (Menggunakan npm install karena tidak ada proses build lanjutan yang kompleks, namun
# ini memastikan dependensi dipasang di image stage pertama)
RUN npm install

# Menyalin seluruh source code aplikasi ke dalam container
COPY . .

# ==========================================
# Tahap 2: Runner (Production)
# ==========================================
# Menggunakan image node:18-alpine yang bersih untuk image hasil akhirnya
FROM node:18-alpine

# Menentukan direktori kerja di dalam container hasil
WORKDIR /app

# Menyalin kembali folder node_modules yang sudah jadi dari tahap 'builder'
# Langkah ini mengurangi ukuran image karena kita tidak membawa cache instalasi dari npm
COPY --from=builder /app/node_modules ./node_modules

# Menyalin file-file source dan konfigurasi aplikasi dari tahap 'builder'
COPY --from=builder /app ./

# Menentukan perintah utama yang akan dijalankan ketika container dimulai
CMD ["npm", "start"]
