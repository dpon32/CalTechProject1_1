#!/bin/env groovy

pipeline {
    environment{
        registry = "dpontius32/apache2"
        registryCredential = 'dpontius32'
        dockerImage = ''
    }
    agent any
    stages {
        stage('Build Container') {
            steps {
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }

        stage('Deploy to dockerhub') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}

 /*       stage('Push to dockerhub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dpontius32', passwordVariable: 'dockerPassword', usernameVariable: 'dockerUsername')]){
                script {
                    sh "docker login -u ${env.dockerUsername} -p ${env.dockerPassword}"
                    sh "docker push dpontius32/apache2:1.0"
                }
            }
        }

        stage('Remove Apache2 Docker Image') {
            steps {
                script {
                    sh "docker rmi \$(docker images |grep 'apache2')"
                }
            }
        }

        stage('Pull Apache2 image from Dockerhub') {
            agent {
                docker {
                    image: dpontius32/apache2
                }
            }
        }
    }
}
}*/