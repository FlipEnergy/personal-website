
up:
	docker-compose up -d

build:
	docker build -t flipenergy$(tag) .

stop:
	docker-compose stop

clean:
	docker-compose down
