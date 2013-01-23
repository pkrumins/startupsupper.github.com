DIR=_deploy
GITHUB_REPO=git@github.com:startupsupper/startupsupper.github.com.git

setup:
	if test ! -d $(DIR); then \
		mkdir -p $(DIR); \
		cd $(DIR); \
		git init; \
		git remote add origin $(GITHUB_REPO); \
		git config branch.master.remote master; \
		git config branch.master.merge refs/heads/master; \
	fi

clean:
	cd $(DIR); ls | xargs rm

deploy: setup clean
	wintersmith build -o $(DIR)
	cd $(DIR); git add .; git commit -am 'Deploying pages'; git push -f origin master
