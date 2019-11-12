@Library('github.com/releaseworks/jenkinslib') _

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
        withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'aws-key', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY']]) {
          AWS("s3 ls")
        }
      }
    }
  }
}
