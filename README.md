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

# Jenkins Day 2 – GitHub Integration & Trigger on Push

## What I learned
- Connected Jenkins to GitHub using a Personal Access Token.
- Created a Pipeline that pulls code and builds a Docker image.
- Set up SCM Polling to automatically trigger builds on push.
- Understood webhooks vs polling.

## Files
- `app.py` – simple Flask app.
- `Dockerfile` – builds the Flask image.
- `Jenkinsfile` – declarative pipeline with Checkout, Build, Test stages.

## Jenkins job configuration
- Pipeline from SCM (Git)
- Poll SCM: `* * * * *`
- Builds on every push (within 1 minute)

## Commands to set up webhook (alternative)
```bash
ngrok http 8080   # expose Jenkins
# Use the ngrok URL in GitHub webhook: <ngrok-url>/github-webhook/

# Jenkins Day 3 – Push to Docker Hub & Deploy to K8s

## What I learned
- Securely storing Docker Hub credentials in Jenkins.
- Using environment variables and `withCredentials` in a Pipeline.
- Tagging images with `BUILD_NUMBER` for unique versions.
- Installing `kubectl` in Jenkins and connecting it to Minikube.
- Updating a Kubernetes Deployment via `kubectl set image` in a pipeline.

## Files
- `Jenkinsfile` – complete CI/CD pipeline (build → push → deploy).
- `app.py`, `Dockerfile` – Flask app.
- `k8s-flask.yaml` – Deployment and Service.

## Pipeline overview
1. Build Docker image
2. Push to Docker Hub (`amoghkrrish/flask-jenkins-cicd:v${BUILD_NUMBER}`)
3. Deploy to Kubernetes (`kubectl set image`)
