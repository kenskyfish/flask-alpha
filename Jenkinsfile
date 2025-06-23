/* groovylint-disable CompileStatic, DuplicateStringLiteral, LineLength, MethodReturnTypeRequired, NestedBlockDepth, NoDef, UnnecessaryGetter, UnusedVariable, VariableTypeRequired */


def initEnvironment() {
    def jsonPayload = readJSON text: env.PAYLOAD
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
                script {
                    def jsonPayload = readJSON text: env.PAYLOAD
                    echo "PUSH: ${jsonPayload.commits[0].id}"
                }
            }
        }
        stage('PR') {
            when { expression { return env.PAYLOAD_TYPE == 'PR' } }
            steps {
                script {
                    def jsonPayload = readJSON text: env.PAYLOAD
                    echo "PR Action: ${jsonPayload.action}"
                }
            }
        }
    }
}

// curl -v -H "Content-Type: application/json" -X POST -d "$PAYLOAD" "http://www.myfuel.ai/generic-webhook-trigger/invoke"
