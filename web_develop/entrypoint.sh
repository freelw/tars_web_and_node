#!/bin/bash

source /root/.nvm/nvm.sh

cd /root/sql/ &&
sed -i "s/192.168.2.131/${DBIP}/g" `grep 192.168.2.131 -rl ./*` &&
sed -i "s/db.tars.com/${DBIP}/g" `grep db.tars.com -rl ./*` &&
sed -i "s/10.120.129.226/${DBIP}/g" `grep 10.120.129.226 -rl ./*` &&
chmod u+x exec-sql.sh &&
./exec-sql.sh &&
mkdir -p /usr/local/app/tars/ &&
cd /usr/local/app/tars/ &&
cp /root/pack/framework.tgz ./ &&
tar -zxvf framework.tgz &&
sed -i "s/192.168.2.131/${DBIP}/g" `grep 192.168.2.131 -rl ./*` &&
sed -i "s/db.tars.com/${DBIP}/g" `grep db.tars.com -rl ./*` &&
sed -i "s/registry.tars.com/${DBIP}/g" `grep registry.tars.com -rl ./*` &&
sed -i "s/web.tars.com/${DBIP}/g" `grep web.tars.com -rl ./*` &&
chmod u+x tars_install.sh &&
./tars_install.sh &&
tarspatch/util/init.sh

echo "DBIP=${DBIP}" &&
cd /data/code/TarsWeb/ &&
sed -i "s/db.tars.com/${DBIP}/g" config/webConf.js &&
sed -i "s/registry.tars.com/${DBIP}/g" config/tars.conf &&
mkdir -p /data/log/tars &&
npm run prd

cd /root/pack_normal &&
tar -zxvf tars.tarsnotify.tgz &&
tar -zxvf tars.tarsstat.tgz &&
tar -zxvf tars.tarslog.tgz &&
tar -zxvf tars.tarsquerystat.tgz &&
tar -zxvf tars.tarsqueryproperty.tgz &&
tar -zxvf tars.tarsproperty.tgz &&
echo DBIP &&
echo ${DBIP} &&
sed -i "s/${DUMP_HOST}/${DBIP}/g" `grep ${DUMP_HOST} -rl ./*` &&
rm -f *.tgz && cp -Rv tars.* /usr/local/app/tars/tarsnode/data/ &&

/usr/local/app/tars/tarsnode/data/tars.tarsnotify/bin/tars_start.sh &&
/usr/local/app/tars/tarsnode/data/tars.tarsstat/bin/tars_start.sh &&
/usr/local/app/tars/tarsnode/data/tars.tarslog/bin/tars_start.sh &&
/usr/local/app/tars/tarsnode/data/tars.tarsquerystat/bin/tars_start.sh &&
/usr/local/app/tars/tarsnode/data/tars.tarsqueryproperty/bin/tars_start.sh &&
/usr/local/app/tars/tarsnode/data/tars.tarsproperty/bin/tars_start.sh

echo "* * * * * /usr/local/app/tars/tarsnode/util/monitor.sh" >> /var/spool/cron/crontabs/root
service cron start
ln -s /share/engine/ /data/engine
ln -s /share/punct_resource/ /data/punct_resource
echo 'started.'
tail -f /dev/null

