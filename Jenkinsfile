pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Build Stage'
                git branch: 'main', poll: false, url: 'https://github.com/Crush-Steelpunch/Jenkins-Easy-Runstage.git'
            }
        }
        stage('Test') {
            steps {
                withEnv(['MY_NAME=Jane']) {
                   echo 'Test Stage $MY_NAME'
                   sh 'sleep 10'
                   sh '''#!/bin/bash
                      cut -f1 -d: /etc/passwd > myfile1'''
                }
            }
        }
        stage('Deploy') {
            steps {
                dir('webapp') {
                    // some block
                    writeFile file: '.', text: ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque felis ex, luctus sit amet pharetra ut, euismod ac leo. Praesent ornare efficitur nibh, vel pulvinar tortor. Vestibulum tortor felis, lobortis in magna eu, congue cursus nisl. In a dui nec tortor interdum placerat non ac elit. Duis sodales elementum convallis. Phasellus tempus nulla at massa dapibus, ac placerat arcu lacinia. Quisque velit purus, ullamcorper at dignissim nec, auctor eget tortor. '
                }
                echo 'Deploy Stage'
            }
        }
    }
}
