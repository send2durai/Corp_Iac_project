pipeline {
    agent any

    stages {
        stage('Checkout the github repo') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: 'main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/send2durai/Corp_Iac_project.git']]])

          }
        }

        stage ("terraform init") {
            steps {
                echo "Going to initialise the terraform module and download the required plugin"
                sh 'terraform init'
            }
        }

        stage("terraform validate") {
            steps {
                echo"Going to validates the configuration files in a directory"
                sh 'terraform validate'
            }
        }

        stage("terraform fmt") {
            steps {
                echo "Going to rewrite Terraform configuration files to a canonical format and style"
                sh 'terraform fmt'
            }
        }

        stage("terraform plan") {
            steps {
                echo "Going to evaluates a Terraform configuration to determine the desired state of all the resources it declares"
                sh 'terraform plan'
           }
        }

        stage("terraform apply") {
            steps {
                echo "Going to executes the actions proposed in a Terraform plan"
                sh 'terraform apply --auto-approve'
           }
        }
        
        stage ("Linux and AWS CLI checking") {
            steps {
                echo "This AWS CLI performing some basics"
                sh '''
                pwd
                whoami
                w 
                nslookup google.com
                nslookup amazon.com | grep 'Address'
                nslookup amazon.com | grep 'Name'
                curl http://169.254.169.254/latest/meta-data
                sleep 3
                curl http://169.254.169.254/latest/meta-data/hostname
                sleep 3
                curl http://169.254.169.254/latest/meta-data/iam
                sleep 3
                curl http://169.254.169.254/latest/meta-data/iam/security-credentials/ec2-admin-role
                sleep 3
                echo 'completed all steps in stages what we specified'
               '''
            }
          }
    }
}
