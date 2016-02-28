#!/bin/bash

if [ -z "$APP" ]; then
    echo "APP env not found! Please export the APP env e.g. APP=lambdaname npm run create"
else
    mkdir -p ./src/lambdas
    cp ./config/templates/lambda.config.tpl.js ./config/$APP.config.js
    cp ./config/templates/lambda.tpl.js ./src/lambdas/$APP.js
    cp ./config/templates/lambda-spec.tpl.js ./tests/$APP-spec.js

    case "$(uname -s)" in

       Darwin)
         sed -i '' "s/APP_NAME/$APP/g" ./tests/$APP-spec.js
         ;;

       Linux)
         sed -i "s/APP_NAME/$APP/g" ./tests/$APP-spec.js
         ;;

       CYGWIN*|MINGW32*|MSYS*)
         sed -i "s/APP_NAME/$APP/g" ./tests/$APP-spec.js
         ;;

       *)
         echo 'Unsupported platform'
         ;;
    esac
    echo "============================================="
    echo " Lambda function created with sucess!"
    echo "============================================="
fi
