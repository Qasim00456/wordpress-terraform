#!/bin/bash
set -euxo pipefail

exec > >(tee /var/log/user-data.log | logger -t user-data) 2>&1

DB_NAME="wordpress"
DB_USER="wordpress"
DB_PASSWORD="wordpresspass123"
WP_DIR="/var/www/html"

yum install -y httpd mariadb105-server php php-mysqlnd wget tar

systemctl enable --now httpd
systemctl enable --now mariadb

mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
mysql -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

rm -f "${WP_DIR}/index.html"

cd /tmp
wget -O latest.tar.gz https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/. "${WP_DIR}/"

cp "${WP_DIR}/wp-config-sample.php" "${WP_DIR}/wp-config.php"
sed -i "s/database_name_here/${DB_NAME}/" "${WP_DIR}/wp-config.php"
sed -i "s/username_here/${DB_USER}/" "${WP_DIR}/wp-config.php"
sed -i "s/password_here/${DB_PASSWORD}/" "${WP_DIR}/wp-config.php"

chown -R apache:apache "${WP_DIR}"
find "${WP_DIR}" -type d -exec chmod 755 {} \;
find "${WP_DIR}" -type f -exec chmod 644 {} \;

systemctl restart httpd
