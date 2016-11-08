# demoproject

## Overview

Project includes two components. 
1. CloudFormations template to create single Linux instance with puppet agent
2. Puppet Module to configure Linux instance to run the ruby on rails app

## Setup

1. Stack Creation - CloudFormations
The template to create the stack accepts a number of paramaters to control stack creation.
 - PuppetServer - Allows the puppet agent on the new instance to be directed to desired master
 - InstanceType - Allows control over aws instance type
 - DeployRole - Allows the definition of a role for the stack/instance, provide fact of similar to assist with classification
 - KeyName - Allows specification of the SSH keys used for access
 - SSHLocation - Control from which subnets ssh access is allowed
 
Example aws cli command to create a new stack.

```
aws cloudformation create-stack --stack-name webappdemostack --parameters ParameterKey=SSHLocation,ParameterValue=0.0.0.0/0 ParameterKey=PuppetServer,ParameterValue=pupserver ParameterKey=InstanceType,ParameterValue=t2.micro ParameterKey=DeployRole,ParameterValue=NoRole ParameterKey=KeyName,ParameterValue=PGTKey --template-body file://cf_rordemo.template
```

2. Puppet Module

The puppet module included with this project "pupapply" will setup pre-reqs and deploy the rails app. Accepted paramaters are:
 - user - User to install the application with
 - group - Group to install the application with
 - version - Version string to control app version being deployed

To apply with all default paramaters:

```
include pupapply
```

## Limitations

Minor testing against amazon linux

## Acknowledgements

 * Application from https://github.com/alexharv074/webapp-demo
 * CF Template based on AWS LAMP sample template

