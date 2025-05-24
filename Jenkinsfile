pipeline {
    agent any
    stages {
        stage('build-jar') {
            agent {
                docker {
                    image 'public.ecr.aws/amazoncorretto/amazoncorretto:21'
                    args '-u root:root -v $HOME/.gradle:/root/.gradle'
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
    }
}