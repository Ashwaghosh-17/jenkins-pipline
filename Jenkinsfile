pipeline{
    agent any 
    
    stages{
        stage("git checkout"){
            steps{
                echo "git pull"
            }
        }    
        stage("build code"){
            steps{
                echo "code build"
            }
        } 
        stage("test"){
            steps{
                echo "code testing"
            }
        }
        stage("build image"){
            steps{
                echo "docker image"
            }
        }  
        stage("push image"){
            steps{
                echo "docker image push to docker repo"
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