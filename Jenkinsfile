@Library('my-shared-lib') _
import org.iti.DockerShared1

node('Agent1') {
    def docker = new DockerShared1(this)

    withCredentials([usernamePassword(
        credentialsId: 'docker-hub-creds',
        usernameVariable: 'USERNAME',
        passwordVariable: 'PASSWD'
    )]) {
        stage("Login Docker Hub") {
            docker.login(USERNAME, PASSWD)
        }
    }

    stage("Build JAR") {
        dir('java') {
            sh 'mvn clean package install -Dmaven.test.skip=true'
        }
    }

    stage("Build & Push Docker Image") {
        dir('java') {
            docker.buildJavaImage()
            docker.pushJavaImage()
        }
    }
}
