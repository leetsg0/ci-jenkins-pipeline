pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Build Code'
      }
    }
    stage('Test') {
      steps {
        sh '''#!/bin/bash
        echo "Testing"'''
      }
    }
    stage('Deploy') {
      steps {
        echo 'Deploying to Cluster'
      }
    }
  }
}
