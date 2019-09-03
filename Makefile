REPO=conjuring
DCC=docker-compose

default: buildup bash down
up:
	$(DCC) up -d $(REPO)
buildup:
	$(DCC) up --build -d $(REPO)
down:
	$(DCC) down
build:
	$(DCC) build --pull base
	$(DCC) build
test:
	$(MAKE) up
	$(DCC) exec conjuring bash -c "/conda.sh env list"
	$(DCC) exec conjuring bash -c "ls -la /home/"
	$(MAKE) down
bash:
	$(DCC) exec $(REPO) bash
prune:
	docker system prune
provision:
	rm -rf custom/home/* && \
	wget https://github.com/rsbivand/ectqg19-workshop/raw/master/pack.zip && \
	unzip pack.zip && \
	cp -r pack custom/home_default/ && \
	rm -r pack pack.zip
