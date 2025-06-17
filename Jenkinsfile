/* groovylint-disable CompileStatic, LineLength, NestedBlockDepth, NoDef, UnnecessaryGetter */
pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                sh 'echo $REPOSITORY'
                sh 'env'
                echo 'Hello. sdag'
            }
        }
    }
}
