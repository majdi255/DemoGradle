pipeline {
    agent any
    stages {
        stage('test') {
            agent {
                docker {
                    image 'public.ecr.aws/amazoncorretto/amazoncorretto:21'
                    args '-u root:root -v $HOME/.gradle:/root/.gradle'
                    reuseNode true
                }
            }
            steps {
                withGradle {
                    sh './gradlew test'
                }
            }
        }
        stage('build-jar') {
            agent {
                docker {
                    image 'public.ecr.aws/amazoncorretto/amazoncorretto:21'
                    args '-u root:root -v $HOME/.gradle:/root/.gradle'
                    reuseNode true
                }
            }
            steps {
                withGradle {
                    sh './gradlew bootJar'
                }
            }
        }
        stage('build-image') {
            steps {
                sh 'docker build -t demo-gradle:latest .'
            }
        }
    }
    post {
        always {
            junit '**/build/test-results/**/*.xml'
        }
    }
}