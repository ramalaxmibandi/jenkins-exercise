pipeline {
    agent any
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
    stages{
        stage('git checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ramalaxmibandi/jenkins-exercise.git']]])
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t ramalaxmi/devops-integration:$BUILD_NUMBER .'
                }
            }
        }
        stage('Login') {
            steps {
                 sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
        stage('latest image of docker') {
            steps {
                script {
                 sh './latest-image.sh ramalaxmi/devops-integration' >> https://github.com/ramalaxmibandi/jenkins-exercise/out1   
                }
            }
            
        }
    }
      // stage('Push image to Hub') {
           steps {
                sh 'docker push ramalaxmi/devops-integration:$BUILD_NUMBER'
               }
           }

    }
}
