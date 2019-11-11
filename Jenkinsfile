pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Build Container'
        sh 'ls'
        sh 'sudo docker build -f build/Dockerfile . --tag=myhelloworld'
        sh 'sudo docker image ls'
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
      }
    }
  }
}
