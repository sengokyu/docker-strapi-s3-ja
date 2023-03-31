TAG_NAME=strapi:4.9.0

all: image

image:
	docker build -t $(TAG_NAME) --rm --force-rm .

clean:
	docker images -f "dangling=true" -q | xargs --no-run-if-empty docker rmi
	docker rmi $(TAG_NAME)

start:
	docker run -p 1337:1337 -it --rm  --env-file app/.env $(TAG_NAME)
