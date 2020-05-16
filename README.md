# Submission system

## Getting started

ICFPC 2020 organizers believe that most teams use version control systems to store their code during the contest. We would like to encourage this good engineering practice, so we decided to accept submissions directly from Git repositories.

To submit code for ICFPC 2020, please:

1. Create a *private* Git repository that is accessible from the Internet. You are free to choose any cloud-based repository hosting like GitHub, BitBucket, GitLab, etc. We recommend using GitLab, because its free plan allows unlimited private repositories with unlimited collaborators. This way you can use a single repository to collaborate on your code and to submit it. Please, refer to GitLab [documentation](https://docs.gitlab.com/ee/gitlab-basics/create-project.html) to learn more.
2. Copy clone URL of your new repository and use it to register your team on the ICFPC web site. You should select the SSH clone option, so your URL looks like this: `git@gitlab.com:teamname/reponame.git`.
3. Get your personal SSH key from your team's profile on the ICFPC web site. Grant read access for that key to your repository. If you're using GitLab, this option is available under Settings → CI / CD → Deploy Keys. Please, refer to GitLab [documentation](https://docs.gitlab.com/ee/ssh/#deploy-keys) to learn more.
4. Create a branch called `submission` in your repository. You can also create additional optional branches called `submissions/*` if you need. Only the code from these branches (not `master`!) will be considered as a submission. You can use other branches as you like, e.g. for active development.

## Docker images

To support as many platforms, frameworks and programming languages as possible, ICFPC 2020 organizers use [Docker](https://docs.docker.com) to run and evaluate team's submissions.

`Dockerfile` is essentially a list of instructions required to build an executable from your source code.

In an effort to put all teams in similar positions, we won't require any Docker knowledge and won't allow custom Dockerfiles written by teams. This repository contains pre-written Dockerfiles for popular languages and frameworks (see `dockerfiles` directory). Only these Dockerfiles will be allowed by our submission system.

If your favorite language is missing, or you know a way to improve existing Dockerfiles, please raise an issue or open a pull request in this repository at any time before or during the contest. Note that we won't accept any suggestions that give significant advantage to one platform or team over the others. For example, it's OK to add JSON parsing or HTTP request library as a dependency, but it's not OK to add a precalculated binary file for your team's program.

## Submission mechanism

Submission system continuously checks every team's repository for updates in the `submission` and `submissions/*` branches. All other branches are ignored. New commits trigger a build which has the following steps:

1. Clone the repository into a clean directory, check out the appropriate branch.
2. Read the first word from the `.platform` file.
3. Create/replace a Dockerfile in the root directory with contents from `dockerfiles/<platform>/Dockerfile` of _this_ repository (not your team's repository). `<platform>` is the word from step 2.
4. Run `docker build`. Resulting image will be tagged with the commit hash and appear in the list of your submissions in your profile on the ICFPC web site, along with build logs. Assuming everything went well, your submission is now accepted and ready to play.

## Running mechanism

Docker image built from your code will be started with a `docker run` command.

Two command line arguments will be provided to your program: server URL and player key. Please, note that your code must communicate with the server URL provided in the command line, using provided player key. Your code won't have access to the Internet.

## Limits

TODO
