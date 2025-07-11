---
created date: 2025-03-26T09:31:15-07:00
modified date: 2025-07-11T08:47:26-05:00
---
All about git
# Moving repos from bitbucket to GitHub
Normally, there is an easy import control on the GitHub page to do this move, but I ran out of room on bitbucket and my local commits were never pushed. So, I had to do these manual steps

1. Make sure all local repo changes are committed:
	```
	git add .
	git commit -m "Final commit - before move to github"
	
	# Check your repository status
	git status
	```
2. Add GitHub as New Remote:
	```
	# rename remote: 
	git remote rename origin bitbucket_old
	# or remove Bitbucket remote instead
	# git remote remove origin
	
	# Add GitHub as new origin 
	git remote add origin https://github.com/notuntoward/energy.git
	```
3. create new repo on GitHub: 
	- Log in to GitHub.
	- Click the "+" icon and select "New repository."
	- Enter a repository name and create it.
	- On the "Quick Setup" page, copy the remote repository URL (do not initialize with a README, license, or .gitignore if you already have these locally).
4. push local content to GitHub
	```
	git branch -M main
	git push -u origin main
	```
	There will be some kind of popup asking if you want to give permissions (authenticate?) on GitHub page (at least there was in eshell).  Say yes, and there will be passphrase and password options.  For passphrase, you're supposed to do something on your phone, which didn't work (passphrases installed on phone somehow?).  But using my GitHub password worked.
	
## Splitting refwrangle off of ref
Obsidian note updates in an code repo was unmanageable, so I created refwrangle as a new repo.

- [x] remove old refwrangle from ref
- [ ] ! Rename new refwrangle master branch to main.  
	- I accidentally created it as master while bitbucket's top page is main.  main also has a README.md
# Submodules in Git
## Obsidian Git Submodule
Obsidian's [[2024-07-30#Git Plugin]] has a way to use submodules, so I was thinking I could put the `refwrangle` code in one of those, under `ref`.  But I decided to instead keep it simple, and to make a new `refwrangle` repo.

- also [[Obsidian and GIT Repo]]