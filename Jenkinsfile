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
    stage('Deploy Infrastructure and Cluster') {
      steps {
        sh 'git clone https://github.com/leetsg0/blue-green-kube-deploy.git'
        sh 'cd blue-green-kube-deploy'
        echo 'Deploy AWS Infrastructure'
        sh './create.sh infra-stack bginfra.yml networkinfra-params.json'
        echo 'Deploy Cluster'
        sh './create.sh app-stack deployapp.yml server-params.json'        
      }
    }
  }
}
