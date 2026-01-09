//Create parameters of branch name then clone parameter selected branch and deploy on httpd after build.

pipeline{
    agent{
        label{
            label "slave-1"
            customWorkspace "/mnt/jenkins-slave/repo-clone/"
        }
    }
    parameters{
        choice(name: 'Branch', choices: ['2025Q1','2025Q2','2025Q3'], description: "select branch to clone:")
    }

    stages{
        stage('clean-wsp'){
            steps{
                cleanWs()
            }
        }
        stage('clone-branch'){
            steps{
                git branch: "${params.Branch}", url: 'https://github.com/Rutvikd5619/jenkins-project.git'

            }
        }
        stage('deploy'){
            steps{
                sh "cp /mnt/jenkins-slave/repo-clone/index.html /var/www/html/"
            }
        }
    }

}