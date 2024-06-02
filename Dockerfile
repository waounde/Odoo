FROM odoo:14.0

# Copy custom addons
COPY custom_addons /mnt/extra-addons

# Install dependencies
RUN apt-get update && apt-get install -y python3-pip

RUN pip install -r /mnt/extra-addons/requirements.txt

# Copy configuration file
COPY odoo.conf /etc/odoo/
