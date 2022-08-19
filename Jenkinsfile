pipeline {
    agent {
        label 'root'
    }
    stages {
        stage('Linting Check E2E Test Suite') {
            when {
                expression { BRANCH_NAME ==~ /(main|stage|test)/ }
            }
            steps {
                echo 'test'
            }
        }
        stage('Build Docker Images') {
            parallel {
                stage('Web Image') {
                    agent {
                        label "root"
                    }
                    steps {
                        build 'QACG/DAIMLER-POC-0822-WEB/main/'
                    }
                }
                stage('BackEnd Image') {
                    agent {
                        label "root"
                    }
                    steps {
                        build 'QACG/DAIMLER-POC-0822-API/main/'
                    }
                }
            }
         }
        stage('Clean and prune Test Environment') {
            when {
                expression { BRANCH_NAME ==~ /(main|stage|test)/ }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'SUCCESS'){
                    sh 'docker container stop daimler-poc-web-test'
                    sh 'docker container stop daimler-poc-api-test'
                }
                sh 'docker container prune -f'
                sh 'docker network prune -f'
            }
        }
        stage('Deploy Test Environment Stack') {
            when {
                expression { BRANCH_NAME ==~ /(main|stage|test)/ }
            }
            steps {
                step([$class: 'DockerComposeBuilder', dockerComposeFile: 'docker-compose-test.yml', option: [$class: 'StartAllServices'], useCustomDockerComposeFile: true])
            }
        }

        stage('E2E Test Environment Stack') {
            when {
                expression { BRANCH_NAME ==~ /(main|stage|test)/ }
            }
                    steps {
                        echo 'test'
                    }
        }
        stage('TAG Stage Environment Stack') {
            when {
                expression { BRANCH_NAME ==~ /(main)/ }
            }
            steps {
                sh 'docker image tag daimler-poc/web daimler-poc/web-stage'
                sh 'docker image tag daimler-poc/api daimler-poc/api-stage'
                sh 'docker image rm daimler-poc/api'
                sh 'docker image rm daimler-poc/api'
            }
        }
        stage('Clean and prune Stage Environment') {
            when {
                expression { BRANCH_NAME ==~ /(main|stage)/ }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'SUCCESS'){
                    sh 'docker container stop daimler-poc-web-stage'
                    sh 'docker container stop daimler-poc-api-stage'
                }
                sh 'docker container prune -f'
                sh 'docker network prune -f'
            }
        }
        stage('Deploy Stage Environment Stack') {
            when {
                expression { BRANCH_NAME ==~ /(main|stage)/ }
            }
            steps {
                step([$class: 'DockerComposeBuilder', dockerComposeFile: 'docker-compose-stage.yml', option: [$class: 'StartAllServices'], useCustomDockerComposeFile: true])
            }
        }

        stage('E2E Stage Environment Stack') {
            when {
                expression { BRANCH_NAME ==~ /(main|stage)/ }
            }
                    steps {
                        echo 'test'
                    }
        }
        stage('TAG Prod Environment Stack') {
            when {
                expression { BRANCH_NAME ==~ /(main)/ }
            }
            steps {
                sh 'docker image tag daimler-poc/web-stage daimler-poc/web-prod'
                sh 'docker image tag daimler-poc/api-stage daimler-poc/api-prod'
                sh 'docker image rm daimler-poc/api-stage'
                sh 'docker image rm daimler-poc/web-stage'
            }
        }
        stage('Clean and prune Prod Environment') {
            when {
                expression { BRANCH_NAME ==~ /(main)/ }
            }
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'SUCCESS'){
                    sh 'docker container stop daimler-poc-web-prod'
                    sh 'docker container stop daimler-poc-api-prod'
                }
                sh 'docker container prune -f'
                sh 'docker network prune -f'
            }
        }
        stage('Deploy Prod Environment Stack') {
            when {
                expression { BRANCH_NAME ==~ /(main)/ }
            }
            steps {
                step([$class: 'DockerComposeBuilder', dockerComposeFile: 'docker-compose-prod.yml', option: [$class: 'StartAllServices'], useCustomDockerComposeFile: true])
            }
        }
        stage('E2E Prod Environment Stack') {
            when {
                expression { BRANCH_NAME ==~ /(main)/ }
            }
            steps {
                echo 'test'
            }
        }
    }
}