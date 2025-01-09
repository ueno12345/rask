up:
	docker compose up -d

setup:
	docker compose exec myapp bash -c 'bundle install'
	docker compose exec myapp bash -c 'bundle exec rails db:migrate'

start:
	docker compose exec myapp bash -c 'bundle exec rails server -b 0.0.0.0'

myapp:
	docker compose exec myapp bash

down:
	docker compose down --rmi all --volumes

rails-test:
	docker compose exec myapp bundle exec rails test
