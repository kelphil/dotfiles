UPSTREAM = upstream
MASTER_BRANCH = master
CURRENT_BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
HASH := $(shell git rev-parse HEAD)

fetch_upstream_master:
	@echo "INFO :: Fetch Upstream Master Branch"
	@git fetch $(UPSTREAM) $(MASTER_BRANCH)

merge_upstream_master: fetch_upstream_master
	@echo "INFO :: Merge Upstream Master Branch"
	@git merge $(UPSTREAM)/$(MASTER_BRANCH) $(MASTER_BRANCH)

update_master:
	@echo "INFO :: Update Master Branch"
	@git checkout $(MASTER_BRANCH)
	@git pull

rebase_dev: update_master
	@echo "INFO :: Running Dev Rebase Workflow"
	@git checkout $(CURRENT_BRANCH)
	@git rebase $(MASTER_BRANCH)

#+----------------------------------------------------------------
# Workflow to keep user-fork in sync with upstream-master
#+----------------------------------------------------------------
sync_upstream: merge_upstream_master

#+----------------------------------------------------------------
# Workflow to keep dev-branch in sync with master-branch
#+----------------------------------------------------------------
rebase_master: rebase_dev
	@echo "INFO :: Running Master Rebase Workflow"
	@git checkout $(MASTER_BRANCH)
	@git rebase $(CURRENT_BRANCH)
