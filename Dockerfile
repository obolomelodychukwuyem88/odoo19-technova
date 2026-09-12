FROM odoo:19.0

EXPOSE 8069

CMD ["odoo", "--http-interface=0.0.0.0", "--http-port=8069"]
