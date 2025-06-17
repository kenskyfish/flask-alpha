/* groovylint-disable CompileStatic, LineLength, NestedBlockDepth, NoDef, UnnecessaryGetter, UnusedVariable, VariableTypeRequired */
pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                script {
                    def triggerPayload = readJSON text: env.PAYLOAD
                }
                echo triggerPayload.repository.name
            }
        }
    }
}
