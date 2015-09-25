# FPM5.6
[继承的官方镜像](https://hub.docker.com/_/php/)

一个FPM5.6的镜像, 继承了官方的镜像, 增加一些常用的扩展和工具

##### 工具
composer
git

##### 扩展
zip
mcrypt
redis
gd
mbstring
pdo_mysql

## 使用

#### 创建镜像
```
docker build -t yourimagename .
```

#### 使用镜像,创建容器
```
docker run -d \
-v /path/to/www:/var/www \
-v /path/to/php-fpm.conf:/usr/local/etc/php-fpm.conf \
-v /path/to/php.ini:/usr/local/etc/php/php.ini:ro \
-p 9000:9000
--name fpm56 \
yourimagename
```