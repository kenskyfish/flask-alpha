/* groovylint-disable CompileStatic, DuplicateStringLiteral, LineLength, MethodReturnTypeRequired, NestedBlockDepth, NoDef, UnnecessaryGetter, UnusedVariable, VariableTypeRequired */

def initPayload() {
    def jsonPayload = readJSON text: env.PAYLOAD
    if (jsonPayload.containsKey('pull_request')) {
        env.PAYLOAD_TYPE = 'PR'
    }
    if (jsonPayload.containsKey('commits')) {
        env.PAYLOAD_TYPE = 'PUSH'
        def touchedFiles = []
        jsonPayload.commits.each { commit -> 
            if (commit.added) {
                sh 'echo COMMIT ADDED'
                touchedFiles.addAll(commit.added)
            }
            if (commit.removed) {
                sh 'echo COMMIT REMOVED'
                touchedFiles.addAll(commit.removed)
            }
            if (commit.modified) {
                sh 'echo COMMIT MODIFIED'
                touchedFiles.addAll(commit.modified)
            }
        }
        if (touchedFiles) {
            sh 'echo TOUCHED FILES'
            def allJenkins = true
            touchedFiles.unique().each { file ->
                if (!file.startsWith('jenkins')) {
                    allJenkins = false
                }
            }
            if (allJenkins) {
                env.PAYLOAD_TYPE = 'JENKINS'
            }
        }
    }
    currentBuild.displayName = '#' + currentBuild.number + ' ' + env.PAYLOAD_TYPE
}

pipeline {
    agent any
    environment {
        INIT_PAYLOAD = initPayload()
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
        stage('JENKINS') {
            when { expression { return env.PAYLOAD_TYPE == 'JENKINS' } }
            steps {
                script {
                    echo "SKIP IT - Jenkins only"
                }
            }
        }
    }
}

// curl -v -H "Content-Type: application/json" -X POST -d "$PAYLOAD" "http://www.myfuel.ai/generic-webhook-trigger/invoke"
