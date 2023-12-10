all:
	@cd scrs && bash local_folders.sh
	@sudo docker compose -f ./scrs/docker-compose.yml up -d --build

down:
	@sudo docker compose -f ./scrs/docker-compose.yml down

stop:
	@sudo docker stop $$(sudo docker ps)

remove_con:
	@sudo docker rm -f $$(sudo docker ps -a -q)

remove_images:
	@sudo docker image prune --all --force

re:
	@sudo docker compose -f scrs/docker-compose.yml up -d --build

clean:
	@sudo docker stop $$(docker ps -qa);\
	sudo docker rm $$(docker ps -qa);\
	sudo docker rmi -f $$(docker images -qa);\
	sudo docker volume rm $$(docker volume ls -q);\
	sudo docker network rm $$(docker network ls -q);\

.PHONY: all re down clean
