# pupapply

## Overview

This module deploys a demo ruby on rails project after setting up deps.

## Setup

Either include module with defaults or call with optional params for user/group/version.

 - user - User to install the application with
 - group - Group to install the application with
 - version - Version string to control app version being deployed (Note: currently no workflow to pickup app so this only works with master. Ideally app would be picked up as artifact and deployed.)

```
include pupapply
```
OR
```
class {'pupapply': user => 'appuser' }
```

## Limitations

Currently intended for deployment to amazon linux only.
