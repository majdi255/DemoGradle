pipeline {
    agent { 
        docker { 
            image 'openjdk:17'
            args '-v $HOME/.gradle:/root/.gradle'
            reuseNode true
        } 
    }
    stages {
        stage('test') {
            steps {
                sh 'bash ./gradlew test'
            }
        }
        stage('build') {
            steps {
                sh '''
                    #!/bin/bash
                    ./gradlew bootJar
                    docker build -t DemoGradle .
                '''
            }
        }
    }
}
