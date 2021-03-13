#!/bin/env groovy

pipeline {
    agent none
    stages {
        stage('Build Container') {
            steps {
                script {
                    sh "docker build -t dpontius32/apache2:1.0.0"
                }
            }

        }
    stage('Push to dockerhub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerPassword', usernameVariable: 'dockerUsername')]){
          script {
            sh "docker login -u ${env.dockerUsername} -p ${env.dockerPassword}"
            sh "docker push dpontius32/apache2:1.0"
          }
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
