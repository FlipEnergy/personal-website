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

install-hugo:
	wget https://github.com/gohugoio/hugo/releases/download/v0.79.0/hugo_0.79.0_Linux-64bit.deb
	sudo dpkg -i hugo_0.79.0_Linux-64bit.deb
	hugo version
	rm hugo_0.79.0_Linux-64bit.deb
