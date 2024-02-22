#su - mysql -c "/usr/sbin/mysqld --user=root --default-authentication-plugin=mysql_native_password"
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf &
/entrypoint.sh mysqld --user=root --default-authentication-plugin=mysql_native_password
