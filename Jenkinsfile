/* groovylint-disable CompileStatic, LineLength, NestedBlockDepth, NoDef, UnnecessaryGetter, UnusedVariable, VariableTypeRequired */
pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                script {
                    def triggerPayload = readJSON text: params.PAYLOAD
                    echo "Name: ${triggerPayload.repository.full_name}"
                }
            }
        }
    }
}
