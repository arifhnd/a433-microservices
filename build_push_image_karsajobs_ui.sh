# Melakukan build image dengan nama karsajobs-ui:latest menggunakan Dockerfile yang ada di direktori saat ini
docker build -t karsajobs-ui:latest .

# Menandai image karsajobs-ui:latest dengan nama repository arifhnd/karsajobs-ui dan tag latest
docker tag karsajobs-ui:latest ghcr.io/arifhnd/karsajobs-ui:latest

# Melakukan login ke GitHub Container Registry menggunakan token yang disimpan di environment variable CR_PAT
echo $CR_PAT | docker login ghcr.io -u arifhnd --password-stdin

# Melakukan push image ke GitHub Container Registry
docker push ghcr.io/arifhnd/karsajobs-ui:latest