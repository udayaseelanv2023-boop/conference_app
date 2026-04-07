pipeline {
    agent any
    
    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/udayaseelanv2023-boop/conference_app.git'
            }
        }
        stage('Docker Build') {
            steps {
                // This builds the image locally
                sh 'docker build -t conference-app:latest .'
            }
        }
        stage('K8s Deploy') {
            steps {
                // This pushes the app to your local Kubernetes cluster
                sh 'kubectl apply -f deployment.yaml'
            }
        }
    }
}