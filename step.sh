#!/bin/bash
set -ex

THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "INFO : Installing NPM dependencies..."
npm install --prefix $THIS_SCRIPT_DIR twitter --save

echo "INFO : Launching step script to post status on twitter..."

STATUS=$($THIS_SCRIPT_DIR/twitter.js ${tw_debug_mode} ${tw_consumer_key} ${tw_consumer_secret} ${tw_access_token_secret} ${tw_access_token_key} ${tw_screen_name} ${tw_status})

if echo "$STATUS" |grep "ERROR" >/dev/null 2>&1
then
    echo "ERROR : An error occured during sending the message to twitter."
    echo "ERROR : Activate debug mode to know more."
    exit 1
else
    echo "INFO : The message has been send to twitter :)"
fi

exit 0

