#!groovy

pipeline {
    agent any

    stages {
        stage ('git checkout') {
            steps {
                script {
                    echo 'git checkout'
                    git credentialsId: 'gh_access_token', url: 'https://github.com/arcsurf/DevOpsProject-infra'
                }
            }
        }
        
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
                    sh "terraform plan"
                }
            }
        }
        
        stage ('Deploy EC2 app server wirh Terraform') {
            steps {
                script {
                    echo 'Appliying terraform config'
                    sh 'terraform apply'
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
