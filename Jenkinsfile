pipeline {
    agent {
                label 'linux'
                }
    tools{
        maven "maven 3.9.4"
    }
    stages {
        stage('Clone the repository') {
            steps {
               git branch: 'main', url: 'https://github.com/ELPDevOps/Tomcat.git'
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
        withSonarQubeEnv('sonarqube') {
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
            when {
                expression { currentBuild.resultIsBetterOrEqualTo('SUCCESS') }
            }
            steps {
                sh '''
               docker build Dockerfile --tag surya123789/batch6:$BUILD_NUMBER

                '''
                
            }
        }
        stage('Push Docker Image') {
            when {
                expression { currentBuild.resultIsBetterOrEqualTo('SUCCESS') }
            }
            steps{
                withCredentials([usernamePassword(credentialsId: 'This_cred_is_for_docker_login', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                 sh '''
                 docker login -u $DOCKERHUB_USERNAME   -p $DOCKERHUB_PASSWORD
                  docker push surya123789/batch6:$BUILD_NUMBER
                    
                   ''' 
}
            }
            
        }
      
    }
}
