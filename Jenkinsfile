pipeline {
    agent any
    stages {
        stage('test') {
            agent {
                docker {
                    image 'openjdk:21'
                    args '-v $HOME/.gradle:/root/.gradle'
                    reuseNode true
                }
            }
            steps {
                sh './gradlew test'
            }
        }
        stage('build-jar') {
            agent {
                docker {
                    image 'openjdk:21'
                    args '-v $HOME/.gradle:/root/.gradle'
                    reuseNode true
                }
            }
            steps {
                sh './gradlew bootJar'
            }
        }
        stage('build-image') {
            steps {
                sh 'docker build -t demo-gradle:latest .'
            }
        }
        stage('deploy') {
            steps {
                sh 'docker-compose up -d'
            }
        }
    }
}