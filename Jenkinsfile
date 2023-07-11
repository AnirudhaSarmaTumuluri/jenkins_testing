def scpChangeCrontab(creds_ID, hostname, hostaddress, crontab_name)
{
  sshagent(["${creds_ID}"])
  {
    // sh "scp src/crontabs/${crontab_name} ${hostname}@${hostaddress}:~/test/crontabs"
    // sh "ssh ${hostname}@${hostaddress} 'crontab < ~/test/crontabs/${crontab_name}'"
    sh "ssh ${hostname}@${hostaddress} 'ls -LR'"
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
    stage("${configVal['servers'][i]['hostname']}")
    {
      server = configVal['servers'][i]
      echo "Changing the crontab on ${server['hostaddress']}"
      scpChangeCrontab(server['id'], server['hostname'], server['hostaddress'], server['crontab_name'])
    }
  }
}
