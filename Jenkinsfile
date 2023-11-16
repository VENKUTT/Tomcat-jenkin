pipeline {
    agent {
                label 'linux'
                }
    tools{
        maven "maven_3.9.5"
    }
    stages {
        stage('Clone the repository') {
            steps {
               git branch: 'Developer-2', url: 'https://github.com/ELPDevOps/Tomcat.git'
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
                serverId: 'artifactory',
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
        stage('Deploy to tomcat') {
            steps {
                         sh "pwd"
             sh "scp target/*.war root@18.144.174.101:/opt/tomcat/apache-tomcat-10.1.16/webapps"
             sh "ssh root@18.144.174.101 '/opt/tomcat/apache-tomcat-10.1.16/bin/startup.sh'"

        }
    }

    }
}

