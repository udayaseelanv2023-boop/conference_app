pipeline {
    agent any
    
    environment {
        // This tells Jenkins exactly where your Kubernetes credentials are
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
                // Force kubectl to use the docker-desktop context
                bat 'kubectl apply -f deployment.yaml --context=docker-desktop --validate=false'
            }
        }
        stage('Verify') {
            steps {
                echo 'Final Check...'
                bat 'kubectl get pods'
                bat 'kubectl get service'
            }
        }
    }
}