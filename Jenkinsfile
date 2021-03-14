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

        stage('Remove image from agent') {
            steps {
                script {
                    sh "docker rmi $registry:$BUILD_NUMBER"
                }
            }
        }

        stage('Get latest image from Dockerhub') {
            steps {
                script {
                    dockerImage.pull()
                }
            }
        }

        stage('Run Apache container') {
            steps {
                script {
                    sh "docker run $registry:$BUILD_NUMBER"
                }
            }
        }
    }
}