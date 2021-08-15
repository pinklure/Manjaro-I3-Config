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


```
