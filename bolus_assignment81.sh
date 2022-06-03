#! /bin/sh

# following installs httpd
yum install -y httpd

# starts httpd
systemctl start httpd

#following blocks of code adds ports 80 and 443 and then reloads  
firewall -cmd --permanent --add-port=80/tcp
firewall -cmd --permanent --add-port=443/tcp
firewall -cmd --reload

# enables httpd
systemctl enable httpd

# installs latest epel release
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# downloads repo as well
yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm

# downloads yum utils
yum install -y yum-utils

# enables remi
yum-config-manager --enable remi-php56

# installs php info
yum install -y php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo

# restarts httpd
systemctl restart httpd

# installs mySQL
yum install -y mariadb-server mariadb

# starts the mySQL
systemctl start mariadb

# secures the security script of mySQL
mysql_secure_installation

# enables mySQL
systemctl enable mariadb

# logs into mySQL
mysql -u root -p