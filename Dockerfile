FROM odoo:14.0

# Copy custom addons
COPY custom_addons /mnt/extra-addons

# Install dependencies
RUN pip install -r /mnt/extra-addons/requirements.txt

# Copy configuration file
COPY odoo.conf /etc/odoo/
