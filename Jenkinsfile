node {
  def remote = [:]
  remote.name = 'java'
  remote.host = 'java.cs.rutgers.edu'
  remote.user = 'at1341'
  withCredentials([string(credentialsId: 'JAVA_CS_RUTGERS_PASS', variable: 'SECRET')]) { //set SECRET with the credential content

  remote.password = "'${SECRET}'"
  
  remote.allowAnyHosts = true
  stage('Remote SSH') {
    sshCommand remote: remote, command: "ls -lrt"
    // sshCommand remote: remote, command: "for i in {1..5}; do echo -n \"Loop \$i \"; date ; sleep 1; done"
    // sshCommand remote: remote, command: "(crontab -l && echo \"* * * * * echo \"Initiated from Jenkins.\" >> /common/users/at1341/testing_cron/outputs/out2.txt\") | crontab -"
    // sshPut remote: remote, from: 'src/shell/newcrontab', into: '.'
    // sh 'ls -LR';
    // sh 'cat src/shell/cron_job1.sh'

  }
  }
}