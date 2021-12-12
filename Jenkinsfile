#!groovy

pipeline {
    agent any

    stages {
        stage ('Deploy EC2 app server wirh Terraform') {
            steps {
                script {
                    echo 'Initializing Terraform'
                    sh "terraform init"
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
