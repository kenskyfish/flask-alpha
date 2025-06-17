/* groovylint-disable CompileStatic, LineLength, NestedBlockDepth, NoDef, UnnecessaryGetter, UnusedVariable, VariableTypeRequired */
pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                script {
                    sh 'echo $PAYLOAD > payload.json'
                    def triggerPayload = readJSON file: payload.json
                    echo "Name: ${triggerPayload.repository.full_name}"
                }
            }
        }
    }
}