pipeline {
    agent any
    stages {
        stage('---clean---') {
            steps {
                echo 'cleaning..'
                echo 'cleaning..'
                mvn clean
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
