#!groovy

pipeline {
    agent any

    stages {
        stage ('Initializing Terraform') {
            steps {
                script {
                    echo 'Terraform init'
                    sh "/usr/bin/terraform init"
                }
            }
        }

        stage ('Terraform plan') {
            steps {
                script {
                    echo 'Terraform plan'
                    sh "/usr/bin/terraform plan"
                }
            }
        }
        
        stage ('Deploy EC2 app server wirh Terraform') {
            steps {
                script {
                    echo 'Appliying terraform config'
                    sh '/usr/bin/terraform apply -auto-approve'
                    //sh '/usr/bin/terraform destroy -auto-approve'
                }
            }
        }

        stage ('Clean and update ssh know_host Jenkins') {
            steps {
                script {
                    echo 'cleaning up and update know_host Jenkins server'
                    sh "clean-ssh-know_host.sh"
                    sh './clean-ssh-know_host.sh'
                }
            }
        }

        stage ('Testing if the deploy was successful') {
            steps {
                script {
                    echo 'executing some test'
                    // sh './test.sh'
                }
            }
        }
    }
}
