pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/yourusername/conference-repo.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t conference-app:latest .'
            }
        }
        stage('Push to Registry') {
            steps {
                // This assumes you are logged into Docker Hub
                sh 'docker tag conference-app:latest yourdockerhub/conference-app:latest'
                sh 'docker push yourdockerhub/conference-app:latest'
            }
        }
    }
}