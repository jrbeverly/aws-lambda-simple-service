.DEFAULT_GOAL:=help

DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
DIR_TF_AWS := "$(DIR)/aws"
DIR_TF_SERVER := "$(DIR)/server"

.PHONY: help
help: ## This help text.
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Serverless

.PHONY: deploy
deploy: ## Deploy the lambda with serverless
	@cd "$(DIR_TF_AWS)" ; npm run deploy ;

.PHONY: remove
remove: ## Destroys the instructure
	@cd "$(DIR_TF_AWS)" ; npm run remove ;

##@ Express

.PHONY: local
local: ## Locally run the app
	@cd "$(DIR_TF_SERVER)" ; npm run dev ;

##@ Docker

.PHONY: docker
docker: ## Build and run in a docker container
	@cd "$(DIR_TF_SERVER)" ; npm install ;
	@docker build -t aws-express -f docker/Dockerfile .
	@docker stop aws-express || echo
	docker run --name aws-express \
		--rm \
		-p 8080:3000 \
		aws-express
	@echo 'localhost:8080/api/info'
