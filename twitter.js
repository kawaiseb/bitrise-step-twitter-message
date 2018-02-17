#!/usr/bin/env node

var Twitter = require('twitter');
 
let debug = process.argv[2]; //debug true/false
let consumer_key = process.argv[3];
let consumer_secret = process.argv[4]; 
let access_token_key = process.argv[5];
let access_token_secret = process.argv[6];
let screen_name = process.argv[7]; //'kawaiseb'
let status = process.argv[8];

if(debug == null || consumer_key == null || consumer_secret == null 
    || access_token_key == null || access_token_secret == null || screen_name == null) {
    console.log('ERROR : At least one parameter is missing');
    return 1;
}

var client = new Twitter({
  consumer_key: 'ctDQvfwI7ppvfGi6o8qLsc9ZN',
  consumer_secret: 'vW25CIp9OMbqByNbtKtxkdPGFShUa4ByMGVXIiVPcEdfaJiUg8',
  access_token_key: '2783726838-djGDWFEaIKKBmVjVpVDQmvd4XfqJ1NNyIGVstXY',
  access_token_secret: 'zMwq2MmLckeQ51cGGpG6RYmeVWdcCn7edTi2wHJ1ALtVc'
});
 
var params = {screen_name: screen_name};

client.post('statuses/update', {status: status},  function(error, tweet, response) {
    if(error) throw error;

    if(debug == 'yes') {
        console.log(tweet);  // Tweet body. 
        console.log(response);  // Raw response object.
    } 
  });