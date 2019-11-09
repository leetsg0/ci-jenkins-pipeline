pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Build Code'
        sh 'ls'
      }
    }
    stage('Test') {
      steps {
        sh '''#!/bin/bash
        echo "Testing"'''
        sh 'ansible --version'
      }
    }
    stage('Deploy') {
      steps {
        echo 'Deploying to Cluster'
      }
    }
  }
}
