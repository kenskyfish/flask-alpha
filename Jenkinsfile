/* groovylint-disable CompileStatic, LineLength, NestedBlockDepth, NoDef, UnnecessaryGetter, UnusedVariable, VariableTypeRequired */
pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                script {
                    sh 'echo $PAYLOAD > payload.json'
                    sh 'wc -c payload.json'
                    def jsonPayload = readJSON file: 'payload.json'
                    echo "Name: ${jsonPayload.repository.full_name}"
                }
            }
        }
    }
}

// curl -v -H "Content-Type: application/json" -X POST -d '{ "app":{ "name":"some value" }}' "http://www.myfuel.ai/generic-webhook-trigger/invoke"