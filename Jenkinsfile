pipeline {
    agent any
    stages {
        stage('Compile-Package'){    
          def mvnHome =  tool name: 'maven-3', type: 'maven'   
          sh "${mvnHome}/bin/mvn package"
        }
        stage('---clean---') {
            steps {
                echo 'cleaning..'
                echo 'cleaning.. 1'
                sh "mvn clean"
            }
        }
        stage('--test--') {
            steps {
                echo 'testing '
            }
        }
        stage('--package--') {
            steps {
                echo 'packaging'
            }
        }
    }
}
