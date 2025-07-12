---
created date: 2025-03-26T09:31:15-07:00
modified date: 2025-07-12T10:48:32-05:00
---
All about git
# Creating a new github repo

## Installing GitHub CLI
From: [Explain how to create a new gi...](https://www.perplexity.ai/search/explain-how-to-create-a-new-gi-QKnEnyGcRj.iWZU6ujlvmQ#0)

First, install Node.js.

Then, for creating GitHub repositories, install the **GitHub CLI** (`gh` on the command line). On Windows, do:

```bash
winget install --id GitHub.cli
```

**Authenticate with GitHub** (first time only, after install):

```bash
gh auth login
```

Then
- select https protocol (easiest, [recommended](https://www.perplexity.ai/search/explain-how-to-create-a-new-gi-QKnEnyGcRj.iWZU6ujlvmQ#1))
- select `log in with web browser` 
	- (alternative is passkey which you somehow must have installed already on phone)
	- ? Is this just using google authenticator?
- on browser, select password ([recommended](https://www.perplexity.ai/search/explain-how-to-create-a-new-gi-QKnEnyGcRj.iWZU6ujlvmQ#2))
	- alternative is using a passkey: messier
- enter normal github login credentials
- copy the passkey it gives you
- paste it into the GitHub cli setup window
## Creating a Repository with GitHub CLI

Once GitHub CLI is installed, follow these steps[^2][^3][^4]:

2. **Navigate to your project directory**:

```bash
cd path/to/your/project
```

3. **Initialize Git** (if not already done):

```bash
git init
```

4. **Create the repository**:

```bash
# For interactive creation
gh repo create

# For non-interactive creation with specific options
gh repo create my-repo-name --public --source=. --remote=upstream --push
```


The `--public` flag makes the repository public, `--source=.` uses the current directory as the source, `--remote=upstream` sets the remote name, and `--push` automatically pushes your local commits to the new repository[^5][^6].

## Alternative Method

You can also create a repository and push your code in one command[^5]:

```bash
# Stage and commit your files first
git add .
git commit -m "initial commit"

# Create repo and push
gh repo create my-newrepo --public --source=. --remote=upstream --push
```


# Removing huge files from repo
I keep accidentally checking in huge .exe, .dll, .log, etc. files.  Getting rid of them, from [perplexity](https://www.perplexity.ai/search/in-git-how-do-i-see-the-origin-scLjmcQfRJCKgxu2CzgWAg#8).

## **Finding the Large Files**

### **Method 1: Using Git Commands to Find Large Files**

First, let's identify where these large files are located in your repository:

```bash
# Find all large files in your current checkout
git ls-tree -r --long HEAD | sort -k 4 -n -r | head -10
```

This will show you the 10 largest files in your repository with their paths[^1][^2].

### **Method 2: Using Windows File Explorer**

Since you're on Windows, you can also use the built-in search functionality:

1. **Open File Explorer** and navigate to your repository folder
2. **Click in the search box** and type: `size:>50MB`
3. This will show all files larger than 50MB in your repository[^3][^4]

You can also use the command prompt to find large files:

```cmd
# Find files larger than 50MB (52428800 bytes)
forfiles /S /M *.* /C "cmd /c if @fsize GEQ 52428800 echo @path @fsize"
```


## **Removing Large Files from Git History**

You have three main options for removing these files permanently from your Git history:

### **Option 1: Using git-filter-repo (Recommended)**

**Installation on Windows:**

```bash
# Install using pip
pip install git-filter-repo
```

If you encounter issues with the installation, you may need to copy the executable to your Git directory[^5][^6]:

1. After installation, find where pip installed it (usually in `Scripts` folder)
2. Copy `git-filter-repo.exe` to your Git core directory (run `git --exec-path` to find it)

**Usage:**

```bash
# Remove specific files by path
git filter-repo --path zmknote/dist/_MEI136362/mkl_avx512.2.dll --invert-paths
git filter-repo --path zmknote/dist/_MEI136362/mkl_core.2.dll --invert-paths

# Or remove all DLL files in that directory
git filter-repo --path zmknote/dist/_MEI136362/ --path-glob '*.dll' --invert-paths
```


### **Option 2: Using BFG Repo-Cleaner**

**Installation:**

1. Download the BFG jar file from the [official releases page](https://repo1.maven.org/maven2/com/madgag/bfg/1.14.0/bfg-1.14.0.jar)
2. Ensure you have Java 8 or later installed

**Usage:**

```bash
# First, create a mirror clone of your repo
git clone --mirror https://github.com/notuntoward/refwrangle.git

# Remove files larger than 50MB
java -jar bfg.jar --strip-blobs-bigger-than 50M refwrangle.git

# Clean up the repository
cd refwrangle.git
git reflog expire --expire=now --all && git gc --prune=now --aggressive

# Push the cleaned repository
git push
```


### **Option 3: Using git filter-branch (Legacy)**

```bash
# Remove specific files
git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch zmknote/dist/_MEI136362/mkl_avx512.2.dll' \
  --prune-empty --tag-name-filter cat -- --all

git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch zmknote/dist/_MEI136362/mkl_core.2.dll' \
  --prune-empty --tag-name-filter cat -- --all

# Clean up
git reflog expire --expire=now --all
git gc --prune=now --aggressive
```


## **Preventing Future Issues**

To prevent these files from being committed again in the future:

### **Create or Update .gitignore**

Add the following to your `.gitignore` file:

```gitignore
# Ignore the entire _MEI directories (these appear to be PyInstaller temp files)
*/_MEI*/
*/_MEI*/*

# Ignore large DLL files
*.dll

# Or more specifically:
zmknote/dist/_MEI*/
```


### **Remove Files from Current Working Directory**

If these files are still in your working directory and you don't need them:

```bash
# Remove the files from your working directory
rm -rf zmknote/dist/_MEI*

# Or on Windows Command Prompt:
rmdir /s zmknote\dist\_MEI136362
```


## **Final Steps**

After cleaning the repository history:

1. **Force push the cleaned repository:**

```bash
git push --force-with-lease origin main
```

2. **Verify the cleanup:**

```bash
# Check repository size
git count-objects -vH

# Verify the files are gone
git ls-tree -r --long HEAD | grep -E "(mkl_avx512|mkl_core)"
```

3. **Update your .gitignore** to prevent future commits of similar files

## **Important Notes**

- **Make a backup** of your repository before running any history-rewriting commands[^7][^8]
- **Coordinate with team members** if others are working on the repository, as they'll need to re-clone after history rewriting[^9][^10]
- **Force pushing** rewrites history, so use `--force-with-lease` for safety[^11]

The large DLL files you're seeing are likely PyInstaller temporary files (indicated by the `_MEI` directory name). These are generated during the build process and generally shouldn't be committed to version control. Using the `.gitignore` patterns above will prevent similar files from being committed in the future.

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