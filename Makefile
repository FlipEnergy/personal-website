
up:
	docker-compose up -d


# tag example: 1.0.0
push:
	docker build -t flipenergy/flipenergy:$(tag) .
	docker push flipenergy/flipenergy:$(tag)

stop:
	docker-compose stop

clean:
	docker-compose down
