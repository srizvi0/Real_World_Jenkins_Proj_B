pipeline {
    agent any

    tools{
        jdk 'JDK1'
        maven 'Maven'
    }

    stages {
        stage('Git-Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/srizvi0/Real_World_Jenkins_Proj_B.git'
            }
        }
        stage('Compile-Code') {
            steps {
                bat 'mvn compile'
            }
        }
        stage('Sonar test'){
            steps{
                withSonarQubeEnv('sonarserver') {
                    bat '''mvn clean verify sonar:sonar -Dsonar.projectKey=Project1
                    -Dsonar.projectName=Project1 -Dsonar.java.binaries=. '''
                }
            }   
        }
        
        stage('Maven Build'){
            steps{
                bat 'mvn clean install'
            }
        }
        
        stage('docker-build'){
            steps{
                bat 'docker build -t docker0326 .'
            }
        }
        
        stage('Gate') {
            steps {
                // Add a gate for human approval
                input 'Do you want to proceed?'
            }
        }
        
        stage('trivy scan'){
            steps{
                bat 'dir C:\\trivy_0.50.0_windows-64bit' // Check contents of the directory
                bat 'C:\\trivy_0.50.0_windows-64bit\\trivy.exe --version' // Check Trivy version
                bat 'C:\\trivy_0.50.0_windows-64bit\\trivy.exe image docker0326'
            }
        }
        
        stage('Docker tag & Push'){
            steps{
                bat 'docker tag docker0326 najamrizvi3/real_world_jenkins_projb:latest'
                bat 'docker push najamrizvi3/real_world_jenkins_projb:latest'
            }
        }
    }
    post {
        success {
            // Send email notification on successful deployment
            emailext subject: 'Successful',
            body: 'Your deployment was successful.',
            to: 'rizvinajam6@gmail.com'
        }
    }
        
}
