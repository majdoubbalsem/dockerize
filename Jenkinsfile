pipeline {
  agent any  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t balsem/api api/'
        sh 'docker build -t balsem/ui ui/'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push balsem/api'
        sh 'docker push balsem/ui'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
