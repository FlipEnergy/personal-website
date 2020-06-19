
up:
	docker-compose up -d

build:
	docker build -t dennis_site .

stop:
	docker-compose stop

clean:
	docker-compose down
