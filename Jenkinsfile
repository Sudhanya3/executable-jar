pipeline {
    agent {
        dockerfile true
    }
//     tools {
//         maven 'Maven 3.9.1'
//         jdk 'jdk20'
        
//     }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "M2_HOME = ${M2_HOME}"
                    echo "PATH = ${PATH}"
                ''' 
            }
        }
        stage ('Checkout') {
            steps {
                git credentialsId: 'github-password', url: 'https://github.com/jinahya/executable-jar-with-maven-example.git'
                sh "ls -lart ./*"
            }
        }

        stage ('Build') {
            steps {
                sh 'mvn clean install -X'
            }
        }
        
        stage ('Creating Jar') {
            steps {
                sh 'mvn clean package -X'
            }
        }
        stage ('Building a docker image') {
            steps {
                sh 'docker build .'
            }
        }
    }   
}
