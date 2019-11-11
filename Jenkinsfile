pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Build Container'
        sh 'ls'
        sh 'docker build -f build/Dockerfile . --tag=myhelloworld'
        sh 'docker image ls'
      }
    }
    stage('Test') {
      steps {
        sh '''#!/bin/bash
        echo "Testing"'''
        sh 'ansible --version'
        sh 'docker --version'
      }
    }
    stage('Container Push') {
      steps {
        echo 'Push Container to AWS ECR'
        docker.withRegistry('https://133823844190.dkr.ecr.us-west-2.amazonaws.com/udacity', 'ecr:us-west-2:udacity-ecr-credentials') {
          docker.image('myhelloworld').push('latest')
        }
      }
    }
  }
}
