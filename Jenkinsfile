#!groovy

pipeline {
    agent any

    stages {
        stage ('Initializing Terraform') {
            steps {
                script {
                    echo 'Terraform init'
                    sh "cd /home/ubuntu/infra/DevOpsProject-infra"
                    sh "/usr/bin/terraform init"
                }
            }
        }

        stage ('Terraform plan') {
            steps {
                script {
                    echo 'Terraform plan'
                    sh "cd /home/ubuntu/infra/DevOpsProject-infra/"
                    sh "/usr/bin/terraform plan --auto-approve"
                }
            }
        }
        
        stage ('Deploy EC2 app server wirh Terraform') {
            steps {
                script {
                    echo 'Appliying terraform config'
                    sh '/home/ubuntu/infra/DevOpsProject-infra/terraform apply -input=false tfplan'
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
