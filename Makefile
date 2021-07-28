DOCKER_NETWORK = docker-hadoop_default
ENV_FILE = hadoop.env
current_branch := $(shell git rev-parse --abbrev-ref HEAD)
build:
	docker build -t leismile/hadoop-base:$(current_branch) ./base
	docker build -t leismile/hadoop-namenode:$(current_branch) ./namenode
	docker build -t leismile/hadoop-datanode:$(current_branch) ./datanode
	docker build -t leismile/hadoop-resourcemanager:$(current_branch) ./resourcemanager
	docker build -t leismile/hadoop-nodemanager:$(current_branch) ./nodemanager
	docker build -t leismile/hadoop-historyserver:$(current_branch) ./historyserver
	docker build -t leismile/hadoop-submit:$(current_branch) ./submit

wordcount:
	docker build -t hadoop-wordcount ./submit
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} leismile/hadoop-base:$(current_branch) hdfs dfs -mkdir -p /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} leismile/hadoop-base:$(current_branch) hdfs dfs -copyFromLocal -f /opt/hadoop-3.2.1/README.txt /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-wordcount
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} leismile/hadoop-base:$(current_branch) hdfs dfs -cat /output/*
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} leismile/hadoop-base:$(current_branch) hdfs dfs -rm -r /output
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} leismile/hadoop-base:$(current_branch) hdfs dfs -rm -r /input

tag-dockerhub:
	docker tag registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-base:$(current_branch) leismile/hadoop-base:$(current_branch) 
	docker tag registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-namenode:$(current_branch) leismile/hadoop-namenode:$(current_branch) 
	docker tag registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-datanode:$(current_branch) leismile/hadoop-datanode:$(current_branch) 
	docker tag registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-resourcemanager:$(current_branch) leismile/hadoop-resourcemanager:$(current_branch) 
	docker tag registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-nodemanager:$(current_branch) leismile/hadoop-nodemanager:$(current_branch) 
	docker tag registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-historyserver:$(current_branch) leismile/hadoop-historyserver:$(current_branch) 
	docker tag registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-submit:$(current_branch) leismile/hadoop-submit:$(current_branch) 

tag-aliyun:
	docker tag leismile/hadoop-base:$(current_branch) registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-base:$(current_branch)
	docker tag leismile/hadoop-namenode:$(current_branch) registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-namenode:$(current_branch)
	docker tag leismile/hadoop-datanode:$(current_branch) registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-datanode:$(current_branch)
	docker tag leismile/hadoop-resourcemanager:$(current_branch) registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-resourcemanager:$(current_branch)
	docker tag leismile/hadoop-nodemanager:$(current_branch) registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-nodemanager:$(current_branch)
	docker tag leismile/hadoop-historyserver:$(current_branch) registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-historyserver:$(current_branch)
	docker tag leismile/hadoop-submit:$(current_branch) registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-submit:$(current_branch)

pull-dockerhub:
	docker pull leismile/hadoop-base:$(current_branch)
	docker pull leismile/hadoop-namenode:$(current_branch)
	docker pull leismile/hadoop-datanode:$(current_branch)
	docker pull leismile/hadoop-resourcemanager:$(current_branch)
	docker pull leismile/hadoop-nodemanager:$(current_branch)
	docker pull leismile/hadoop-historyserver:$(current_branch)
	docker pull leismile/hadoop-submit:$(current_branch)

pull-aliyun:
	docker pull registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-base:$(current_branch)
	docker pull registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-namenode:$(current_branch)
	docker pull registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-datanode:$(current_branch)
	docker pull registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-resourcemanager:$(current_branch)
	docker pull registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-nodemanager:$(current_branch)
	docker pull registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-historyserver:$(current_branch)
	docker pull registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-submit:$(current_branch)

push-dockerhub:
	docker push leismile/hadoop-base:$(current_branch)
	docker push leismile/hadoop-namenode:$(current_branch)
	docker push leismile/hadoop-datanode:$(current_branch)
	docker push leismile/hadoop-resourcemanager:$(current_branch)
	docker push leismile/hadoop-nodemanager:$(current_branch)
	docker push leismile/hadoop-historyserver:$(current_branch)
	docker push leismile/hadoop-submit:$(current_branch)

push-aliyun:
	docker push registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-base:$(current_branch)
	docker push registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-namenode:$(current_branch)
	docker push registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-datanode:$(current_branch)
	docker push registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-resourcemanager:$(current_branch)
	docker push registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-nodemanager:$(current_branch)
	docker push registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-historyserver:$(current_branch)
	docker push registry.cn-zhangjiakou.aliyuncs.com/service-stack/hadoop-submit:$(current_branch)


