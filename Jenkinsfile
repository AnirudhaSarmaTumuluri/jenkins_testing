node {
  withCredentials([usernamePassword(credentialsId: 'JAVA_RUTGERS', usernameVariable: 'uName', passwordVariable: 'pass')])
  {
  checkout scm
  def remote = [:]
  remote.name = 'java'
  remote.host = 'java.cs.rutgers.edu'
  remote.user = uName
  remote.password = pass
  remote.allowAnyHosts = true

  stage('Remote SSH') {
    sshPut remote: remote, from: 'src/crontabs/java_crontab', into: '/common/users/at1341/testing_cron'
    sshCommand remote: remote, command: "crontab < /common/users/at1341/testing_cron/java_crontab"
  }
  }
}

node {
  withCredentials([usernamePassword(credentialsId: 'PERL_RUTGERS', usernameVariable: 'uNamePerl', passwordVariable: 'passPerl')])
  {
  checkout scm
  def remote = [:]
  remote.name = 'perl'
  remote.host = 'perl.cs.rutgers.edu'
  remote.user = uNamePerl
  remote.password = passPerl
  remote.allowAnyHosts = true

  stage('Remote SSH') {
    sshPut remote: remote, from: 'src/crontabs/perl_crontab', into: '/common/users/at1341/testing_cron'
    sshCommand remote: remote, command: "crontab < /common/users/at1341/testing_cron/perl_crontab"
  }
  }
}