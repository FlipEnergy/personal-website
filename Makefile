
up:
	cd flipenergy && hugo server -D

new:
	cd flipenergy && hugo new post/$(name).md

dc-up:
	docker-compose up -d

dc-stop:
	docker-compose stop

dc-down:
	docker-compose down

deploy:
	helmsman --apply -f dennis-site-DSF.yaml
