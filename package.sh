#!/bin/bash

set -xeou
yum install -y zip python36

BASEDIR=/data
PIPPACKAGESDIR=${BASEDIR}/lambda-packages

cd ${BASEDIR}

zip check-gpg-expiry.zip handler.py

mkdir -p ${PIPPACKAGESDIR}
pip-3.6 install -t ${PIPPACKAGESDIR} -r requirements.txt
cd ${PIPPACKAGESDIR}
zip -r ../check-gpg-expiry.zip .
