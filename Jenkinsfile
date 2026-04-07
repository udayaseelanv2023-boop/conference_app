pipeline {
    agent any

    stages {
        stage('Docker Build') {
            steps {
                echo 'Building Docker Image...'
                // This creates the image locally on your machine
                bat 'docker build -t conference-app:latest .'
            }
        }
        stage('K8s Deploy') {
            steps {
                echo 'Deploying to Kubernetes...'
                // This tells Kubernetes to run the image
                bat 'kubectl apply -f deployment.yaml'
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