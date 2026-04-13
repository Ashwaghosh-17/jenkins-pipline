pipeline{
    agent any 
    
    environment{
        STAGE="PROD"
        USER="DEV"
        PASS=credentials('PASS')
    }

    stages{
        stage("Git checkout code"){
            steps{
                git branch: 'main', url: 'https://github.com/Ashwaghosh-17/jenkins-pipline.git'
            }
        }    
        }    
        stage("environment"){
            steps{
               sh '''
               echo "STAGE"
               echo "username $USER and password $PASS"
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
                sh 'mvn test'
            }
            post{
                always{
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
        stage("deployment"){
            steps{
                sh '''
                docker rm -f web
                docker run -itd --name web app /bin/bash
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
    
