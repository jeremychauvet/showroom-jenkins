.PHONY: build start reset configure

JENKINS_VERSION=2.241

build:
	docker-compose build --build-arg JENKINS_VERSION=$(JENKINS_VERSION)

start: build configure

reset: 
	docker-compose down
	rm -fr ./data
	start

configure:
	@mkdir -p ./data/casc_configs
	@cp ./configuration/*.yml ./data/casc_configs
	docker-compose stop
	docker-compose up -d
	@echo "Configuration file copied, you can now reload existing configuration on Jenkins interface (administrate Jenkins > configuration as code)"	