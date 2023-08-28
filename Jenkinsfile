pipeline {
    agent {
                label 'linux'
                }
    tools{
        maven "maven"
    }
    stages {
        stage('Clone the repository') {
            steps {
               git branch: 'main', url: 'https://github.com/ELPDevOps/MultiBranch-ELP.git'
            }
        }
        stage('Build the maven code') {
            when {
                expression { currentBuild.resultIsBetterOrEqualTo('SUCCESS') }
            }
            steps {
                sh 'mvn clean install'
           }
        }
        stage('Static code analysis') {
            when {
                expression { currentBuild.resultIsBetterOrEqualTo('SUCCESS') }
            }
            steps {
        withSonarQubeEnv('jenkins-sonar') {
                    sh  "mvn sonar:sonar"
                }
                }
            }
        stage('Push the artifacts into Jfrog artifactory') {
            when {
                expression { currentBuild.resultIsBetterOrEqualTo('SUCCESS') }
            }
            steps {
              rtUpload (
                serverId: 'jenkins-artifactory',
                spec: '''{
                      "files": [
                        {
                          "pattern": "*.war",
                           "target": "Devops/"
                        }
                    ]
                }'''
              )
          }
        }

        stage('Build Docker Image') {
            when {
                expression { currentBuild.resultIsBetterOrEqualTo('SUCCESS') }
            }
            steps {
                sh '''
               docker build . --tag front-end:$BUILD_NUMBER
               docker tag front-end:$BUILD_NUMBER 586192913683.dkr.ecr.us-east-2.amazonaws.com/elpdevopsbatch4:latest

                
                '''
                
            }
        }
        stage('Push Docker Image') {
            when {
                expression { currentBuild.resultIsBetterOrEqualTo('SUCCESS') }
            }
            steps{
                sh '''
                 aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 586192913683.dkr.ecr.us-east-2.amazonaws.com
                  docker push 586192913683.dkr.ecr.us-east-2.amazonaws.com/elpdevopsbatch4:latest
                    
                   ''' 
}
            }
            
        }
      
    }
