pipeline {
    agent any
  environment {
    DOCKERHUB_CREDENTIALS = credentials('Dockerhub')
  }
    stages{
        stage('git checkin'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ramalaxmibandi/jenkins-pipeline.git']]])
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t ramalaxmi/myimage:$BUILD_NUMBER .'
                }
            }
        }
        stage('Login') {
            steps {
                 sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }


       stage('Push image to Hub') {
           steps {
                sh 'docker push ramalaxmi/myimage:$BUILD_NUMBER'
               }
           }

    }
}
