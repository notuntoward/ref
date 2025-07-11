---
created date: 2025-07-10T12:30:36-05:00
modified date: 2025-07-10T22:04:49-05:00
---
Google's new AI coding command line interface.

# Creating a New Bitbucket Repository Using Gemini CLI Terminal Tool

From: [Perplexity](https://www.perplexity.ai/search/i-m-interesting-in-using-googl-iShFqSW7TNyz6i4gQDtkFw#2)

Based on the previous conversation and research, here's a comprehensive guide on how to use **Gemini CLI's terminal tool** to create a new Bitbucket repository through API automation.

## Prerequisites

Before using Gemini CLI to create Bitbucket repositories, you'll need:

1. **Gemini CLI installed**: `npm install -g @google/gemini-cli`[^1][^2]
2. **Bitbucket account** with API access
3. **Bitbucket App Password** (required for API authentication)[^3][^4]
4. **Basic authentication credentials** (username and app password)

## Setting Up Bitbucket App Password

Since Bitbucket Cloud stopped supporting regular account passwords for API authentication, you must create an app password[^3][^4]:

1. Log into your Bitbucket account
2. Go to **Personal Settings > App Passwords**
3. Click **Create App Password**
4. Select scopes: **Repositories: Write** (minimum required)
5. Copy the generated app password for later use

## Gemini CLI Prompt for Repository Creation

Launch Gemini CLI and use the following comprehensive prompt to automate the entire Bitbucket repository creation process:

```
Create a new Bitbucket repository using the following workflow:

1. Use curl to create a new private repository via Bitbucket REST API 2.0
2. Repository details:
   - Name: "my-new-project"
   - Owner: [YOUR_USERNAME]
   - Private repository
   - Git SCM
   - Description: "Automated repository creation via Gemini CLI"

3. After successful creation, initialize a local git repository
4. Add a README.md file
5. Configure git remote and push initial commit

Use these API details:
- Endpoint: https://api.bitbucket.org/2.0/repositories/[USERNAME]/[REPO_NAME]
- Authentication: Username and app password (Basic Auth)
- Content-Type: application/json

Please execute each step and confirm success before proceeding to the next.
```


## Expected Gemini CLI Automation Steps

Gemini CLI will execute the following sequence using its **terminal tool**[^1][^2]:

### Step 1: Repository Creation via API

```bash
curl -X POST \
  -u "USERNAME:APP_PASSWORD" \
  -H "Content-Type: application/json" \
  -d '{
    "scm": "git",
    "is_private": true,
    "fork_policy": "no_public_forks",
    "description": "Automated repository creation via Gemini CLI"
  }' \
  "https://api.bitbucket.org/2.0/repositories/USERNAME/my-new-project"
```


### Step 2: Local Repository Initialization

```bash
mkdir my-new-project
cd my-new-project
git init
```


### Step 3: Initial Content Creation

```bash
echo "# My New Project

This repository was created using Gemini CLI automation.

## Getting Started

Add your project description here." > README.md
```


### Step 4: Git Configuration and Push

```bash
git add README.md
git commit -m "Initial commit: Add README"
git remote add origin https://USERNAME@bitbucket.org/USERNAME/my-new-project.git
git push -u origin master
```


## Advanced Automation Options

For more sophisticated repository setup, you can extend the Gemini CLI prompt:

```
Create a complete Bitbucket repository setup with:

1. Repository creation with custom settings
2. Local project scaffolding:
   - Initialize uv Python environment
   - Create pyproject.toml with dependencies
   - Add .gitignore for Python
   - Create basic project structure (src/, tests/, docs/)
3. Initial commit and push
4. Set up branch protection rules (if available via API)

Make this a reusable script that I can customize for future projects.
```


## Key API Parameters for Bitbucket Repository Creation

| Parameter | Description | Example Values |
| :-- | :-- | :-- |
| `scm` | Source control type | `"git"`, `"hg"` |
| `is_private` | Repository visibility | `true`, `false` |
| `fork_policy` | Fork permissions | `"allow_forks"`, `"no_public_forks"`, `"no_forks"` |
| `has_wiki` | Enable wiki | `true`, `false` |
| `has_issues` | Enable issue tracker | `true`, `false` |
| `project` | Assign to project | `{"key": "PROJECT_KEY"}` |

## Error Handling and Troubleshooting

Common issues Gemini CLI might encounter and resolve:

1. **Authentication Errors**: Ensure app password has correct scopes[^5][^3]
2. **Repository Name Conflicts**: API returns 400 if repository already exists[^6]
3. **Permission Issues**: Verify workspace/team permissions for repository creation[^7][^6]
4. **API Rate Limits**: Bitbucket API has rate limiting that may require retry logic

## Benefits of Using Gemini CLI for Repository Creation

1. **Interactive Guidance**: Gemini CLI provides step-by-step execution with approval prompts[^1]
2. **Error Recovery**: Can automatically retry failed commands or suggest alternatives
3. **Documentation**: Automatically documents the process and commands used
4. **Customization**: Can adapt the workflow based on your specific requirements
5. **Integration**: Seamlessly combines API calls with local git operations

## Security Considerations

- **Never hardcode credentials** in scripts - use environment variables
- **App passwords should be scoped minimally** to required permissions only
- **Store app passwords securely** and rotate them regularly
- **Review Gemini CLI commands** before execution, especially with `--yolo` mode disabled

This approach leverages Gemini CLI's terminal tool capabilities to automate the complete workflow of creating a Bitbucket repository, from API calls to local setup, providing a seamless developer experience while maintaining security best practices.

<div style="text-align: center">⁂</div>

[^1]: https://cloud.google.com/gemini/docs/codeassist/gemini-cli

[^2]: https://www.marktechpost.com/2025/06/28/getting-started-with-gemini-command-line-interface-cli/

[^3]: https://www.atlassian.com/blog/bitbucket/app-passwords-bitbucket-cloud

[^4]: https://www.youtube.com/watch?v=BvHLCTGapu0

[^5]: https://community.atlassian.com/forums/Bitbucket-questions/App-password-doesn-t-work-with-REST-API/qaq-p/2188579

[^6]: https://community.atlassian.com/forums/Bitbucket-questions/Create-repository-to-an-existing-project-using-API-2-0-on/qaq-p/1513471

[^7]: https://stackoverflow.com/questions/38347458/bitbucket-api-2-create-repository-in-a-team-project

[^8]: https://community.atlassian.com/forums/Bitbucket-questions/create-repository-from-command-line/qaq-p/639349

[^9]: https://codelabs.developers.google.com/genai-for-dev-bitbucket-code-review?hl=zh-cn

[^10]: https://stackoverflow.com/questions/55058509/getting-error-with-curl-while-using-bitbucket-rest-api

[^11]: https://stackoverflow.com/questions/67237993/how-to-create-bitbucket-repositories-from-cli-on-the-hosting-server

[^12]: https://pipedream.com/apps/google-gemini/integrations/bitbucket

[^13]: https://stackoverflow.com/questions/38752978/how-to-create-bitbucket-repository-using-curl/38755051

[^14]: https://cloud.google.com/developer-connect/docs/connect-bitbucket-cloud

[^15]: https://www.youtube.com/watch?v=FKDFKUfP1iA

[^16]: https://community.atlassian.com/forums/Bitbucket-questions/Trying-to-create-new-repo-using-API-v2-and-curl-via-shell-script/qaq-p/874733

[^17]: https://codelabs.developers.google.com/genai-for-dev-bitbucket-code-review

[^18]: https://ai.google.dev/gemini-api/docs/api-key

[^19]: https://stackoverflow.com/questions/54200009/curl-get-raw-file-from-bitbucket-repository-with-security/63526118

[^20]: https://support.atlassian.com/bitbucket-cloud/docs/create-a-git-repository/

[^21]: https://cloud.google.com/gemini/docs/codeassist/code-customization

[^22]: https://stackoverflow.com/questions/18278944/create-bitbucket-repository-and-service-in-one-curl-request

[^23]: https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/How-to-git-push-an-existing-project-to-Bitbucket

[^24]: https://www.reddit.com/r/singularity/comments/1lk5h19/google_introduces_gemini_cli_a_light_opensource/

[^25]: https://github.com/google-gemini/gemini-cli/actions/runs/16023051607/workflow

[^26]: https://guides.co/g/bitbucket-101/11156

[^27]: https://www.datacamp.com/tutorial/gemini-cli

[^28]: https://stackoverflow.com/questions/15178328/bitbucket-services-api-to-create-post-service

[^29]: https://stackoverflow.com/questions/55937529/bitbucket-api-authentication-using-curl-postman

[^30]: https://community.atlassian.com/forums/Bitbucket-questions/Trying-to-initialise-repository-via-REST-API/qaq-p/785283

[^31]: https://developer.atlassian.com/cloud/bitbucket/rest/api-group-other-operations/

[^32]: https://community.atlassian.com/forums/Bitbucket-questions/Created-repository-via-API-creates-personal/qaq-p/1533955

[^33]: https://stackoverflow.com/questions/52559416/upload-ssh-public-key-to-bitbucket-cloud-using-curl-rest-and-token

[^34]: https://developer.atlassian.com/cloud/bitbucket/rest/

[^35]: https://stackoverflow.com/questions/46260385/create-a-repository-with-bitbucket-2-0-api-and-node-js

[^36]: https://stackoverflow.com/questions/60501391/how-can-we-create-bitbucket-repository-using-curl-and-credential-using-ssh-key

[^37]: https://stackoverflow.com/questions/30367701/create-new-repo-on-bitbucket-from-php-curl

[^38]: https://stackoverflow.com/questions/48313236/how-to-create-repository-in-bitbucket-via-calling-rest-api-using-golang

[^39]: https://community.atlassian.com/t5/Bitbucket-questions/Repo-creation-using-api/qaq-p/1525029

[^40]: https://community.atlassian.com/forums/Bitbucket-questions/How-do-i-create-a-bitbucket-repo-using-REST-API-in-our-company/qaq-p/936846

[^41]: https://qiita.com/zaki-yama/items/4f8eb0db6fc0fa18cdce

[^42]: https://www.devzery.com/post/bitbucket-api-comprehensive-guide-examples-2024

[^43]: https://stackoverflow.com/questions/78564261/gemini-api-curl-command-successfully-calls-api-but-my-program-does-not

[^44]: https://www.youtube.com/watch?v=xqvprnPocHs

[^45]: https://cloud.google.com/sdk/gcloud/reference/gemini/code-repository-indexes/create

[^46]: https://www.youtube.com/watch?v=HhgilVNjYeA

[^47]: https://github.com/deniskropp/gemini-repo-cli

[^48]: https://www.zdnet.com/article/geminis-command-line-tool-is-a-hidden-productivity-game-changer-and-its-free/

[^49]: https://github.com/reugn/gemini-cli

[^50]: https://www.youtube.com/watch?v=we2HwLyKYEg

[^51]: https://github.com/avivelbag/gemini-cli

[^52]: https://dev.to/shahidkhans/a-practical-guide-to-gemini-cli-941

[^53]: https://dev.to/shahidkhans/gemini-cli-the-ai-powered-command-line-revolution-for-developers-a7e

[^54]: https://www.reddit.com/r/GoogleGeminiAI/comments/1lkol0m/gemini_cli_a_comprehensive_guide_to_understanding/

[^55]: https://github.com/google-gemini/gemini-cli/issues/3253

[^56]: https://pro.tecmint.com/blog/install-gemini-cli-on-linux/

[^57]: https://blog.google/technology/developers/introducing-gemini-cli-open-source-ai-agent/
