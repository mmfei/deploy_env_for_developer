#!/bin/bash
pwd=`pwd`;
workDir="$1";
if [ -z "$workDir" ]; then
    workDir=~/Work;
fi
echo "work dir: {$workDir}";
echo "are you sure?[y/n]";
read isOk;
if [ "$isOk" = "y" ]; then
   echo "starting..."; 
else
   echo 'cancel';
   exit
fi
mkdir -p ${workDir};
cd ${workDir};
git clone https://github.com/mmfei/docker_php_nginx_mysql_redis_memcached;
cd docker_php_nginx_mysql_redis_memcached;
git checkout mobvista;
git pull;
mkdir -p ${workDir}/data;mkdir -p ${workDir}/htdocs/default;
mkdir -p ${workDir}/log/nginx;
mkdir -p ${workDir}/log/php;
mkdir -p ${workDir}/data/elasticsearch;
mkdir -p ${workDir}/elasticsearch/data;
mkdir -p ${workDir}/logstash/conf;
echo '<?php phpinfo(); ?>' > ${workDir}/htdocs/default/phpinfo.php;

docker-compose build;
docker-compose up -d;
docker-compose ps;

open http://localhost/phpinfo.php;

# env for mobvista facebook 

cd ${workDir}/htdocs/;

git clone http://gitlab.mobvista.com/fb/FMP_FE.git pmd.dev.com
git clone http://gitlab.mobvista.com/fb/ad_new.git pmdadnew.dev.com
ln -s ./pmdadnew.dev.com ./pmd.dev.com/api
git clone http://gitlab.mobvista.com/fb/adapi.git pmdapi.dev.com;
cd ${workDir}/docker_php_nginx_mysql_redis_memcached;

docker-compose stop;
docker-compose build;
docker-compose up -d;
docker-compose ps;

cd $pwd;

echo "
站点目录: ${workDir}/htdocs/;
nginx配置: ${workDir}/docker_php_nginx_mysql_redis_memcached/nginx/;

docker-compose命令:
cd ${workDir}/docker_php_nginx_mysql_redis_memcached;  -- 以下命令要进入对应的目录才能执行
docker-compose stop;   -- 停止服务
docker-compose build;  -- 重建目录(可以理解成重装系统)
docker-compose up -d;  -- 启动所有服务(运行软件)
docker-compose ps;     -- 查看运行中的环境(状态为up表示正常)

查看容器日志
# nginx
docker-compose adapi.devmobvista.com -f;
# php
docker-compose php -f;

查看系统运行日志
less ${workDir}/htdocs/pmd.dev.com/logs/error.log;
# nginx
less ~/Work/log/nginx/error.log
# php
less ~/Work/log/php/fpm-error.log

ps:
alias seelog.adnew='less ${workDir}/htdocs/pmd.dev.com/logs/error.log';
alias seelog.nginx.error='less ${workDir}/log/nginx/error.log';
alias seelog.php.error='less ${workDir}/log/php/fpm-error.log';
alias seelog.nginx.access='less ${workDir}/log/nginx/access.log';
alias seelog.php.access='less ${workDir}/log/php/fpm-access.log';
";


