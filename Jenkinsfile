pipeline {
    agent any

    environment {
        FIREBASE_TOKEN = credentials('firebase-token')
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    credentialsId: 'github-token',
                    url: 'https://github.com/JuanPinto26/firebase-jenkins-ci-cd.git'
            }
        }

        stage('Verify Environment') {
            steps {
                sh 'node --version'
                sh 'firebase --version'
            }
        }

        stage('Deploy to Testing') {
            steps {
                sh 'firebase deploy -P testing --token $FIREBASE_TOKEN'
            }
        }

        stage('Approve Staging') {
            steps {
                input message: 'Deploy to STAGING?', ok: 'Proceed'
            }
        }

        stage('Deploy to Staging') {
            steps {
                sh 'firebase deploy -P staging --token $FIREBASE_TOKEN'
            }
        }

        stage('Approve Production') {
            steps {
                input message: 'Deploy to PRODUCTION?', ok: 'Proceed'
            }
        }

        stage('Deploy to Production') {
            steps {
                sh 'firebase deploy -P production --token $FIREBASE_TOKEN'
            }
        }
    }
}
