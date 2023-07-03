node {
  def remote = [:]
  remote.name = 'java'
  remote.host = 'java.cs.rutgers.edu'
  remote.user = 'at1341'
  remote.password = 'blablacar9704'
  remote.allowAnyHosts = true
  stage('Testing local directory')
  {
    sh 'ls -LR';
    sh 'pwd';
    sh 'cat src/shell/cron_job1.sh';
    sh 'cat src/crontabs/newcrontab.txt';
  }
  stage('Remote SSH') {
    sshCommand remote: remote, command: "ls -lrt"
    // sshCommand remote: remote, command: "for i in {1..5}; do echo -n \"Loop \$i \"; date ; sleep 1; done"
    // sshCommand remote: remote, command: "(crontab -l && echo \"* * * * * echo \"Initiated from Jenkins.\" >> /common/users/at1341/testing_cron/outputs/out2.txt\") | crontab -"
    // sshPut remote: remote, from: 'src/shell/newcrontab', into: '.'
    

  }
}