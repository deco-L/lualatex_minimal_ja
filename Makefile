SHELL = bash

##----Directory Location----##
SRCDIR = ./srcs/
COMPOSE = docker compose -f $(SRCDIR)/docker-compose.yml
##--------------------------##

##------Makefile rules------##
all: build up exec

build:
	$(COMPOSE) build

up:
	$(COMPOSE) up -d

exec: up
	docker run -it -v $(PWD)/srcs/documents:/work lualatex_minimal_ja bash

down:
	$(COMPOSE) down

clean:
	$(COMPOSE) down --volumes

.PHONY: build up exec down clean
##--------------------------##
