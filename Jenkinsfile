pipeline {
    agent any
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
    stages{
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
                 sh './latest-image.sh ramalaxmi/devops-integration'   
                }
            }
            
        }
    }
       stage('Push image to Hub') {
           steps {
                sh 'docker push ramalaxmi/devops-integration:$BUILD_NUMBER'
               }
           }

    }
}
