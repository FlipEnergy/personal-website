up:
	cd flipenergy && mise exec -- hugo server -D

new:
	cd flipenergy && mise exec -- hugo new post/$(name).md

dc-up:
	docker-compose up -d

dc-stop:
	docker-compose stop

dc-down:
	docker-compose down

tools:
	mise install
