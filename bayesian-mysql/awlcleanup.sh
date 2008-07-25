# Need to cleanup Autowhitelist
# Harisfazillah Jamel
# 25 Oct 2007
# http://www200.pair.com/mecham/spam/debian-spamassassin-sql.html

echo "DELETE FROM awl WHERE lastupdate <= DATE_SUB(SYSDATE(), INTERVAL 6 MONTH);" > /tmp/awl-$$.tmp
echo "DELETE FROM awl WHERE count = 1 AND lastupdate <= DATE_SUB(SYSDATE(), INTERVAL 15 DAY);" >> /tmp/awl-$$.tmp
echo "quit" >> /tmp/awl-$$.tmp

mysql -ubayesianmysql -pkambing1234 bayesianmysql < /tmp/awl-$$.tmp

rm /tmp/awl-$$.tmp

exit
