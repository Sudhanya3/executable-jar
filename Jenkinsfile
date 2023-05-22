pipeline {
    agent any
    tools {
        maven 'Maven 3.9.1'
        jdk 'jdk20'
        'org.jenkinsci.plugins.docker.commons.tools.DockerTool' 'docker'
        
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "M2_HOME = ${M2_HOME}"
                    echo "JAVA_HOME = ${JAVA_HOME}"
                    
                '''
            }
        }
        stage ('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-auth', url: 'https://github.com/Sudhanya3/executable-jar.git']])
                
            }
        }

        stage ('Build') {
            steps {
                sh '''
                
                mvn clean install -X
                
                '''
            }
        }
        
        stage ('Creating Jar') {
            steps {
                sh '''
                
                mvn clean package -X                
                
                '''

            }
        }
         stage ('Building a docker image') {
            steps {
                sh '''
                docker build -t java-maven.jar .
                pwd
                ls
                '''
            }
        }
        stage ('Running a docker image') {
            steps {
                sh '''
                docker run -p 8081:8081 java-maven.jar
                pwd
                '''
            }
        }
        
    }   
}
