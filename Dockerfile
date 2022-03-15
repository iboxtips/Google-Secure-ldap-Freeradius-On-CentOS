FROM freeradius/freeradius-server:3.0.23

COPY configs/clients.conf /etc/raddb/clients.conf
COPY configs/default /etc/raddb/sites-available/default
COPY configs/inner-tunnel /etc/raddb/sites-available/inner-tunnel
COPY configs/ldap /etc/raddb/mods-available/ldap
COPY configs/eap /etc/raddb/mods-enabled/eap
COPY configs/proxy.conf /etc/raddb/proxy.conf
COPY init.sh /usr/local/bin
RUN chmod +x /usr/local/bin/init.sh
RUN ln -s /etc/raddb/mods-available/ldap /etc/raddb/mods-enabled/ldap

ENTRYPOINT ["/usr/local/bin/init.sh"]

CMD ["freeradius"]
