FROM odoo:19.0

EXPOSE 10000

CMD ["odoo", "--http-interface=0.0.0.0", "--http-port=10000"]
