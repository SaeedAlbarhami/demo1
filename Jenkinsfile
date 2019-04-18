pipeline {
  agent any
  stages {
    stage('---clean 1---') {       
      steps {
        echo 'Hello from maven slave'
        def mvn_version = 'M3'
          withEnv( ["PATH+MAVEN=${tool mvn_version}/bin"] ) {
            sh "mvn clean package"
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
