def ChangeCrontab(creds_ID, hostname, hostaddress, crontab_name)
{
  withCredentials([usernamePassword(credentialsId: creds_ID, usernameVariable: 'uName', passwordVariable: 'pass')])
  {
    def remote = [:]
    remote.name = hostname
    remote.host = hostaddress
    remote.user = uName
    remote.password = pass
    remote.allowAnyHosts = true
    sshPut remote: remote, from: '/src/crontabs/'+crontab_name, into: '/common/users/at1341/testing_cron'
    sshCommand remote: remote, command: "crontab < /common/users/at1341/testing_cron/"+crontab_name

  }
}


node 
{
  checkout scm
  
  //Server 1
  stage('Java_Rutgers')
  {
    ChangeCrontab('JAVA_RUTGERS', 'java', 'java.cs.rutgers.edu', java_crontab)
    // withCredentials([usernamePassword(credentialsId: 'JAVA_RUTGERS', usernameVariable: 'uName', passwordVariable: 'pass')])
    // {
    //   def remote = [:]
    //   remote.name = 'java'
    //   remote.host = 'java.cs.rutgers.edu'
    //   remote.user = uName
    //   remote.password = pass
    //   remote.allowAnyHosts = true
    //   sshPut remote: remote, from: 'src/crontabs/java_crontab', into: '/common/users/at1341/testing_cron'
    //   sshCommand remote: remote, command: "crontab < /common/users/at1341/testing_cron/java_crontab"

    // }
  }


  // Server 2
  stage ('Perl_Rutgers')
  {
    withCredentials([usernamePassword(credentialsId: 'PERL_RUTGERS', usernameVariable: 'uNamePerl', passwordVariable: 'passPerl')])
    {
      def remote = [:]
      remote.name = 'perl'
      remote.host = 'perl.cs.rutgers.edu'
      remote.user = uNamePerl
      remote.password = passPerl
      remote.allowAnyHosts = true
      sshPut remote: remote, from: 'src/crontabs/perl_crontab', into: '/common/users/at1341/testing_cron'
      sshCommand remote: remote, command: "crontab < /common/users/at1341/testing_cron/perl_crontab"
    
    }
  }
}
