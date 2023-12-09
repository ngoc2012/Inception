all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

logs:
	@echo "=============== nginx ==============="
	@docker logs nginx
	@echo "=============== wordpress ==============="
	@docker logs wordpress
	@echo "=============== mariadb ==============="
	@docker logs mariadb

gits:
	git add -A -- :!*.o :!*.swp
	git commit -m "all"
	git push

terminal:
	@docker exec -it $(i) /bin/bash
down:
	@docker compose -f ./srcs/docker-compose.yml down

re:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\

PHONY: all re down clean
