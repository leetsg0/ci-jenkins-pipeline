@Library('github.com/releaseworks/jenkinslib') _

pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Build Container'
        sh 'ls'
        sh 'docker build -f build/Dockerfile . --tag=133823844190.dkr.ecr.us-west-2.amazonaws.com/udacity-hub:myhelloworld'
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
        docker.withRegistry('http://133823844190.dkr.ecr.us-west-2.amazonaws.com', 'ecr:us-west-2:devops-user1') {
          sh 'docker push 133823844190.dkr.ecr.us-west-2.amazonaws.com/udacity-hub:myhelloworld'
        }
      }
    }
  }
}
