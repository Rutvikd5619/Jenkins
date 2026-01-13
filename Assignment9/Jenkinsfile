// Pipeline for clone repository on the jenkins slave and deploy in httpd server on other ec2 instances by using scp and jenkins.

pipeline{
    agent{
        node{
            label "built-in"
            customWorkspace "/mnt/jenkins/"
        }
    }
    stages{
        stage('clone-repo'){
            steps{
                git credentialsId: 'git-credentials', url: 'https://github.com/Rutvikd5619/Assignment.git'
            }
        }
        stage('deploy-on-servers'){
            steps{
                sh "scp -i /mnt/keys/Test1.pem index.html ec2-user@172.31.4.244:/var/www/html/"
                sh "scp -i /mnt/keys/Test1.pem index.html ec2-user@172.31.12.20:/var/www/html/"
            }
        }
    }
}
