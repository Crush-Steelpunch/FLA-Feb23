pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Build Stage'
            }
        }
        stage('Test') {
            steps {
                echo 'Test Stage'
                sh 'sleep 120'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploy Stage'
            }
        }
    }
}
