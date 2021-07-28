pipeline {
    agent none
    stages {
        
        stage('install puppet on slave') {
            agent { label 'slave'}
            steps {
                echo 'Install Puppet'
                sh "wget -N -O 'puppet.deb' https://apt.puppetlabs.com/puppet6-release-bionic.deb"
                sh "chmod 755 puppet.deb"
                sh "sudo dpkg -i puppet.deb"
                sh "sudo apt update"
                sh "sudo apt install -y puppet-agent"
            }
        }

        stage('configure and start puppet') {
            agent { label 'slave'}
            steps {
                echo 'configure puppet'
                sh "mkdir -p /etc/puppetlabs/puppet"
                sh "if [ -f /etc/puppetlabs/puppet/puppet.conf ]; then sudo rm -f /etc/puppetlabs/puppet.conf; fi"
                sh "echo '[main]\ncertname = node1.local\nserver = puppet' >> ~/puppet.conf"
                sh "sudo mv ~/puppet.conf /etc/puppetlabs/puppet/puppet.conf"
                echo 'start puppet'
                sh "sudo systemctl start puppet"
                sh "sudo systemctl enable puppet"
            }
        }


	}
}