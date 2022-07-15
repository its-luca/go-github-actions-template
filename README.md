# go-github-actions-template
Template for CI/CD Workflow with Github actions

## Docker registry
I was unable to configure docker push to work with the auto managed GITHUB_TOKEN.
For now, you need to pace a write access token to a secret called `docker` (Under `Settings->Secrets`).

## Protected main workflow
Go to `Settings->Branches->Add branch protection rule` and check `Require status checks to pass before merging`.
For normal accounts, this is only enforced on public repos.

## Dependabot
Regardless of the update config in `.github/dependabot.yml` file, Dependabot needs to be enabled in `Settings->Code security and analysis`.