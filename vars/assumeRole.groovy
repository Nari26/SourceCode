def call(roleCredentials){
    try {
        println("Role ARN: " + roleArn)
        def credsJson = sh (script : "#!/bin/bash -e\naws sts assume-role --role-arn ${roleArn} --role-session-name DevOpsRoleSession", returnStdout: true).trim()
        def jsonSlurper = new groovy.json.JsonSlurperClassic()
        def credsObj = jsonSlurper.parseText(credsJson)
        env.accessKeyId = credsObj.Credentials.AccessKeyId
        env.secretAccessKey = credsObj.Credentials.SecretAccessKey
        env.sessionToken = credsObj.Credentials.SessionToken
    } catch(Exception e){
        throw e
        // println("Error fetching aws credentials")
    }
}
