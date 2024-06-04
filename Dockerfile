# Utiliser l'image officielle de Python 3.8
FROM python:3.8

# Définir les variables d'environnement
ENV ODOO_VERSION 14.0

# Mettre à jour le système et installer les dépendances d'Odoo
RUN apt-get update && apt-get install -y --no-install-recommends \
        postgresql-client \
        node-less \
        npm \
        && rm -rf /var/lib/apt/lists/* \
        && pip install --no-cache-dir \
            setuptools \
            wheel \
            lxml[html_clean] \
        && pip install --no-cache-dir \
            cryptography \
            num2words \
            psycopg2-binary \
            babel \
            lxml \
            vobject \
            watchdog \
            requests \
            pyopenssl \
        && pip install --no-cache-dir \
            git+https://github.com/odoo/odoo.git@$ODOO_VERSION#egg=odoo

# Créer le répertoire pour les fichiers Odoo
RUN mkdir -p /opt/odoo

# Définir le répertoire de travail
WORKDIR /opt/odoo

# Copier les fichiers de configuration Odoo
COPY ./odoo.conf /etc/odoo/odoo.conf

# Exposer le port 8069 utilisé par Odoo
EXPOSE 8069

# Démarrer Odoo
CMD ["odoo", "-c", "/etc/odoo/odoo.conf"]
