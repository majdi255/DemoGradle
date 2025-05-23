pipeline {
    agent any
    stages {
        stage('test') {
            agent {
                docker {
                    image 'public.ecr.aws/amazoncorretto/amazoncorretto:21'
                    args '-u root:root -e JAVA_OPTS=-XX:UseSVE=0 -v $HOME/.gradle:/root/.gradle'
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
                    args '-u root:root -e JAVA_OPTS=-XX:UseSVE=0 -v $HOME/.gradle:/root/.gradle'
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
        stage('deploy') {
            steps {
                sh 'docker compose up -d'
            }
        }
    }
    post {
        always {
            junit '**/build/test-results/**/*.xml'
        }
    }
}