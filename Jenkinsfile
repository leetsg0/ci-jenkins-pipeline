pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Build Code'
        ls
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
