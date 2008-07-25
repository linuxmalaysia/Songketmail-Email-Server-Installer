%define apachedir /etc/httpd
%define apacheuser apache
%define apachegroup apache
%define contentdir /usr/share
%define configdir /etc

Summary: Nagios Web based administration tool.
Name: nagiosql
Version: 2.0.2
Release: 1.centos5
License: GPL
Group: Applications/Internet
Source: %{name}-%{version}.tar.gz
Source1: nagiosQL.conf
Source2: nagios-nagiosql-oscc.tar.bz2
Source3: settings.ini
Source4: nagiosql-oscc.sql
URL: http://www.nagiosql.org/
BuildArchitectures: noarch
BuildRoot: %{_tmppath}/%{name}-%{version}-buildroot 
AutoReq: no
Buildrequires: gettext
Requires: php >= 4.3.0
Requires: httpd >= 2.0.46
Requires: php-pear
Requires: nagios >= 2.10
Requires: nagios-plugins
Requires: nagios-devel 
Requires: nagios-plugins-nrpe
Requires: mysql
Requires: mysql-server
Requires: mysql-devel
Requires: php-mysql

Requires(post): /sbin/service
Requires(postun):       /sbin/service
Prereq: /usr/bin/perl

%description
NagiosQL is a web based administration tool for Nagios 2.0.x. It helps you to easily build a complex configuration with all options, manage and use them. NagiosQL is based on a webserver with PHP, MySQL file access to the Nagios configuration files.

http://knowledge.oscc.org.my/practice-areas/system-administration/network/centos-5-rpm-for-nagiosql
http://linuxmalaysia.harisfazillah.info/2008/07/nagiosql-202-rpm-for-centos-5.html

*** Warning *** This RPM will used it own .cfg template. Backup your original.

%prep
%setup -q -n %{name}-%{version}

%build

%install
[ "$RPM_BUILD_ROOT" != "/" ] && rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT%{apachedir}/conf.d
mkdir -p $RPM_BUILD_ROOT%{configdir}/nagios
cp -p $RPM_SOURCE_DIR/nagiosQL.conf $RPM_BUILD_ROOT%{apachedir}/conf.d
mkdir -p $RPM_BUILD_ROOT%{contentdir}/nagiosQL
cp -pR * $RPM_BUILD_ROOT%{contentdir}/nagiosQL
cp -p $RPM_SOURCE_DIR/settings.ini $RPM_BUILD_ROOT%{contentdir}/nagiosQL/config

chown root:apache $RPM_BUILD_ROOT%{contentdir}/nagiosQL/config/settings.ini
chmod 640 $RPM_BUILD_ROOT%{contentdir}/nagiosQL/config/settings.ini

# The template config we put it in /etc/oscc 
# We don't want nagiosQL import to import uneeded config.

mkdir -p $RPM_BUILD_ROOT%{configdir}/oscc
cp -p $RPM_SOURCE_DIR/nagios-nagiosql-oscc.tar.bz2 $RPM_BUILD_ROOT%{configdir}/oscc
cd $RPM_BUILD_ROOT%{configdir}/oscc
tar xvjf nagios-nagiosql-oscc.tar.bz2

cp -p $RPM_SOURCE_DIR/nagiosql-oscc.sql $RPM_BUILD_ROOT%{configdir}/oscc

# Install one by one

cd $RPM_BUILD_ROOT%{configdir}/oscc/etc/nagios

####cp -pR backup $RPM_BUILD_ROOT%{configdir}/nagios
cp -pR hosts $RPM_BUILD_ROOT%{configdir}/nagios
cp -pR services $RPM_BUILD_ROOT%{configdir}/nagios

mkdir -p $RPM_BUILD_ROOT%{configdir}/nagios/backup
mkdir -p $RPM_BUILD_ROOT%{configdir}/nagios/backup/hosts
mkdir -p $RPM_BUILD_ROOT%{configdir}/nagios/backup/services

cp -p checkcommands.cfg $RPM_BUILD_ROOT%{configdir}/nagios
cp -p contactgroups.cfg $RPM_BUILD_ROOT%{configdir}/nagios
cp -p contacts.cfg $RPM_BUILD_ROOT%{configdir}/nagios
cp -p hostdependencies.cfg $RPM_BUILD_ROOT%{configdir}/nagios
cp -p hostescalations.cfg $RPM_BUILD_ROOT%{configdir}/nagios
cp -p hostextinfo.cfg $RPM_BUILD_ROOT%{configdir}/nagios
cp -p hostgroups.cfg $RPM_BUILD_ROOT%{configdir}/nagios
cp -p htpasswd.users $RPM_BUILD_ROOT%{configdir}/nagios
cp -p misccommands.cfg $RPM_BUILD_ROOT%{configdir}/nagios
cp -p servicedependencies.cfg $RPM_BUILD_ROOT%{configdir}/nagios
cp -p serviceescalations.cfg $RPM_BUILD_ROOT%{configdir}/nagios
cp -p serviceextinfo.cfg $RPM_BUILD_ROOT%{configdir}/nagios
cp -p servicegroups.cfg $RPM_BUILD_ROOT%{configdir}/nagios
cp -p timeperiods.cfg $RPM_BUILD_ROOT%{configdir}/nagios

# Move and rename this only overwrite in post install

mv cgi.cfg $RPM_BUILD_ROOT%{configdir}/oscc/cgi.cfg.nagiosql
mv nagios.cfg $RPM_BUILD_ROOT%{configdir}/oscc/nagios.cfg.nagiosql
mv resource.cfg $RPM_BUILD_ROOT%{configdir}/oscc/resource.cfg.nagiosql 

# Need to clean it up

cd $RPM_BUILD_ROOT
rm -rf $RPM_BUILD_ROOT%{configdir}/oscc/etc

%clean
[ "$RPM_BUILD_ROOT" != "/" ] && rm -rf $RPM_BUILD_ROOT

%post

# To install pear module needed

pear install HTML_Template_IT

echo " ***** Information **** "
echo "Please change in /etc/php.ini magic_quotes_gpc = On"
echo "We don't want to auto script it. We do not know your local php setting"
echo "and service httpd restart"
echo " ***** Information **** "

# refer to
# http://nagioswiki.com/wiki/index.php/Nagios_and_NagiosQL_on_CentOS_4.x

# Make the backup
# The original nagios config we put it in /etc/oscc 
# We don't want nagiosQL import to import uneeded config.

cp -p /etc/nagios/cgi.cfg /etc/oscc/cgi.cfg.ori
cp -p /etc/nagios/nagios.cfg /etc/oscc/nagios.cfg.ori
cp -p /etc/nagios/resource.cfg /etc/oscc/resource.cfg.ori

# We will overwrite the config
cp -p /etc/oscc/cgi.cfg.nagiosql /etc/nagios/cgi.cfg
cp -p /etc/oscc/nagios.cfg.nagiosql /etc/nagios/nagios.cfg
cp -p /etc/oscc/resource.cfg.nagiosql /etc/nagios/resource.cfg

# Making Nagios binary executable by Apache user
chown nagios:apache /usr/bin/nagios
chmod 750 /usr/bin/nagios
chmod +x /usr/bin/nagios

# Making sure Nagios can write to command file
chown nagios:apache /var/log/nagios/rw -R
chmod 660 /var/log/nagios/rw -R
chmod +w /var/log/nagios/rw/ -R
chmod +x /var/log/nagios/rw/ -R

# Give Apache appropriate permissions

chmod 6755 /etc/nagios
chown apache:apache /etc/nagios
chmod 6755 /etc/nagios/hosts
chown apache:apache /etc/nagios/hosts
chmod 6755 /etc/nagios/services
chown apache:apache /etc/nagios/services   

chmod 6755 /etc/nagios/backup
chown apache:apache /etc/nagios/backup
chmod 6755 /etc/nagios/backup/hosts
chown apache:apache /etc/nagios/backup/hosts
chmod 6755 /etc/nagios/backup/services
chown apache:apache /etc/nagios/backup/services

chmod 644 /etc/nagios/*.cfg
chown apache:apache /etc/nagios/*.cfg

chmod 644 /etc/nagios/hosts/*.cfg
chown apache:apache /etc/nagios/hosts/*.cfg   
chmod 644 /etc/nagios/services/*.cfg
chown apache:apache /etc/nagios/services/*.cfg  

# Need to make apache read this setting
chown root:apache /usr/share/nagiosQL/config/settings.ini

# Restart nagios apache service

service httpd restart
service nagios restart

#load database

service mysqld status | grep 'is running'>/dev/null 2>&1 || service mysqld start

    mysqladmin create db_nagiosql_v2

if [ $? -eq 0 ]; then

##for load default#mysql < /usr/share/nagiosQL/config/nagiosQL_v2_db_mysql.sql

mysql db_nagiosql_v2 < /etc/oscc/nagiosql-oscc.sql

echo "GRANT ALL ON db_nagiosql_v2.* to nagiosqlusr@localhost identified by 'nagiosqlpwd';" > /tmp/nagiosql-install-$$.tmp
mysql db_nagiosql_v2 < /tmp/nagiosql-install-$$.tmp

else

echo "You Dbmail database is already created or your upgrading your NagiosQL or default mysql password change."

fi

%postun

echo "Will copy back Nagios original .cfg files"

cp -p /etc/oscc/cgi.cfg.ori /etc/nagios/cgi.cfg
cp -p /etc/oscc/nagios.cfg.ori /etc/nagios/nagios.cfg
cp -p /etc/oscc/resource.cfg.ori /etc/nagios/resource.cfg

echo "Please restart httpd and nagios manualy"
###/sbin/service httpd condrestart > /dev/null 2>&1 || :

%files
%defattr(-,root,root)
# Apache nagiosQL.conf file
%config(noreplace) %{apachedir}/conf.d/nagiosQL.conf
# Include top level with %dir so not all files are sucked in
%dir %{contentdir}/nagiosQL
# Include top-level files by hand
%{contentdir}/nagiosQL/*.php
%{contentdir}/nagiosQL/favicon.ico
# Include these dirs so that all files _will_ get sucked in
%{contentdir}/nagiosQL/admin
%{contentdir}/nagiosQL/config
%{contentdir}/nagiosQL/functions
%{contentdir}/nagiosQL/images
%{contentdir}/nagiosQL/templates

# Mark for files from template
/etc/oscc
/etc/oscc/nagios-nagiosql-oscc.tar.bz2
/etc/oscc/nagiosql-oscc.sql
/etc/oscc/cgi.cfg.nagiosql
/etc/oscc/nagios.cfg.nagiosql
/etc/oscc/resource.cfg.nagiosql

# Mark documentation files with %doc and %docdir
%doc %{contentdir}/nagiosQL/Changelog
%doc %{contentdir}/nagiosQL/INSTALL_en
%doc %{contentdir}/nagiosQL/INSTALL_de
%doc %{contentdir}/nagiosQL/LEGAL
%doc %{contentdir}/nagiosQL/LICENSE
%doc %{contentdir}/nagiosQL/TODO
%doc %{contentdir}/nagiosQL/UPGRADE
# Mark configuration files with %config and use secure permissions
%attr(750,root,%{apachegroup}) %dir %{contentdir}/nagiosQL/config
%defattr(640,root,%{apachegroup})

# From template
/etc/nagios/hosts
/etc/nagios/hosts/localhost.cfg
/etc/nagios/services
/etc/nagios/services/localhost.cfg
/etc/nagios/checkcommands.cfg
/etc/nagios/contactgroups.cfg
/etc/nagios/contacts.cfg
/etc/nagios/hostdependencies.cfg
/etc/nagios/hostescalations.cfg
/etc/nagios/hostextinfo.cfg
/etc/nagios/hostgroups.cfg
/etc/nagios/htpasswd.users
/etc/nagios/misccommands.cfg
/etc/nagios/servicedependencies.cfg
/etc/nagios/serviceescalations.cfg
/etc/nagios/serviceextinfo.cfg
/etc/nagios/servicegroups.cfg
/etc/nagios/timeperiods.cfg
/etc/nagios/backup
/etc/nagios/backup/hosts
/etc/nagios/backup/services
/etc/nagios/hosts/www.oscc.org.my.cfg
/etc/nagios/services/Domain.cfg
/etc/nagios/services/PORT80.cfg
/etc/nagios/hosts/www.mampu.gov.my.cfg


%changelog
* Sun Jul  16 2008 Harisfazillah Jamel <linuxmalaysia@gmail.com> 2.0.2
- From Horde Centos5 SPEC RPM
* Mon Jul 14 2008 Liyana <norliyana@oscc.org.my>
- Initial Creation
