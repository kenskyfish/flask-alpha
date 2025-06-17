/* groovylint-disable CompileStatic, LineLength, NestedBlockDepth, NoDef, UnnecessaryGetter, UnusedVariable, VariableTypeRequired */
pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                // script {
                //     def triggerPayload = readJSON text: param.PAYLOAD
                //     env.NAME = triggerPayload.repository.name
                // }
                // echo env.NAME
                sh 'echo $PAYLOAD'
            }
        }
    }
}
