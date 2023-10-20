pipeline {
    agent none
    tools{
        maven "maven 3.9.4"
    }
    stages {
        stage('Build the maven code') {
            agent { 
                label 'linux'
            }
            when {
                expression { currentBuild.resultIsBetterOrEqualTo('SUCCESS') }
            }
            steps {
                sh 'mvn clean install'
           }
        }
        stage('Static code analysis') {
            agent { 
                label 'linux'
            }
            when {
                expression { currentBuild.resultIsBetterOrEqualTo('SUCCESS') }
            }
            steps {
        withSonarQubeEnv('sonarqube') {
                    sh  "mvn sonar:sonar"
                }
                }
            }
        stage('Push the artifacts into Jfrog artifactory') {
            agent { 
                label 'linux'
            }
            when {
                expression { currentBuild.resultIsBetterOrEqualTo('SUCCESS') }
            }
            steps {
              rtUpload (
                serverId: 'artifactory_to_jenkins',
                spec: '''{
                      "files": [
                        {
                          "pattern": "*.war",
                           "target": "elpdevops/"
                        }
                    ]
                }'''
              )
          }
        }

        stage('Build Docker Image') {
            agent { 
                label 'linux'
            }
            when {
                expression { currentBuild.resultIsBetterOrEqualTo('SUCCESS') }
            }
            steps {
                sh '''
               docker build -t 586192913683.dkr.ecr.eu-west-1.amazonaws.com/elpdevops:latest .
                
                '''
                
            }
        }
        stage('Push Docker Image') {
            agent { 
                label 'linux'
            }
            when {
                expression { currentBuild.resultIsBetterOrEqualTo('SUCCESS') }
            }
            steps{
                sh '''
                 aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 586192913683.dkr.ecr.eu-west-1.amazonaws.com
                  docker push 586192913683.dkr.ecr.eu-west-1.amazonaws.com/elpdevops:latest
                    
                   ''' 
}
            }
        stage('Deployto AWS EKS') {
            agent { 
                label 'eks'
            }
        
            steps {
                // configure AWS credentials
        // withAWS(credentials: 'aws_credentials', region: 'eu-west-1') {

                   // Connect to the EKS cluster
                    sh '''
                      aws eks update-kubeconfig --name surya --region eu-west-1
                      kubectl apply -f deployment.yaml
                      kubectl apply -f service.yaml
                      kubectl set image deployment/web-app web-application=108290765801.dkr.ecr.us-east-1.amazonaws.com/web-application:latest
                     
                    '''
                }
              // kubectl rollout status deployment/web-app
           
        }
            
        }
        
}
