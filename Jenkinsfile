properties([
    parameters(
        [
            booleanParam(name: 'DEPLOY_BRANCH_TO_TST', defaultValue: false)
        ])
    ])

def branch
def revision
def registryIp

pipeline {
     parameters {
        string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')

        text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')

        booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value')

        choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')

        password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')

        file(name: "FILE", description: "Choose a file to upload")
     }
      environment {
            DockerCred = credentials('DockerCred')
        }
        agent {
        kubernetes {
            label 'build-service-pod'
            defaultContainer 'jnlp'
            yaml """
            apiVersion: v1
            kind: Pod
            metadata:
              labels:
                job: build-service
            spec:
              containers:
              - name: maven
                image: maven:3.6-jdk-8-alpine
                command: ["cat"]
                tty: true
                volumeMounts:
                - name: repository
                  mountPath: /root/.m2/repository
              - name: docker
                image: docker:18.09.2
                command: ["cat"]
                tty: true
                volumeMounts:
                - name: docker-sock
                  mountPath: /var/run/docker.sock
              volumes:
              - name: repository
                persistentVolumeClaim:
                  claimName: jenkins
              - name: docker-sock
                hostPath:
                  path: /var/run/docker.sock
            """
        }
    }
    options {
        skipDefaultCheckout true
    }

    stages {
        stage ('checkout') {
            steps {
                script {
                    def repo = checkout scm
                    revision = sh(script: 'git log -1 --format=\'%h.%ad\' --date=format:%Y%m%d-%H%M | cat', returnStdout: true).trim()
                    branch = repo.GIT_BRANCH.take(20).replaceAll('/', '_')
                    if (branch != 'master') {
                        revision += "-${branch}"
                    }
                    sh "echo 'Building revision: ${revision}'"
                }
            }

        }
        stage ('clean and compile') {
            steps {
                container('maven') {
                    sh 'mvn clean compile'
                }
            }
        }
        stage ('unit test') {
            steps {
                container('maven') {
                    sh 'mvn test'
                }
            }
        }
        stage ('integration test') {
            steps {
                container ('maven') {
                    sh 'mvn verify'
                }
            }
        }
        stage ('build artifact') {
            steps {
                container('maven') {
                    sh "mvn package -Dmaven.test.skip -Drevision=${revision}"
                }
                container('docker') {
                     script {
                        registryIp = 'saeedalbarhami'
                        sh "docker build . -t ${registryIp}/demo1:${revision} --build-arg REVISION=${revision}"
                    }
                }
            }
        }
        stage ('publish artifact') {
            when {
                expression {
                    branch == 'master' || params.DEPLOY_BRANCH_TO_TST
                }
            }
            steps {
                container('docker') {
                        script {
                          docker.withRegistry( '', DockerCred ) {
                           sh "docker push ${registryIp}/demo1:${revision}"
                          }
                        }
            }
        }
        stage ('deploy to env') {
            when {
                expression {
                    branch == 'master' || params.DEPLOY_BRANCH_TO_TST
                }
            }
            steps {
                
                 echo 'Thank you '
            }
        }
    }
}
