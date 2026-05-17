# Melakukan build image dengan nama karsajobs:latest menggunakan Dockerfile yang ada di direktori saat ini
docker build -t karsajobs:latest .

# Menandai image karsajobs:latest dengan nama repository arifhnd/karsajobs dan tag latest
docker tag karsajobs:latest ghcr.io/arifhnd/karsajobs:latest

# Melakukan login ke GitHub Container Registry menggunakan token yang disimpan di environment variable CR_PAT
echo $CR_PAT | docker login ghcr.io -u arifhnd --password-stdin

# Melakukan push image ke GitHub Container Registry
docker push ghcr.io/arifhnd/karsajobs:latest