pipeline {
    agent any
    
    tools {
      maven 'M2_HOME'
      git 'Default'
      jdk 'JAVA_HOME'
    }
    
    environment {
      M2_HOME = "/opt/maven/apache-maven-3.8.2"
      M2 = "$M2_HOME/bin"
      JAVA_HOME = "/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.302.b08-0.amzn2.0.1.x86_64"
      PATH = "$M2_HOME:$M2:$JAVA_HOME/bin:$PATH"
    }
    
    triggers {
      pollSCM '* * * * *'
    }
    
    stages {     
        stage('Build') {
            steps {
                // Maven Build
                sh 'mvn clean install'
            }
        }
        
        stage('Deploy') {
            steps {
                // Deploy to tomcat server
                deploy adapters: [tomcat8(credentialsId: 'deployer', path: '', url: 'http://18.218.239.227:8090/')], contextPath: 'webapp', onFailure: false, war: '**/*.war'
            }
        }
    }
}
