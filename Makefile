
up:
	docker-compose up -d

build:
	docker build -t dennis_site$(tag) .

stop:
	docker-compose stop

clean:
	docker-compose down
