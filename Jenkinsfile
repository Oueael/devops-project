pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Oueael/devops-project.git'
            }
        }
        stage('Build') {
            steps sh 'docker build -t Oueael/devops-project:latest .'
            }
        }
        stage('Test') {
            steps echo 'No tests implemented yet.'
            }
        }
    }
}
