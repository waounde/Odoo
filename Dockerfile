# Nous construisons notre image à partir de l'image officielle Odoo Community version 15 accessible sur le Docker Hub
FROM odoo:15

# Nous nous mettons en utilisateur root  
USER root

# En tant que root, nous ajoutons les permissions de lecture et d'exécution pour tous les utilisateurs (autres) sur tous les fichiers et dossiers dans le répertoire /mnt/extra-addons/custom-addons.
RUN mkdir -p /mnt/extra-addons/custom-addons && chmod -R o+rX /mnt/extra-addons/custom-addons

# Nous copions nos modules personnalisés implémentés dans le répertoire contenant les modules personnalisés dans notre image
ADD custom_addons/ /mnt/extra-addons/custom-addons/

# Nous copions nos configurations système dans l'image afin qu'elles soient prises en compte au lancement d'Odoo
COPY odoo.conf /etc/odoo/

# Nous nous remettons en utilisateur odoo
USER odoo
