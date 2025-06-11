/* groovylint-disable CompileStatic, LineLength, NestedBlockDepth, NoDef, UnnecessaryGetter */
pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                script {
                    // def githubCause = null
                    currentBuild.rawBuild.getCauses().each { cause ->
                        echo cause.getClass().getName()
                        // if (cause.getClass().getName().contains("GitHubPushCause") || cause.getClass().getName().contains("GitHubCause")) {
                        //     githubCause = cause
                        // }
                    }
                }
                echo 'Hello Again and again webhook'
            }
        }
    }
}
