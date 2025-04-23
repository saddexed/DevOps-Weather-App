pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("weather-app:${BUILD_NUMBER}")
                }
            }
        }
        stage('Run Container') {
            steps {
                script {
                    // Stop and remove any existing container with the same name
                    sh 'docker rm -f weather-app || true'
                    
                    // Run the new container
                    dockerImage.run('-d -p 8080:80 --name weather-app')
                }
            }
        }
    }
    post {
        always {
            script {
                // Clean up the container after the pipeline
                sh 'docker rm -f weather-app || true'
            }
        }
    }
}