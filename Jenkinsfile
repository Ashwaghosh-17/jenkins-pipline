pipeline{
    agent any 
    
    environment {
        STAGE="PROD"
        USER="DEV"
        PASS=credentials('PASS')
    }
    stages{
        stage ("Git checkout code"){
        steps {        
            git branch: 'main', url: 'https://github.com/Ashwaghosh-17/jenkins-pipline.git'
        }
    }
       stage("environment"){
            steps{
                sh '''
                echo "STAGE"
                '''
            }
        }       
        stage("build code"){
            steps{
                sh "mvn clean package"
                echo "BUILD_ID"
            }
        }  
        stage("test"){
            steps{
                sh "mvn test"
            }
            post {
                always {
                    echo "test done"
            }
        }
    }    
        stage("build docker image"){
            steps{
                sh '''
                docker rmi -f app
                docker build -t app .
                ''' 
            }
        }    
         stage("create container"){
            steps{
                sh '''
                docker rm -f web 
                docker run -itd --name web app /bin/bash
                '''
            }
        }        
        stage("docker push"){
            steps{

               withCredentials([string(credentialsId: 'docker-passwd', variable: 'docker-hub')]) {
               sh 'docker login -u ashwaghoshambade -p $(docker-hub)'
            }
                sh '''
                docker tag app ashwaghoshambade/dev-repo:latest
                docker push ashwaghoshambade/dev-repo:latest
                docker logout
                '''
            }
        }        
    }   

    post{
        success{
        echo "========A executed successfully========"
        }
        failure{
        echo "========A execution failed========"
        }
    }
}   
