pipeline {
  agent any
  stages {
    stage('---clean 1---') {
      steps {
        echo 'hi how are u'
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
