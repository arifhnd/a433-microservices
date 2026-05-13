# Melakukan build image dengan nama item-app dan tag v1
docker build -t item-app:v1 .

# Menampilkan daftar image yang telah dibuat
docker images

# Menandai image item-app:v1 dengan nama repository arifhnd/item-app dan tag v1
docker tag item-app:v1 ghcr.io/arifhnd/item-app:v1

# Melakukan login ke GitHub Container Registry menggunakan token yang disimpan di environment variable CR_PAT
echo $CR_PAT | docker login ghcr.io -u arifhnd --password-stdin

# Melakukan push image ke GitHub Container Registry
docker push ghcr.io/arifhnd/item-app:v1