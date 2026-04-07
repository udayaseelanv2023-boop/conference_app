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
        // Ensure this path matches the file we just verified in PowerShell
        bat 'kubectl apply -f deployment.yaml --kubeconfig="C:\\k8s-config\\config" --context=docker-desktop --insecure-skip-tls-verify --validate=false'
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