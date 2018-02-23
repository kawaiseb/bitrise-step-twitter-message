#!/bin/bash
set -ex

THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "***********"
echo "* TWITTER *"
echo "***********"
echo "Installing NPM dependencies..."
npm install --prefix $THIS_SCRIPT_DIR twitter --save

echo "Launching step script to post status on twitter..."

$THIS_SCRIPT_DIR/twitter.js "${wtu_debug_mode}" "${consumer_key}" "${consumer_secret}" "${access_token_secret}" "${access_token_key}" "${screen_name}" "${status}"

exit 0;

# If error exit 1


#
# --- Exit codes:
# The exit code of your Step is very important. If you return
#  with a 0 exit code `bitrise` will register your Step as "successful".
# Any non zero exit code will be registered as "failed" by `bitrise`.
