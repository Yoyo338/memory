# Utiliser une image Nginx comme base
FROM nginx:latest

# Ajouter le package linux file
RUN apt-get update && apt-get install -y file

# Copier la configuration spécifique de ton site
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Créer le dossier où se trouveront les fichiers du site
RUN mkdir -p /var/concentration/html

# Copier les fichiers HTML dans le dossier approprié
COPY html/ /var/concentration/html/

# Exposer le port 80 pour le serveur web
EXPOSE 80

# Lancer Nginx lorsque le conteneur démarre
CMD ["nginx", "-g", "daemon off;"]
