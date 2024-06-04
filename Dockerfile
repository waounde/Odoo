# Utiliser l'image officielle de Python 3.8
FROM python:3.8

# Définir les variables d'environnement
ENV ODOO_VERSION 14.0
ENV ODOO_RELEASE 20210927

# Mettre à jour le système et installer les dépendances d'Odoo et PostgreSQL
RUN apt-get update && apt-get install -y --no-install-recommends \
        postgresql \
        postgresql-client \
        node-less \
        npm \
        && rm -rf /var/lib/apt/lists/*

# Installer les dépendances Python pour Odoo
RUN pip install --no-cache-dir \
        setuptools \
        wheel \
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
        git+https://github.com/odoo/odoo.git@${ODOO_RELEASE}#egg=odoo

# Créer le répertoire pour les fichiers Odoo
RUN mkdir -p /opt/odoo

# Définir le répertoire de travail
WORKDIR /opt/odoo

# Exposer le port 8069 utilisé par Odoo
EXPOSE 8069

# Démarrer Odoo
CMD ["odoo", "--addons-path=/usr/lib/python3/dist-packages/odoo/addons,/opt/odoo/addons"]
