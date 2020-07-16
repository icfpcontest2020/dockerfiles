# Submission system

## TL;DR

During the full round of the contest teams will be required to submit a small program.
To do so, a team will securely grant the access to its private Git repository to organizers.
We cannot disclose the nature of this program in advance, but we would like you to get acquainted with our submission system.
Please check that [there's a Dockerfile](https://github.com/icfpcontest2020/dockerfiles/tree/master/dockerfiles) for your programming language of choice and [send us a pull request](https://github.com/icfpcontest2020/dockerfiles/pulls) or [raise an issue](https://github.com/icfpcontest2020/dockerfiles/issues) if you have a suggestion or question.

## Getting started

ICFPC 2020 organizers believe that most teams use version control systems to store their code during the contest. We would like to encourage this good engineering practice, so we decided to accept submissions directly from Git repositories.

To submit code for ICFPC 2020, please:

1. Create a *private* Git repository that is accessible from the Internet. You are free to choose any cloud-based repository hosting like GitHub, BitBucket, GitLab, etc. We recommend using GitHub or GitLab because their free plans allow unlimited private repositories with unlimited collaborators. This way you can use a single repository to collaborate on your code and to submit it. Please, refer to [GitHub](https://help.github.com/en/github/getting-started-with-github/create-a-repo) or [GitLab](https://docs.gitlab.com/ee/gitlab-basics/create-project.html) documentation to learn more.
2. We suggest that you use one of our starter kits as a starting point for your repository. You can find starter kits for all the supported platforms among the repositories published by our [GitHub organization](https://github.com/icfpcontest2020). Should you choose not to clone any of our starter kits, please note that you are required to have `.platform`, `build.sh` and `run.sh` files in the root of your repository. The purpose of these files is explained later in this document.
3. Copy clone URL of your new repository and use it to register your team on the ICFPC web site. You should select the SSH clone option, so your URL looks like this: `git@github.com:teamname/reponame.git`.
4. After the start of ICFPC, get your personal SSH key from organizers. Grant read access for that key to your repository. If you're using GitHub, this option is available under Settings → Deploy keys (see [documentation](https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys) to learn more). If you're using GitLab, this option is available under Settings → Repository → Deploy Keys (expand) (see [documentation](https://docs.gitlab.com/ee/ssh/#deploy-keys) to learn more).
5. Create a branch called `submission` in your repository. You can also create additional optional branches called `submissions/*` if you need. Only the code from these branches (not `master`!) will be considered as a submission. You can use other branches as you like, e.g. for active development.

## Docker images

To support as many platforms, frameworks and programming languages as possible, ICFPC 2020 organizers use [Docker](https://docs.docker.com) to run and evaluate team's submissions.

`Dockerfile` is essentially a list of instructions required to build an executable from your source code.

In an effort to put all teams in similar positions, we won't require any Docker knowledge and won't allow custom Dockerfiles written by teams. This repository contains pre-written Dockerfiles for popular languages and frameworks (see `dockerfiles` directory). Only these Dockerfiles will be allowed by our submission system.

If your favorite language is missing, or you know a way to improve existing Dockerfiles, please [raise an issue](https://github.com/icfpcontest2020/dockerfiles/issues) or [open a pull request](https://github.com/icfpcontest2020/dockerfiles/pulls) in this repository at any time before or during the contest.

## Submission mechanism

Submission system continuously checks every team's repository for updates in the `submission` and `submissions/*` branches (`refs/heads/submission` and `refs/heads/submissions/*` to be accurate). All other branches are ignored. New commits trigger a build which has the following steps:

1. Clone the repository into a clean directory, check out the appropriate branch.
2. Read the first word from the `.platform` file.
3. Create/replace a Dockerfile in the root directory with contents from `dockerfiles/<platform>/Dockerfile` of _this_ repository (not your team's repository). `<platform>` is the word from step 2.
4. Run `docker build .`. This step will run the `build.sh` script in your repository. Resulting image will be tagged with the commit hash and appear in the list of your submissions in your profile on the ICFPC web site, along with build logs. Assuming everything went well, your submission is now accepted and ready to run.

There will be no Internet access during build. You will be limited to what your base Docker image provides and to the contents of your repository.

Build time will be limited to _10 minutes_.

## Running mechanism

Docker image built from your code will be started with a `docker run` command. This command will run the `run.sh` script in your repository.

Command line arguments will be provided to your program. Your code won't have access to the Internet. However, your program will have to communicate with a remote server of organizers via HTTP.
