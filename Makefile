GITHUB_URL=http://startupsupper.github.com

deploy:
	wintersmith build -o _deploy
	cd _deploy; git add .; git commit -am 'Deploying pages'; git push origin master
