# pupapply

## Overview

This module deploys a demo ruby on rails project after setting up some basic deps.

## Setup

Either include module with defaults or call with optional params for user/group/version.

e.g. 
include pupapply
OR
class {'pupapply': user => 'appuser' }

## Limitations

Currently intended for deployment to amazon linux (6) only.
