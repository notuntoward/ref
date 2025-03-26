---
created date: 2025-01-29T17:29:50-08:00
modified date: 2025-03-26T11:34:41-07:00
---

# Repo for Obsidian Git Plugin
The Obsidian [[2024-07-30#Git Plugin]] automatically or manually keeps notes under source code control.  It can (questionably) be a way to do [[Obsidian Multicomputer Sync]].

**Installed** 
# Bitbucket Repo
## Credentials
I have it set up with HTTPS authentication, and perplexity suggested that the reason I'm seeing an exclamation on my Sourcetree "remote" icon is that I need to refresh my "Personal Access Token".  This is the token I got from the bitbucket web page when I followed the steps.  This didn't get rid of the exclamation mark.
![[Pasted image 20250129174128.webp|388]]
### The private (I think) token above
ATCTT3xFfGN0LiSReih2xSTSXZNHjwCgUQ9AScnE3mm_lbw54mIppFIepD9Wwxzd06w7-K9RSzV4kiwZm0OekQ5o6LCg3nd59gQSNW53qBS4_we7xt_8i3_WSxb4Eoq9-x1CfADdzGxpVQ_lDUaJPUnLvKRdQsIjpAsXgcryxVqWQ8JjBrJS4fI=74EF4C45
### Next Token
Authorization: Bearer ATCTT3xFfGN0LiSReih2xSTSXZNHjwCgUQ9AScnE3mm_lbw54mIppFIepD9Wwxzd06w7-K9RSzV4kiwZm0OekQ5o6LCg3nd59gQSNW53qBS4_we7xt_8i3_WSxb4Eoq9-x1CfADdzGxpVQ_lDUaJPUnLvKRdQsIjpAsXgcryxVqWQ8JjBrJS4fI=74EF4C45
### Next token after that
git clone https://x-token-auth:ATCTT3xFfGN0LiSReih2xSTSXZNHjwCgUQ9AScnE3mm_lbw54mIppFIepD9Wwxzd06w7-K9RSzV4kiwZm0OekQ5o6LCg3nd59gQSNW53qBS4_we7xt_8i3_WSxb4Eoq9-x1CfADdzGxpVQ_lDUaJPUnLvKRdQsIjpAsXgcryxVqWQ8JjBrJS4fI=74EF4C45@bitbucket.org/urwald/ref.git
### The CLI command (which I did run)
git config user.email pcqzd21yhcv97s2i704qivdofgk6v9@bots.bitbucket.org
## Separating Obsidian and refwrangle code checkins
I put obsidian in the ref repo.  This turns out to be awful for source code control. When automatic, repeated obsidian checkins caused by little text edits flood the repo, making it very difficult to figure out which checkin also checked in code that's causing some bug.  **I've got to separate obsidian checkins from code checkins**

Combining obsidian and git might aggravate other Obsidian problems too, but I don't know that I've seen any: See [[Obsidian Multicomputer Sync#Disruptive Obsidian popup "has been modified externally, merging changes automatically"]]

### Does Obsidian Sync

