pipeline {
  agent any
  stages {
    stage('Lint and Build') {
      steps {
        echo 'Linting'
        sh 'sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.17.2/hadolint-Linux-x86_64 &&  sudo chmod +x /bin/hadolint'
        sh 'hadolint build/Dockerfile'
        echo 'Build Container'
        sh 'docker build -f build/Dockerfile . --tag=133823844190.dkr.ecr.us-west-2.amazonaws.com/udacity-hub:mywebapp'
        sh 'docker image ls'
      }
    }
    stage('Push Image to ECR') {
      steps {
        echo 'Pushing Image to AWS ECR'
        script {
          docker.withRegistry('http://133823844190.dkr.ecr.us-west-2.amazonaws.com', 'ecr:us-west-2:devops-user1') {
            sh 'docker push 133823844190.dkr.ecr.us-west-2.amazonaws.com/udacity-hub:mywebapp'
          }
        }
      }
    }
    stage('Deploy Infrastructure') {
      steps {
        echo 'Deploy AWS Infrastructure'
        sh 'ls -al blue-green-kube-deploy/'
        sh 'blue-green-kube-deploy/create.sh infra-stack blue-green-kube-deploy/bginfra.yml blue-green-kube-deploy/networkinfra-params.json'
      }
    }
    stage('Deploy Container in Cluster') {
      steps {
        echo 'Deploying Container in Cluster'
        sh 'blue-green-kube-deploy/create.sh app-stack blue-green-kube-deploy/deployapp.yml blue-green-kube-deploy/server-params.json'
      }
    }
  }
}
