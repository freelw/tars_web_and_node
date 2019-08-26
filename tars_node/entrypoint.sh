#!/bin/bash

source /root/.nvm/nvm.sh

mkdir -p /usr/local/app/tars/ &&
cd /usr/local/app/tars/ &&
cp /root/pack/framework.tgz ./ &&
tar -zxvf framework.tgz &&
sed -i "s/registry.tars.com/${DBIP}/g" `grep registry.tars.com -rl ./*` &&
chmod u+x tarsnode_install.sh &&
./tarsnode_install.sh

echo "* * * * * /usr/local/app/tars/tarsnode/util/monitor.sh" >> /var/spool/cron/crontabs/root
service cron start
echo 'started.'
tail -f /dev/null

