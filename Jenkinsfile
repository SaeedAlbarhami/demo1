pipeline {
  agent any
  stages {
    stage('---clean---') {
      steps {
        sh 'mvn clean -f demo'
      }
    }
    stage('--test--') {
      steps {
        sh 'mvn test'
      }
    }
    stage('--package--') {
      steps {
        sh 'mvn package'
      }
    }
  }
}
