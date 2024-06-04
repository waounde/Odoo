FROM odoo:14.0

# Install additional dependencies if necessary
RUN pip install --no-cache-dir -r /etc/odoo/requirements.txt

# Copy custom addons
COPY ./addons /mnt/extra-addons

# Set permissions
RUN chown -R odoo: /mnt/extra-addons

USER odoo

CMD ["odoo"]
