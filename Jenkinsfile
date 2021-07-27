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

        stage ("Sending Slack Notification on Building INFRA") {
            steps {
                sh 'sleep 3'
                slackSend channel: 'iac-aws-notifications', message: 'Terraform apply command has been executed. AWS DEV Environment has been build'
            }
        }
    }
}
