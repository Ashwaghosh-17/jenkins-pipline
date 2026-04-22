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
            git branch: 'main', url: 'https://github.com/Ashwaghosh-17/jenkins-pipeline.git'
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
                docker build -t ashwaghoshambade/dev-repo:latest .
                ''' 
            }
        }    
        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'Docker-hub',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    docker push ashwaghoshambade/dev-repo:latest
                    '''
                }
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
