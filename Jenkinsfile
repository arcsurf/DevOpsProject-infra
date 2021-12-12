#!groovy

pipeline {
    agent any

    stages {
        stage ('Initializing Terraform') {
            steps {
                script {
                    echo 'Terraform init'
                    sh "terraform init"
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
                    //echo 'Appliying terraform config'
                    //sh 'terraform plan'
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
