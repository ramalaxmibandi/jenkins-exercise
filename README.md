Added the Docker Hub and GitHub Credentials to Jenkins for authentication.
Created project files (Jenkinsfile and a Dockerfile etc) for build and deployment and pushed them to GitHub.
In Build pipeline added stages to get the code from Git repository , build image, login into the docker hub and push the image into docker hub.
In Deployment pipe line:
For first stage Created shell script named latest_image.sh to get latest image version tag from docker hub account.
For second stage Created shell script named image_replace.sh to replace the latest image version tag in kubernetes deployment.yaml file.
In third stage used command cat deployment.yaml file to show the image got changed.
Created Triggering a new build of deployment-pipeline after successful running of build pipeline.
