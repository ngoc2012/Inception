all:
	@sudo docker compose -f ./scrs/docker-compose.yml up -d --build
	@sudo docker compose -f ./scrs/docker-compose.yml logs -f

down:
	@sudo docker compose -f ./scrs/docker-compose.yml down

up:
	@sudo docker compose -f scrs/docker-compose.yml up -d --build
	@sudo docker compose -f ./scrs/docker-compose.yml logs -f

stop:
	@sudo docker stop $$(sudo docker ps)

remove_con:
	@sudo docker rm -f $$(sudo docker ps -a -q)

remove_images:
	@sudo docker image prune --all --force

remove_folders:
	@$(shell cd scrs && bash rm_folders.sh)

create_folders:
	@$(shell cd scrs && bash create_folders.sh)

format:
	@make remove_folders
	@make create_folders

re:
	@make down
	@make remove_images
	@make up

clean:
	@sudo docker stop $$(docker ps -qa);\
	sudo docker rm $$(docker ps -qa);\
	sudo docker rmi -f $$(docker images -qa);\
	sudo docker volume rm $$(docker volume ls -q);\
	sudo docker network rm $$(docker network ls -q);\

.PHONY: all re down clean
