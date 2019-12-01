pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Build Container'
        sh 'ls'
        sh 'docker build -f build/Dockerfile . --tag=133823844190.dkr.ecr.us-west-2.amazonaws.com/udacity-hub:mywebapp'
        sh 'docker image ls'
      }
    }
    stage('Test') {
      steps {
        sh '''#!/bin/bash
        echo "Testing"'''
        sh 'ansible --version'
        sh 'docker --version'
        sh 'sudo apt install -y make'
        sh 'wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.17.2/hadolint-Linux-x86_64 &&  sudo chmod +x /bin/hadolint'
        sh 'hadolint build/Dockerfile'
      }
    }
    stage('Push Image') {
      steps {
        echo 'Pushing Image to AWS ECR'
        script {
          docker.withRegistry('http://133823844190.dkr.ecr.us-west-2.amazonaws.com', 'ecr:us-west-2:devops-user1') {
            sh 'docker push 133823844190.dkr.ecr.us-west-2.amazonaws.com/udacity-hub:mywebapp'
          }
        }
      }
    }
  }
}
