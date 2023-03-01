pipeline {
	agent any

	stages {
		stage('Build') {
			steps {
				sh 'echo "My first pipeline"'
				sh '''
					echo "By the way, I can do more stuff in here"
					ls -lah
				'''
			}
		}
		stage('Test') {
			steps {
				echo 'Testing...'
			}
		}
		stage('Deploy') {
			steps {
				echo 'Deploying...'
			}
		}
	}
}
