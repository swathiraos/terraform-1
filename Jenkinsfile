pipeline {
    parameters {
  string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
}
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stage('checkout') {
            steps {
                 script{
                        dir("terraform")
                        {
                            git "https://github.com/swathiraos/terraform-1.git"
                       }
                    }
                }
            }
    
    stage('Plan') {
            steps {
                sh 'terraform init -input=false'
                sh 'terraform workspace new ${environment}'
                sh 'terraform workspace select ${environment}'
                sh "terraform plan -input=false -out tfplan "
                sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }
        }
       stage('Apply') {
            steps {
                sh "terraform apply -input=false tfplan"
            }
        }
    
    
}
