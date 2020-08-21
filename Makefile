build:
	docker build -t docker.pkg.github.com/jstone28/action-runner-base/action-runner-base:v2 .

push:
	docker push docker.pkg.github.com/jstone28/action-runner-base/action-runner-base:v2

run:
	docker run --privileged -it docker.pkg.github.com/jstone28/action-runner-base/action-runner-base:v2 bash

start: build run
