

pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
            checkout([$class: 'GitSCM', branches: [[name: 'main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/send2durai/Terraform-project.git']]])

          }
        }

        stage ("terraform init") {
            steps {
                echo "Going to initialise the terraform module and download the plugin"
                sh 'terraform init'
            }
        }

        stage("terraform validate") {
            steps {
                echo"Going to validate the code written in HCL"
                sh 'terraform validate'
            }
        }

        stage("terraform fmt") {
            steps {
                echo "Going to perform the teraform files"
                sh 'terraform fmt'
            }
        }

        stage("terraform plan") {
            steps {
                echo "Going to show us, what is going to be spin up"
                sh 'terraform plan'
           }
        }

        stage("terraform destroy") {
            steps {
                echo "Going to show us, what is going to be spin up"
                sh 'terraform destroy --auto-approve'
           }
        }
    }
}
