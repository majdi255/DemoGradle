pipeline {
    agent any
    stages {
        stage('test') {
            agent { 
                docker { 
                    image 'openjdk:17'
                    args '-v $HOME/.gradle:/root/.gradle'
                    reuseNode true
                } 
            }
            steps {
                sh 'bash ./gradlew test'
            }
        }
        stage('build-jar') {
            agent { 
                docker { 
                    image 'openjdk:17'
                    args '-v $HOME/.gradle:/root/.gradle'
                    reuseNode true
                } 
            }
            steps {
                sh 'bash ./gradlew bootJar'
            }
        }
        stage('build-image') {
            steps {
                sh 'docker build -t DemoGradle .'
            }
        }
    }
}
