pipeline{
    agent{
        label{
            label "slave-1"
            customWorkspace "/mnt/jenkins-slave/"
        }
    }
    stages{
        stage('clone-repo'){
            steps{

                sh "rm -rf *"
                sh "git clone https://github.com/Rutvikd5619/pipeline.git"
            }
        }
        stage('deploy-httpd'){
            steps{
                sh "cp /mnt/jenkins-slave/pipeline/index.html /var/www/html/"

            }
        }
    }
}