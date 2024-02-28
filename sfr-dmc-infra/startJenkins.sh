/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf &
/bin/tini -- /usr/local/bin/jenkins.sh
