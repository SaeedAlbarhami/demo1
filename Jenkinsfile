pipeline {
  agent any
  stages {
    stage('---clean 1---') {
      agent { label 'maven' }
      steps {
        echo 'Hello from maven slave'
        sh 'mvn -version'
        container('maven') {
          echo 'In container maven...'
          sh 'source /usr/local/bin/scl_enable && maven --version'
        }
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
