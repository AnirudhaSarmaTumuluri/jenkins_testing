

pipeline {
    agent { node {
            def remote = [:]
            remote.name = 'less'
            remote.host = 'less.cs.rutgers.edu'
            remote.user = 'at1341'
            remote.password = 'blablacar9704'
            remote.allowAnyHosts = true
            stage('Remote SSH') {
                sshCommand remote: remote, command: "ls -lrt"
                sshCommand remote: remote, command: "for i in {1..5}; do echo -n \"Loop \$i \"; date ; sleep 1; done"
            }
            } 
    }
    stages {
        stage('build') {
            steps {
                sh 'pwd'
                
            }
        }
    }
}