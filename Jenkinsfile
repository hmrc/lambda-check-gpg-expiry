#!/usr/bin/env groovy
pipeline {
  agent any

  stages {
    stage('Prepare') {
      steps {
        step([$class: 'WsCleanup'])
        checkout(scm)
        sh("""./run-tests.sh""")
      }
    }
    stage('Build artefact') {
      steps {
        sh('./build_local.sh')
      }
    }
    stage('Generate sha256') {
      steps {
        sh('openssl dgst -sha256 -binary check-gpg-expiry.zip | openssl enc -base64 > check-gpg-expiry.zip.base64sha256')
      }
    }
    stage('Upload to s3') {
      steps {
        sh("""for env in sandbox development qa staging integration externaltest production; do
                aws s3 cp check-gpg-expiry.zip s3://mdtp-lambda-functions-\${env}/check-gpg-expiry.zip --acl=bucket-owner-full-control
                aws s3 cp check-gpg-expiry.zip.base64sha256 s3://mdtp-lambda-functions-\${env}/check-gpg-expiry.zip.base64sha256 --content-type text/plain --acl=bucket-owner-full-control
              done
          """)
      }
    }
  }
}
