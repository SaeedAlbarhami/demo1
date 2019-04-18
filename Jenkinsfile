pipeline {
    agent any
    stages {
        stage('---clean---') {
            steps {
                echo 'cleaning..'
                echo 'cleaning..'
                def mvnHome =  tool name: 'maven-3', type: 'maven'   
                sh "${mvnHome}/bin/mvn clean"
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
