#!/bin/bash
set -ex

THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "INFO : Installing NPM dependencies..."
npm install --prefix $THIS_SCRIPT_DIR twitter --save

echo "INFO : Launching step script to post status on twitter..."

$THIS_SCRIPT_DIR/twitter.js "${tw_debug_mode}" "${tw_consumer_key}" "${tw_consumer_secret}" "${tw_access_token_secret}" "${tw_access_token_key}" "${tw_screen_name}" "${tw_status}"

# If error exit 1


#
# --- Exit codes:
# The exit code of your Step is very important. If you return
#  with a 0 exit code `bitrise` will register your Step as "successful".
# Any non zero exit code will be registered as "failed" by `bitrise`.


