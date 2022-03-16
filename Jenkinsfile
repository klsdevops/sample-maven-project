#tets
pipeline {
    agent any

    tools {
      maven 'M2_HOME'
      git 'Default'
      jdk 'JAVA JDK'
    }

    environment {
      M2_HOME = "/opt/maven/apache-maven-3.8.4"
      M2 = "$M2_HOME/bin"
      JAVA_HOME = "/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.312.b07-0.amzn2.0.1.x86_64"
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
                // Deploy to tomcat appserver
                deploy adapters: [tomcat8(credentialsId: 'DeployToTomcat', path: '', url: 'http://3.22.114.118:8080/')], contextPath: 'webapp', onFailure: false, war: '**/*.war'
            }
        }
    }
}

