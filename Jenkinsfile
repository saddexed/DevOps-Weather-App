pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t weather-app:${BUILD_NUMBER} .'
            }
        }
        stage('Run Container') {
            steps {
                sh 'docker rm -f weather-app || true'
                sh 'docker run -d -p 8080:80 --name weather-app weather-app:${BUILD_NUMBER}'
            }
        }
    }
    post {
        always {
            sh 'docker rm -f weather-app || true'
        }
    }
}