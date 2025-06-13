/* groovylint-disable CompileStatic, LineLength, NestedBlockDepth, NoDef, UnnecessaryGetter */
pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                sh 'echo $payload ENV:'
                sh 'env'
                echo 'Hello Again and again webhook'
            }
        }
    }
}
