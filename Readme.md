# Tars容器部署方案

```
    这个方案将tars运维环境和tars部署环境的所有软件依赖打入docker镜像
    可以快速构建集群模式tars服务
```
## 依赖
* docker环境

## 镜像简介
* mysql:5.6 tars环境web界面数据存储
* tars_web_develop tars web环境 + tars_node环境
* tars_node tars_node环境

## 使用方法
* ```cd start_scripts```
* 修改config中的DBIP为tars_web所在机器ip
* 执行 ```./start_mysql.sh```
* 执行 ```./test_mysql.sh``` 在被询问密码时输入 123
* 在test_mysql.sh 执行成功能够进入db后,退出db,然后执行 ```./start_tars_web.sh```
* 不断执行```docker logs tars_web```,在log稳定后,访问```http://${DBIP}:3000/``` 看到tars运维界面则已经成功启动

----
* 如果想部署分布式节点则在另一台机器上执行```./start_tars_node.sh``` 注意此时的config文件中的 DBIP要与刚才的ip完全一致

## hello world


