pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                bat 'docker build -t weather-app .'
            }
        }
        stage('Run Container') {
            steps {
                bat 'docker run -d -p 5000:5000 --name weather-app weather-app'
            }
        }
        stage('Push to Registry') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'DOCKER_HUB', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    bat 'docker login -u %DOCKER_USER% -p %DOCKER_PASS%'
                    bat 'docker tag weather-app %DOCKER_USER%/weather-app:latest'
                    bat 'docker push %DOCKER_USER%/weather-app:latest'
                }
            }
        }
    }
    post {
        always {
            bat '''
            docker stop weather-app 2>nul
            docker rm weather-app 2>nul
            '''
        }
    }
}