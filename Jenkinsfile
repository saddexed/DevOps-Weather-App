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
    }
    post {
        always {
            bat '''
            FOR /F "tokens=*" %%i IN ('docker ps -q --filter "ancestor=weather-app"') DO docker rm -f %%i
            '''
        }
    }
}