export SUNAGIMO_IP=192.168.33.11

.PHONY: up
up:
	vagrant up

.PHONY: ssh
ssh:
	sshrc \
		-i .vagrant/machines/sunagimo/virtualbox/private_key \
		vagrant@${SUNAGIMO_IP}

.PHONY: rsync-ansible
rsync-ansible:
	rsync \
		--recursive \
		--times \
		--compress \
		--verbose \
		-e 'ssh -i .vagrant/machines/sunagimo/virtualbox/private_key' \
		--exclude '.git/' \
		--exclude 'tmp' \
		--exclude 'log' \
		./ansible \
		vagrant@${SUNAGIMO_IP}:/home/vagrant/

.PHONY: provision
provision:
	vagrant provision
