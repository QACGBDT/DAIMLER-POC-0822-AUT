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
        stage('Clean and prune Stage Environment') {
            when {
                expression { BRANCH_NAME ==~ /(main|stage)/ }
            }
            steps {
                echo 'test'
            }
        }
        stage('Deploy Stage Environment Stack') {
            when {
                expression { BRANCH_NAME ==~ /(main|stage)/ }
            }
            steps {
                echo 'test'
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
        stage('Deploy Prod Environment Stack') {
            when {
                expression { BRANCH_NAME ==~ /(main)/ }
            }
            steps {
                echo 'test'
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