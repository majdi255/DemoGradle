pipeline {
    agent { docker { image 'openjdk:17' } }
    stages {
        stage('test') {
            steps {
                sh './gradlew test'
            }
        },
        stage('build') {
            steps {
                sh '''
                    ./gradlew bootJar
                    docker build -t DemoGradle .
                '''
            }
        }
    }
}
