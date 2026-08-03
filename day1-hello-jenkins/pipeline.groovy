pipeline {
    agent any
    stages {
        stage('Greet') {
            steps {
                echo 'Hello from Declarative Pipeline!'
                sh 'echo "Today is $(date)"'
            }
        }
    }
}
