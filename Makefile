MASTER_BRANCH = master
CURRENT_BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
HASH := $(shell git rev-parse HEAD)

update_master:
	@echo "INFO :: Update Master Branch"
	@git checkout $(MASTER_BRANCH)
	@git pull

rebase_dev: update_master
	@echo "INFO :: Running Dev Rebase Workflow"
	@git checkout $(CURRENT_BRANCH)
	@git rebase $(MASTER_BRANCH)

rebase_master: rebase_dev
	@echo "INFO :: Running Master Rebase Workflow"
	@git checkout $(MASTER_BRANCH)
	@git rebase $(CURRENT_BRANCH)
