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
               docker tag front-end:$BUILD_NUMBER elpdevopsbatch4.jfrog.io/elpdevops/batch4:$BUILD_NUMBER
                
                '''
                
            }
        }
        stage('Push Docker Image') {
            when {
                expression { currentBuild.resultIsBetterOrEqualTo('SUCCESS') }
            }
            steps{
                withCredentials([usernamePassword(credentialsId: 'jenkinstojfrog', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                 sh '''
                 docker login -u $DOCKERHUB_USERNAME   -p $DOCKERHUB_PASSWORD elpdevopsbatch4.jfrog.io/
                  docker push elpdevopsbatch4.jfrog.io/elpdevops/batch4:$BUILD_NUMBER
                    
                   ''' 
}
            }
            
        }
      
    }
}
