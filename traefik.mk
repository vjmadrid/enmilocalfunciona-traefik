include docker.mk

# --- TRAEFIK ---

traefik-logs: ## [traefik] View container log
	$(DOCKER_COMMAND) logs traefik

traefik-logs2: ## [traefik] Execute docker logs
	ID=$$(docker ps -a -f name=traefik |tail -1 |colrm 13) && $(DOCKER_COMMAND) logs $$ID

traefik-sh: ## [traefik] Execute docker image with sh
	ID=$$(docker ps -f name=traefik |tail -1 |colrm 13) && $(DOCKER_COMMAND) exec -u node -it $$ID "/bin/sh"
