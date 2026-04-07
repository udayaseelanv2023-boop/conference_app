pipeline {
    agent any
    
    environment {
        KUBECONFIG = 'C:/Users/DELL/.kube/config'
    }

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
                // Added --insecure-skip-tls-verify to bypass the certificate error
                bat 'kubectl apply -f deployment.yaml --context=docker-desktop --validate=false --insecure-skip-tls-verify'
            }
        }
        stage('Verify') {
            steps {
                echo 'Final Check...'
                // Added flag here too for the status check
                bat 'kubectl get pods --insecure-skip-tls-verify'
                bat 'kubectl get service --insecure-skip-tls-verify'
            }
        }
    }
}