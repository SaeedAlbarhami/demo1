pipeline {
    agent any
    stages {
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
