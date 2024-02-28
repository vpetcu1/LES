/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf &
"/usr/local/bin/docker-entrypoint.sh" rabbitmq-server