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
    sshPut remote: remote, from: "src/crontabs/${crontab_name}", into: '/common/users/at1341/testing_cron'
    sshCommand remote: remote, command: "crontab < /common/users/at1341/testing_cron/${crontab_name}"

  }
}

node 
{
  stage('Checkout scm')
  {
    checkout scm
  }

  def configVal = ''
  stage('Reading YAML')
  {
    configVal = readYaml file: "servers/config.yaml"
  }


  length = configVal['servers'].size()
  for(i=0; i<length; i++)
  {
    stage("${configVal['servers'][i]['hostaddress']}")
    {
      server = configVal['servers'][i]
      echo "Changing the crontab on ${server['hostaddress']}"
      ChangeCrontab(server['id'], server['hostname'], server['hostaddress'], server['crontab_name'])
    }
  }
    

    // echo "configVal: " + configVal
}
  //Server 1
  // stage('Java_Rutgers')
  // {
  //   ChangeCrontab('JAVA_RUTGERS', 'java', 'java.cs.rutgers.edu', 'java_crontab')
  // }

  // // Server 2
  // stage ('Perl_Rutgers')
  // {
  //   ChangeCrontab('PERL_RUTGERS', 'perl', 'perl.cs.rutgers.edu', 'perl_crontab')
  // }

