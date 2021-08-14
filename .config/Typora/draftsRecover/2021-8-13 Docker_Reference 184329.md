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

docker inspect 
```

