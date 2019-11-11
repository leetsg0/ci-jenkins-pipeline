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
      }
    }
  }
}
