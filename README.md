# Jenkins Day 1 – Hello World

## What I learned
- Installed Jenkins in Docker.
- Created a freestyle job that runs shell commands.
- Created a Declarative Pipeline with stages and steps.
- Understood the difference between freestyle and Pipeline.
- Why Jenkins is still widely used and how it compares to GitHub Actions.

## Commands

### Start Jenkins in Docker
```bash
docker network create jenkins
docker run -d --name jenkins --network jenkins -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins/jenkins:lts
docker logs jenkins   # get initial admin password
