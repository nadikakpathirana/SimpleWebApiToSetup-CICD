pipeline {
    agent any 
    
    stages { 
        stage('SCM Checkout') {
            steps {
                retry(3) {
                    git branch: 'main', url: 'https://github.com/nadikakpathirana/SimpleWebApiToSetup-CICD'
                }
            }
        }
        stage('Build Docker Image') {
            steps {  
                bat 'docker build -t nadikakpathirana/test-webapp-cicd:%BUILD_NUMBER% .'
            }
        }
        stage('Login to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'docker-pw', variable: 'dhpw')]) {
                    script {
                        bat "docker login -u nadikakpathirana -p %dhpw%"
                    }
                }
            }
        }
        stage('Push Image') {
            steps {
                bat 'docker push nadikakpathirana/test-webapp-cicd:%BUILD_NUMBER%'
            }
        }
    }
    post {
        always {
            bat 'docker logout'
        }
    }
}