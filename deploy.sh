#!/bin/bash

aws cloudformation create-stack --stack-name webappdemostack --parameters ParameterKey=SSHLocation,ParameterValue=0.0.0.0/0 ParameterKey=PuppetServer,ParameterValue=pupserver ParameterKey=InstanceType,ParameterValue=t2.micro ParameterKey=DeployRole,ParameterValue=NoRole ParameterKey=KeyName,ParameterValue=PGTKey --template-body file://cf_rordemo.template

# Removal
#aws cloudformation delete-stack --stack-name webappdemostack
