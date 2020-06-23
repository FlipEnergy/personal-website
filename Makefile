
up:
	docker-compose up -d

push:
	docker build -t flipenergy/flipenergy:$(tag) .
	docker push flipenergy/flipenergy:$(tag)

stop:
	docker-compose stop

clean:
	docker-compose down
