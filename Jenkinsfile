pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("weather-forecast-app")
                }
            }
        }
        stage('Run Container') {
            steps {
                script {
                    dockerImage.run("-d -p 5000:5000")
                }
            }
        }
    }
    post {
        always {
            script {
                // Clean up containers after build
                bat 'docker rm -f $(docker ps -aq --filter ancestor=weather-forecast-app) || true'
            }
        }
    }
}