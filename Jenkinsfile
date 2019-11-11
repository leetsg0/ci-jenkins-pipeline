pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Build Code'
        sh 'ls'
        sh 'aws s3 ls'
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
    stage('Deploy') {
      steps {
        echo 'Deploying to Cluster'
      }
    }
  }
}
