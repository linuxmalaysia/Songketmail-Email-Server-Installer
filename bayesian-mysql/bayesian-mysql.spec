Summary: Spamassassin Bayesian using Mysql
Name: bayesian-mysql
Version: 0.0.1
Release: 1
Source0: %{name}-%{version}.tar.bz2
License: GPL
Vendor: Harisfazillah Jamel and LinuxDotMy
Packager: Harisfazillah Jamel <linuxmalaysia@harisfazillah.info>
Group: Development/Tools
URL: http://www.songketmail.org/
BuildArchitectures: noarch
BuildRoot: %{_tmppath}/%{name}-%{version}-root
Requires: spamassassin, mysql, mysql-server >= 4.1.3 , perl-DBI, perl-DBD-MySQL, perl-Net-Daemon, perl-libwww-perl

%description

This will installed Bayesian with Mysql for Spamassassin. Already with sa-learn dataset.
Bayesian and whitelist using mysql.

Part of this SPEC from
http://www200.pair.com/mecham/spam/debian-spamassassin-sql.html

Harisfazillah Jamel
30 Dec 2007

For SongketMailFilter http://songketmail.harisfazillah.info/

linuxmalaysia @ gmail.com
linuxmalaysia @ harisfazillah.info

# Macro for generating an environment variable (%1) with %2 random characters
# from gforge RPM spec http://gforge.org/
%define randstr() %1=`perl -e 'for ($i = 0, $bit = "!", $key = ""; $i < %2; $i++) {while ($bit !~ /^[0-9A-Za-z]$/) { $bit = chr(rand(90) + 32); } $key .= $bit; $bit = "!"; } print "$key";'`

%prep

%setup

%build

%install

rm -rf %{buildroot}

# Make directory

install -d  %{buildroot}%{_sysconfdir}/bayesianmysql
install -d -m0755  %{buildroot}/usr/share/spam-global
install -d -m0755  %{buildroot}/usr/local/bin

# copy files

install -Dp -m0644 ham-melayu.txt %{buildroot}%{_sysconfdir}/bayesianmysql/ham-melayu.txt
install -Dp -m0644 spam-melayu.txt %{buildroot}%{_sysconfdir}/bayesianmysql/spam-melayu.txt
install -Dp -m0644 bayesian-mysql-mysql.sql %{buildroot}%{_sysconfdir}/bayesianmysql/bayesian-mysql-mysql.sql
install -Dp -m0644 bayesian-mysql-mysql-basic.sql %{buildroot}%{_sysconfdir}/bayesianmysql/bayesian-mysql-mysql-basic.sql
install -Dp -m0644 bayesian-mysql.cf %{buildroot}%{_sysconfdir}/mail/spamassassin/bayesian-mysql.cf
install -Dp -m0644 bayesian-mysql-mysql.cf %{buildroot}%{_sysconfdir}/mail/spamassassin/bayesian-mysql-mysql.cf
install -Dp -m0755 awlcleanup.sh  %{buildroot}/usr/local/bin/awlcleanup.sh

%clean
rm -rf %{buildroot}

%post

#Need to create the database

if [ $1 -eq 1 ]; then
    # Initial install.  Create and populate DB.

    echo "Configuration Start. Please answer all the questions, if any."

    service mysqld status | grep 'is running' >/dev/null 2>&1 || service mysqld start

    mysqladmin create bayesianmysql

if [ $? -eq 0 ]; then

    %randstr GFPASS 8

    #####echo "GRANT ALL ON bayesianmysql.* to bayesianmysql@localhost identified by '$GFPASS';" > /tmp/bayesianmysql-install-$$.tmp
echo "GRANT ALL ON bayesianmysql.* to bayesianmysql@localhost identified by 'kambing1234';" > /tmp/bayesianmysql-install-$$.tmp
echo "quit" >> /tmp/bayesianmysql-install-$$.tmp

    mysql bayesianmysql < /tmp/bayesianmysql-install-$$.tmp

    echo "Loading Database named bayesianmysql. Please wait this make take a while."

    mysql bayesianmysql < /etc/bayesianmysql/bayesian-mysql-mysql.sql

###sed -i -e 's/\(^bayes_sql_password\W*=\)\(.*$\)/\1 '$GFPASS'/' %{buildroot}%{_sysconfdir}/mail/spamassassin/bayesian-mysql.cf

else

echo "Your bayesianmysql database is may already created or having error or creation or your upgrading your osccbayesian. You may change the password in the /etc/mail/spamassassin/bayesian-mysql.cf"

echo "This rpm assume the root@localhost for Mysql without any password"
echo "If error occur and database bayesianmysql not created. Load it manual"
echo " cd /etc/bayesianmysql mysql -p -u root < bayesian-mysql-mysql.sql"
echo " "

fi

fi

# Teach one ham and one spam to activate Bayesian

sa-learn --ham /etc/bayesianmysql/ham-melayu.txt
sa-learn --spam /etc/bayesianmysql/spam-melayu.txt

# sync
sa-learn --sync --force-expire

# run the LINT
spamassassin --lint -D

# Just to make sure

ln -s /usr/local/bin/awlcleanup.sh /etc/cron.daily/awlcleanup.sh
chown -R postfix /usr/share/spam-global
/etc/cron.daily/awlcleanup.sh

echo "Visit http://songketmail.harisfazillah.info/ for update"

%preun

echo "Visit http://songketmail.harisfazillah.info/ for update"
rm /etc/cron.daily/awlcleanup.sh

%files
%defattr(-,root,root,-)
%doc bayesian-mysql.spec 11_gov-my.cf README
/etc/bayesianmysql/ham-melayu.txt
/etc/bayesianmysql/spam-melayu.txt
/etc/bayesianmysql/bayesian-mysql-mysql.sql
/etc/bayesianmysql/bayesian-mysql-mysql-basic.sql
/usr/local/bin/awlcleanup.sh
%config %{_sysconfdir}/mail/spamassassin/bayesian-mysql.cf
%config %{_sysconfdir}/mail/spamassassin/bayesian-mysql-mysql.cf

%changelog
* Sun Dec 30 2007 Harisfazillah Jamel <linuxmalaysia@harisfazillah.info>
- version 0.0.1 for Centos RedHat Fedora
- fork oscc-bayesian version beta 0.0.2
