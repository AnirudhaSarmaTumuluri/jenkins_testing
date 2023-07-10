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
  stage('SSH Stage')
  {
    sh 'cat ~/.ssh/id_rsa.pub'
    sshagent(['pkey_ec2'])
    {
      sh "ssh -tt -o StrictHostKeyChecking=no ubuntu@54.164.3.28 'ls -l'"
    }
  }


  // def configVal = ''
  // stage('Reading YAML')
  // {
  //   configVal = readYaml file: "servers/config.yaml"
  // }

  // length = configVal['servers'].size()
  // for(i=0; i<length; i++)
  // {
  //   stage("${configVal['servers'][i]['hostname']}")
  //   {
  //     server = configVal['servers'][i]
  //     echo "Changing the crontab on ${server['hostaddress']}"
  //     ChangeCrontab(server['id'], server['hostname'], server['hostaddress'], server['crontab_name'])
  //   }
  // }
}
