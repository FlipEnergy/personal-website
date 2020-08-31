
up:
	cd flipenergy && hugo server -D

dc-up:
	rm -rf flipenergy/public
	cd flipenergy && hugo -D
	docker-compose up -d

dc-stop:
	docker-compose stop

clean:
	docker-compose down
