pipeline{

    agent any

    stages{

        stage('Build Jar'){
            steps{
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Image'){
            steps{
                sh 'docker build -t=kardockdock/selenium:latest .'
            }
        }
        stage('Push Image') {
            environment{
            DOCKER_HUB = credentials('dockerhub-cred')
            }
            steps{
                sh 'echo ${DOCKER_HUB_PSW} | docker login -u ${DOCKER_HUB_USR} --password-stdin'
                sh "docker push kardockdock/selenium:latest"
                sh "docker tag kardockdock/selenium:latest kardockdock/selenium:${env.BUILD_NUMBER}"
                sh "docker push kardockdock/selenium:${BUILD_NUMBER}"

            }
        }
    }
    post {
    always {
    sh "docker logout"
    }
    }
}