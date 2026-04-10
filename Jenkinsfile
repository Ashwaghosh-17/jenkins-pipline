pipeline{
    agent any 
    
    stages{
        stage("Git checkout code"){
            steps{
                git branch: 'main', url: 'https://github.com/Ashwaghosh-17/jenkins-pipline.git'
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
        }
        stage("build docker image"){
            steps{
                sh "docker build -t app ."   
            }
        }    
        stage("deployment"){
            steps{
                sh "docker run -itd --name web app /bin/bash"   
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
