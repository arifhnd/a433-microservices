# Menggunakan base image Node.js versi 14
FROM node:14

# Membuat direktori kerja di dalam container
WORKDIR /app

# Menyalin seluruh project ke dalam direktori kerja di container
COPY . .

# Menentukan environment variable untuk aplikasi
ENV NODE_ENV=production DB_HOST=item-db

# Menginstal dependencies dan melakukan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Menjalankan aplikasi dengan perintah npm start 
CMD ["npm", "start"]

# Mengekspos port 8080 untuk aplikasi
EXPOSE 8080