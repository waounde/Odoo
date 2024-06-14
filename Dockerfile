FROM odoo:15

USER root

RUN mkdir -p /mnt/extra-addons/custom-addons && chmod -R o+rX /mnt/extra-addons/custom-addons

COPY custom_addons/ /mnt/extra-addons/custom-addons/
COPY odoo.conf /etc/odoo

USER odoo
