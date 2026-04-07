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
                echo 'Deploying using Internal Config...'
                // Using '.' tells Jenkins to look inside the current project folder
                bat 'kubectl apply -f deployment.yaml --kubeconfig="k8s-config-internal" --insecure-skip-tls-verify --validate=false'
            }
        }
        stage('Verify') {
            steps {
                bat 'kubectl get pods --kubeconfig="k8s-config-internal" --insecure-skip-tls-verify'
            }
        }
    }
}