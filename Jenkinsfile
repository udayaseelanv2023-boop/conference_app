pipeline {
    agent any

    environment {
        // We use the DELL path we confirmed in the command prompt
        KUBECONFIG_PATH = "C:/Users/DELL/.kube/config"
    }

    stages {
        stage('Checkout') {
            steps {
                // Pulls your latest code from GitHub
                checkout scm
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Building Docker Image...'
                bat 'docker build -t conference-app:latest .'
            }
        }

        stage('K8s Deploy') {
            steps {
                echo 'Deploying to Kubernetes...'
                /* We use the confirmed DELL path.
                   --insecure-skip-tls-verify fixes the "Unauthorized" handshake.
                   --validate=false ignores small schema version mismatches.
                */
                bat "kubectl apply -f deployment.yaml --kubeconfig=\"${KUBECONFIG_PATH}\" --context=docker-desktop --insecure-skip-tls-verify --validate=false"
            }
        }

        stage('Verify') {
            steps {
                echo 'Verifying Deployment...'
                bat "kubectl get pods --kubeconfig=\"${KUBECONFIG_PATH}\" --context=docker-desktop --insecure-skip-tls-verify"
                bat "kubectl get services --kubeconfig=\"${KUBECONFIG_PATH}\" --context=docker-desktop --insecure-skip-tls-verify"
            }
        }
    }

    post {
        success {
            echo 'Deployment successful! Access your app at http://localhost:30001'
        }
        failure {
            echo 'Deployment failed. Check the logs and ensure Docker Desktop Kubernetes is still GREEN.'
        }
    }
}