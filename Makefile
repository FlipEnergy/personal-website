
up:
	cd flipenergy && hugo server -D

dc-up:
	docker-compose up -d

dc-stop:
	docker-compose stop

clean:
	docker-compose down
