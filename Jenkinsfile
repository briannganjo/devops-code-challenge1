pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'

        FRONTEND_REPO = '533267393079.dkr.ecr.us-east-1.amazonaws.com/techchallenge1-frontend'
        BACKEND_REPO  = '533267393079.dkr.ecr.us-east-1.amazonaws.com/techchallenge1-backend'
    }

    stages {
        stage('Checkout code') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker images') {
            steps {
                script {
                    sh 'docker build -t frontend:latest ./frontend'
                    sh 'docker build -t backend:latest ./backend'
                }
            }
        }

        // 🔐 Authenticate Jenkins to AWS ECR
        stage('Authenticate to ECR') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'brian2']]) {
                    script {
                        sh '''
                            echo "🔐 Authenticating to ECR..."
                            aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin 533267393079.dkr.ecr.us-east-1.amazonaws.com
                        '''
                    }
                }
            }
        }

        // 🏷️ Tag and push images to ECR
        stage('Tag and Push images to ECR') {
            steps {
                script {
                    sh '''
                        echo "🏷️ Tagging Docker images..."
                        docker tag frontend:latest $FRONTEND_REPO:latest
                        docker tag backend:latest $BACKEND_REPO:latest

                        echo "🚀 Pushing Docker images to ECR..."
                        docker push $FRONTEND_REPO:latest
                        docker push $BACKEND_REPO:latest
                    '''
                }
            }
        }

        // 🔁 Update ECS services (replace with your ECS cluster/service names)
        stage('Update ECS services') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'brian2']]) {
                    script {
                        sh '''
                            echo "🔁 Updating ECS services with new images..."
                            aws ecs update-service --cluster techchallenge1-cluster --service frontend-service --force-new-deployment --region $AWS_REGION
                            aws ecs update-service --cluster techchallenge1-cluster --service backend-service --force-new-deployment --region $AWS_REGION
                        '''
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
