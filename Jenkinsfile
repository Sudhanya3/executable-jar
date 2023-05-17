pipeline {
    agent any
    tools {
        maven 'Maven 3.9.1'
        jdk 'jdk20'
        dockerTool 'docker'
        
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "M2_HOME = ${M2_HOME}"
                    echo "PATH = ${PATH}"
                    sh 'pwd'
                ''' 
            }
        }
        stage ('Checkout') {
            steps {
                git credentialsId: 'github-password', url: 'https://github.com/Sudhanya3/executable-jar.git/'
                sh "ls -lart ./*"
                sh 'pwd'                   
            }
        }

        stage ('Build') {
            steps {
                sh 'mvn clean install -X'
                sh 'pwd'
            }
        }
        
        stage ('Creating Jar') {
            steps {
                sh 'mvn clean package -X'
            }
        }
        stage ('Building a docker image') {
            steps {
                sh 'pwd'
            }
        }
    }   
}
