## Docker 常用指令

```bash
docker run -i -t debian /bin/bash
# 进入容器中的shell

docker run -h CONTAINER -i -t debian /bin/bash
# 为容器制定 hostname

docker ps
# 显示当前运行中的容器

docker ps -a
# 显示所有容器，包括已停止的容器

docker ps -qa
# 显示所有容器的 id

docker ps -qa -f status=exited
# 列出状态为 exited 的容器id

docker rm awesome_kapitsa
# 删除容器

docker rm `docker ps -qa`
docekr rm $(docker ps -qa)
# 删除所有容器

docker stop awesome_kapitsa
# 停止容器

docker inspect awesome_kapitsa
docker inspect 92bb2e7664ed
# 获取关于某个容器的详细信息
# id 可以仅输入一部分，最短是要在当前所有容器中唯一标识

docker inspect stupefied_turing | grep IPAddress 
docker inspect ––format {{.NetworkSettings.IPAddress}} stupefied_turing
# 过滤容器信息

docker diff eloquent_pare
# 查看容器改动情况

docker run --name batman debian echo "Hello"
# --name 指定容器名称

docker logs eloquent_pare
# 查看容器发生的一切事情

docker commit cowsay test/cowsayimage
# 将容器转成镜像

dockr run --name myredis -d redis
# -d 容器后台运行

docker run -it --link myredis:redis redis /bin/bash
# --link myredis:redis
# 把新容器与现存的 myredis 容器连接起来，并且在新容器中 以 redis 作为 myredis 容器的主机名
# 实现方法是：在 新容器中添加一个新的条目，把 redis 指向 myredis IP 地址
# 这样在redis-cli 时直接使用 redis 作为主机名即可，不需要输入 IP 地址


docker pull nginx
# 下载镜像


docker run -d -p 8000:80 nginx
# 将 主机的 8000端口 转发到 容器的 80号端口
docker run -d -P nginx
# Docker 自动选择一个主机上未使用的端口

docker port optinistic_easley 80
# 输出容器 80 号端口与主机的绑定关系







# 以下为一些用例
docker run -it --name cowsay --hostname cowsay debian bash
```



### 数据卷 volume

数据卷时直接在主机挂载的文件或目录，允许多个容器共享

使用方法

1. 在 Dockerfile 里 使用 VOLUME 指令

   ```dockerfile
   FROM debian:wheezy 
   RUN useradd foo 
   RUN mkdir /data && touch /data/x 
   RUN chown -R foo:foo /data 
   VOLUME /data
   # 如果由于某些原因，你不能在 RUN 指令中设置卷的权限和它的所有者，那么就需要通过使用 CMD 或 ENTRYPOINT 指令，在容器创建后，以执行脚本的方式来解决。
   ```

2. docker run 时 使用 -v 参数

   ```bash
   docker run -v /data test/webserver
   # 默认情况下，volume 会挂载到主机的 Docker Root Dir
   # 容器中的 /data 目录便成为了一个数据卷。
   # 镜像的 /data 目录中的所有文件将被复制到数据卷内。
   # docker inspect -f {{.Mounts}} test/webserver
   # 可以获取 volume 在主机上的实际位置
   
   
   docker run -d -v /host/dir:/container/dir test/webserver
   # 绑定挂载
   # 指定挂载到容器的位置
   # 如果容器已经有 /data 目录，它的内容将会被数据卷所隐藏
   # 与先前的几个命令不同，这次并没有文件会从镜像复制到数据卷，而卷也不会被Docker 删除（换句话说，假如数据卷是挂载到一个用户选定的目录的话，那么 docker rm -v是不会把它删除的）。
   ```

- 当使用这个镜像来启动一个容器的时候，Docker 会把那个数据卷目录内的所有文件从镜像复制到容器。但如果数据卷是和主机目录绑定的话，那么镜像的数据就不会复制到容器了（这是为了防止主机文件被意外覆写）。

- 为容器备份

  ```bash
  $ docker run --rm -it --link myredis:redis redis /bin/bash 
  root@09a1c4abf81f:/data# redis-cli -h redis -p 6379 
  redis:6379> set "persistence" "test" 
  OK 
  redis:6379> save 
  OK 
  redis:6379> exit 
  root@09a1c4abf81f:/data# exit 
  exit 
  $ docker run --rm --volumes-from myredis -v $(pwd)/backup:/backup \ 
           debian cp /data/dump.rdb /backup/ 
  $ ls backup 
  dump.rdb
  ```

  ```bash
  docker rm -v myredis
  # -v, --volumes   Remove anonymous volumes associated with the container
  ```

  

### 共享数据

```bash
docker run -it -h NEWCONTAINER --volumes-from container-test debian /bin/bash
# 与卷关联的那个容器（在刚才的例子中，就是 container-test）无论正在运行与否，刚才的命令都能使用。只要至少存在着一个容器与卷关联，那么卷就不会被删除。
```

### 数据容器

- 唯一目的就是与其他容器分享数据

- ```bash
  docker run --name dbdata postgres echo "Data-Only"
  # dbdata 这个容器 echo 之后会 exited
  # 没有必要让数据容器一直运行
  
  docker run -d --volumes-from dbdata --name db1 postgres
  # 使用 dbdata 这个数据容器
  ```

- 数据卷只会在以下条件被删除

  - 