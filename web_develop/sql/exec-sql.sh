mysql -uroot -p123 -h "${DBIP}" -e " \
grant all on *.* to 'tars'@'%' identified by 'tars2015' with grant option; \
grant all on *.* to 'tars'@'localhost' identified by 'tars2015' with grant option; \
grant all on *.* to 'tars'@'${DBIP}' identified by 'tars2015' with grant option; 
flush privileges; \
"
mysql -uroot -p123 -h "${DBIP}" -e "drop database if exists db_tars; create database db_tars"
mysql -uroot -p123 -h "${DBIP}" -e "drop database if exists tars_stat; create database tars_stat"
mysql -uroot -p123 -h "${DBIP}" -e "drop database if exists tars_property; create database tars_property"
mysql -uroot -p123 -h "${DBIP}" -e "drop database if exists db_tars_web; create database db_tars_web"
mysql -uroot -p123 -h "${DBIP}" db_tars < db_tars.sql
mysql -uroot -p123 -h "${DBIP}" db_tars < tarsnotify.sql
mysql -uroot -p123 -h "${DBIP}" db_tars < tarsstat.sql
mysql -uroot -p123 -h "${DBIP}" db_tars < tarslog.sql
mysql -uroot -p123 -h "${DBIP}" db_tars < tarsquerystat.sql
mysql -uroot -p123 -h "${DBIP}" db_tars < tarsqueryproperty.sql
mysql -uroot -p123 -h "${DBIP}" db_tars < tarsproperty.sql
