COMPOSE_FILE=./srcs/docker-compose.yml

all:
	@sudo mkdir -p /home/lmasson/data/wp_vol
	@sudo mkdir -p /home/lmasson/data/db_vol
	@docker-compose -f ${COMPOSE_FILE} build
up:
	@docker-compose -f ${COMPOSE_FILE}  up
stop:
	@docker-compose -f ${COMPOSE_FILE}  stop
start:
	@docker-compose -f ${COMPOSE_FILE}  start
clean:
	@docker-compose -f ${COMPOSE_FILE} down
fclean: clean
	@sudo rm -rf /home/lmasson/data/wp_vol
	@sudo rm -rf /home/lmasson/data/db_vol
	@docker system prune
re: fclean all

.PHONY : all clean fclean re up 
