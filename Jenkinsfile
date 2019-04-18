pipeline {
    agent any
    stages {
        stage('---clean---') {
            def mvnHome =  tool name: 'maven-3', type: 'maven'   
            sh "${mvnHome}/bin/mvn package"
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
