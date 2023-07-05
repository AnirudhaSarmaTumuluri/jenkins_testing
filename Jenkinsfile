node {
  withCredentials([sshUserPrivateKey(credentialsId: '90ddd642-8c64-4453-a24a-86001fb00442', usernameVariable: 'uName')])
  {
  checkout scm
  def remote = [:]
  remote.name = 'java'
  remote.host = 'java.cs.rutgers.edu'
  remote.user = uName
  remote.allowAnyHosts = true

  stage('Remote SSH') {
    // sshCommand remote: remote, command: "pwd"
    // sshCommand remote: remote, command: "for i in {1..5}; do echo -n \"Loop \$i \"; date ; sleep 1; done"
    // sshCommand remote: remote, command: "(crontab -l && echo \"* * * * * echo \"Initiated from Jenkins.\" >> /common/users/at1341/testing_cron/outputs/out2.txt\") | crontab -"
    sshPut remote: remote, from: 'src/shell/newcrontab', into: '/common/users/at1341/testing_cron'
    sshCommand remote: remote, command: "crontab < /common/users/at1341/testing_cron/newcrontab"
  }
  }
}