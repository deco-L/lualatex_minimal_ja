SHELL = bash

##----Directory Location----##
SRCDIR = ./srcs/
COMPOSE = docker compose -f $(SRCDIR)/docker-compose.yml
##--------------------------##

##------Makefile rules------##
all: build up 

build:
	$(COMPOSE) build

up:
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

clean:
	$(COMPOSE) down --volumes

.PHONY: build up exec down clean
##--------------------------##
