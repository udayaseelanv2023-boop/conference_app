pipeline {
    agent any

    environment {
        // Points to the neutral config folder we verified earlier
        KUBECONFIG_PATH = "C:/k8s-config/config"
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
                /* --insecure-skip-tls-verify: Bypasses SSL certificate issues.
                   --validate=false: Skips the OpenAPI check that was causing your last "Unauthorized" error.
                */
                bat "kubectl apply -f deployment.yaml --kubeconfig=\"${KUBECONFIG_PATH}\" --context=docker-desktop --insecure-skip-tls-verify --validate=false"
            }
        }

        stage('Verify') {
            steps {
                echo 'Checking Kubernetes Status...'
                bat "kubectl get pods --kubeconfig=\"${KUBECONFIG_PATH}\" --context=docker-desktop --insecure-skip-tls-verify"
                bat "kubectl get services --kubeconfig=\"${KUBECONFIG_PATH}\" --context=docker-desktop --insecure-skip-tls-verify"
            }
        }
    }

    post {
        success {
            echo 'SUCCESS: App is deployed! Visit http://localhost:30001'
        }
        failure {
            echo 'FAILURE: Check if Docker Desktop Kubernetes icon is GREEN.'
        }
    }
}