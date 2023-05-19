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
                    pwd
                    ls -al
                '''
            }
        }
        stage ('Checkout') {
            steps {
                git credentialsId: 'github-auth', url: 'https://github.com/Sudhanya3/executable-jar.git'
                checkout scmGit(branches: [[name: '*/main']], extensions: [localBranch('main')], userRemoteConfigs: [[credentialsId: 'github-auth', url: 'https://github.com/Sudhanya3/executable-jar.git']])
                sh '''
                ls -al
                pwd
                '''
            }
        }

        stage ('Build') {
            steps {
                sh '''
                ls -al
                pwd
                mvn clean install -X
                ls -al
                pwd
                '''
            }
        }
        
        stage ('Creating Jar') {
            steps {
                sh '''
                ls -al
                pwd
                mvn clean package -X                
                ls -al
                pwd
                '''

            }
        }
         stage ('Building a docker image') {
            steps {
                sh '''
                which docker
                docker version
                pwd
                '''
            }
        }
    }   
}
