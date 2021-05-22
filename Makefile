## 引数なしでmakeを実行するときはhelpを呼び出す
.DEFAULT_GOAL := help

build: ## コンテナをbuildする
	@printf '\033[34m%s\033[m\n' 'docker-compose build --no-cache'
	@docker-compose build --no-cache

up: ## コンテナを起動する
	@printf '\033[34m%s\033[m\n' 'docker-compose up -d'
	@docker-compose up -d

down: ## コンテナを終了する
	@printf '\033[34m%s\033[m\n' 'docker-compose down'
	@docker-compose down

rebuild: down build up ## コンテナをrebulidする

ls: ## コンテナの起動確認
	@printf '\033[34m%s\033[m\n' 'docker container ls'
	@docker container ls

bundle: # bundle install
	@printf '\033[34m%s\033[m\n' 'bundle install'
	@docker-compose run web bundle install


help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

