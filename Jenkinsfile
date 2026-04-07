pipeline {
    agent any

    stages {
        stage('Docker Build') {
            steps {
                echo 'Building Docker Image...'
                bat 'docker build -t conference-app:latest .'
            }
        }
        stage('K8s Deploy') {
            steps {
                echo 'Deploying to Kubernetes...'
                // Added --validate=false to bypass the connection confusion error
                bat 'kubectl apply -f deployment.yaml --validate=false'
            }
        }
        stage('Verify') {
            steps {
                echo 'Checking Deployment Status...'
                bat 'kubectl get pods'
                bat 'kubectl get service'
            }
        }
    }
}