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

docker inspect awesome_kapitsa
docker inspect 92bb2e7664ed
# 获取关于某个容器的详细信息
# id 可以仅输入一部分，最短是要在当前所有容器中唯一标识

docker 
```

