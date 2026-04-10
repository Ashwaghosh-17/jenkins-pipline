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
