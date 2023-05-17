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
                    pwd
                    ls -alR
                '''
            }
        }
        stage ('Checkout') {
            steps {
                git credentialsId: 'github-password', url: 'https://github.com/Sudhanya3/executable-jar.git/'
                sh '''
                ls -alR
                pwd
                '''
            }
        }

        stage ('Build') {
            steps {
                sh '''
                ls -alR
                pwd
                mvn clean install -X
                ls -alR
                pwd
                '''
            }
        }
        
        // stage ('Creating Jar') {
        //     steps {
        //         sh '''
        //         ls -alR
        //         pwd
        //         mvn clean package -X                
        //         ls -alR
        //         pwd
        //         '''

        //     }
        // }
    //     stage ('Building a docker image') {
    //         steps {
    //             sh 'pwd'
    //         }
    //     }
    // }   
}