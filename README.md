# Repack Lambda
[![Build Status](https://travis-ci.org/dbuarque/repack-lambda.svg?branch=master)](https://travis-ci.org/dbuarque/repack-lambda)

AWS Lambda Microservices Architecture Template

Obs. This tool is designed to be used with Node.js projects however it can be easily changed to any language.

![Sample Architecture](http://i.imgur.com/SMjfQjC.png)

### Features:

* Develop multiple lambda functions over the same code base using shared libraries
* Scaffold new lambda functions (Configs, Handlers & Tests)
* One command deploy (build, lint, test & deploy)
* Webpack build System for production
* Use ES2015 & Babel
* Use Mocha for Tests
* Travis for CI 
* Use ESLint
* Easy versioning & release
* Focus on modularity

### Install

**PROTIP** Be sure to using node 4+ 

```bash
$ npm install
```

### Quick Start

```bash
$ APP=myLambda npm run create
```
This command will create 3 files:

1. `./src/lambdas/myLambda.js` - Lambda handler function
2. `./tests/myLambda-spec.js` - Function test file with Mocha
3. `./config/myLambda.config.js` - Lambda config file

### Tests
```bash
$ npm test
```

This will run all tests for all lambda functions or you can run without npm with:
 
```bash
$ mocha ./tests/myLambda-spec.js --compilers js:babel-register
```

**PROTIP** If do you choose run it without npm please install mocha as global before 
```
$ npm install mocha -g
``` 

### Deploy
Before Deploy you have to get the [AWS Lambda Role Arn](http://docs.aws.amazon.com/lambda/latest/dg/intro-permission-model.html)
```bash
$ ROLE_ARN=xxxx APP=myLambda npm run deploy
```

## Road Map

* Move all shell commands to gulp
* Add command to list all lambdas
* Add command to remove a lambda function locally
* Create a Web UI with Reactjs & Redux
* Improve AWS integration with new commands

## Contribute
You can contribute just opening new [issues here](https://github.com/dbuarque/repack-lambda/issues) or sending a pull request with tests
