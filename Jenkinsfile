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
            sh "ssh -o StrictHostKeyChecking=no ubuntu@'${params.IP}'  mkdir test"
            sh "scp ${WORKSPACE}/docker-compose.yml  ubuntu@'${params.IP}':/home/ubuntu/test "
            sh "scp ${WORKSPACE}/config.yml  ubuntu@'${params.IP}':/home/ubuntu/test"
            sh "scp ${WORKSPACE}/prometheus.yml  ubuntu@'${params.IP}':/home/ubuntu/test"
            sh "scp ${WORKSPACE}/config.monitoring  ubuntu@'${params.IP}':/home/ubuntu/test "
            sh "scp ${WORKSPACE}/script.sh  ubuntu@'${params.IP}':/home/ubuntu/test"
            sh "ssh -o StrictHostKeyChecking=no ubuntu@'${params.IP}' chmod +x /home/ubuntu/test/script.sh"
            sh "ssh -o StrictHostKeyChecking=no ubuntu@'${params.IP}' 'cd /home/ubuntu/test && sh script.sh'"
          }
       }
    }
  }
}
