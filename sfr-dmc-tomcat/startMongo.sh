/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf &
/usr/bin/mongod --bind_ip 0.0.0.0
