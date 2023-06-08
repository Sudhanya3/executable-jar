pipeline {
    agent any
    tools {
        maven 'Maven 3.9.1'
        jdk 'jdk20'
        'org.jenkinsci.plugins.docker.commons.tools.DockerTool' 'docker'     
    }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-auth')
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
                docker build -t java-maven .
                pwd
                ls
                '''
            }
        }
        stage ('Running a docker image') {
            steps {
                sh '''
                docker run -p 8080:8080 -p 50000:50000 --restart=on-failure -d -v jenkins_home:/var/jenkins_home java-maven
                pwd
                ls
                '''
            }
        }
        stage ('Logging into Docker hub') {
            steps {
                sh '''
                echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                pwd
                '''
            }
        }
        stage ('Push image to docker hub') {
            steps {
                sh '''
                docker tag java-maven $DOCKERHUB_CREDENTIALS_USR/java-maven
                docker push $DOCKERHUB_CREDENTIALS_USR/java-maven
                docker ps
                '''
            }
        }
        stage ('Deploying container to repository') {
            steps {
                sh '''
                kubectl version
                kubectl apply -f deployment.yaml
                kubetl get deployments
                '''
            }
        }
    }   
}
