pipeline {
    agent any
    stages {
        stage('Docker Build') {
            steps {
                bat 'docker build -t conference-app:latest .'
            }
        }
        stage('K8s Deploy') {
            steps {
                echo 'Deploying to Kubernetes...'
                // We use the path you just verified: C:\k8s-config\config
                bat 'kubectl apply -f deployment.yaml --kubeconfig="C:/k8s-config/config" --context=docker-desktop --insecure-skip-tls-verify'
            }
        }
        stage('Verify') {
            steps {
                // Check if the pods are actually running
                bat 'kubectl get pods --kubeconfig="C:/k8s-config/config"'
            }
        }
    }
}