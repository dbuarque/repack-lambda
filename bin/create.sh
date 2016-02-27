#!/bin/bash

if [ -z "$APP" ]; then
    echo "APP env not found! Please export the APP env e.g. APP=lambdaname npm run create"
else
    cp ./config/templates/lambda.config.tpl.js ./config/$APP.config.js
    cp ./config/templates/lambda.tpl.js ./src/lambdas/$APP.js
    cp ./config/templates/lambda-spec.tpl.js ./tests/$APP-spec.js
    sed -i '' "s/APP_NAME/$APP/g" ./tests/$APP-spec.js
    echo "Lambda function created with sucess!"
fi