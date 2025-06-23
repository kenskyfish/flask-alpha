/* groovylint-disable CompileStatic, DuplicateStringLiteral, LineLength, MethodReturnTypeRequired, NestedBlockDepth, NoDef, UnnecessaryGetter, UnusedVariable, VariableTypeRequired */

def jsonPayload = readJSON text: env.PAYLOAD

def initEnvironment() {
    if (jsonPayload.containsKey('pull_request')) {
        env.PAYLOAD_TYPE = 'PR'
    }
    if (jsonPayload.containsKey('commits')) {
        env.PAYLOAD_TYPE = 'PUSH'
    }
    //   "added": ["jenkins/one.txt", "jenkins/payload.json", "jenkins/two.txt"],
    //   "removed": [],
    //   "modified": []
    currentBuild.displayName = '#' + currentBuild.number + ' ' + env.PAYLOAD_TYPE
}

pipeline {
    agent any
    environment {
        INIT_ENV = initEnvironment()
    }
    stages {
        stage('PUSH') {
            when { expression { return env.PAYLOAD_TYPE == 'PUSH' } }
            steps {
                echo "PUSH: ${jsonPayload.commits[0].id}"
            }
        }
        stage('PR') {
            when { expression { return env.PAYLOAD_TYPE == 'PUSH' } }
            steps {
                echo "PR Action: ${jsonPayload.action}"
            }
        }
    }
}

// curl -v -H "Content-Type: application/json" -X POST -d '{ "app":{ "name":"some value" }}' "http://www.myfuel.ai/generic-webhook-trigger/invoke"
