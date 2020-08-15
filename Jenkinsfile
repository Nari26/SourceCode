def workspace;
node 
{
    stage ('Checkout')
    {
        checkout changelog: false, poll: false, scm: [$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/Nari26/SourceCode.git']]]
        workspace =pwd()
        echo "$workspace"
    }
    
    stage ('Static Code Analysis')
    {
        echo "Static Code Analysis"
    }
    
    stage ('Build')
    {
        echo "Build the Code"
    }
    
    stage ('Unit Testing')
    {
        echo "Unit Testing"
    }
    
    stage ('Delivery')
    {
        echo "Deliver the Code"
    }
}
