pipeline {
    agent any
    parameters {
        booleanParam(name: 'REMOTE', defaultValue: false)
	string(name: "IP", defaultValue: "xx.xx.xx.xx", description: "Ip address")
    }
    stages {
        stage('Run Script') {
            steps {
                sh 'echo "Hello script is about run"'
            }
        }
    
    stage ('Deploy') {
	when {
                expression { return params.REMOTE }
            }
      steps{
          sshagent(credentials : ['test-server']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@$params.IP uptime'
          }
       }
    }
  }
}
