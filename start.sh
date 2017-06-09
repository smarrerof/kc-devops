#!/bin/sh
service nginx restart
mongo

# Reinstall node_modules
mkdir -p /home/web/nodepop/node_modules
npm install --prefix /home/web/nodepop

# Start node app
npm start --prefix /home/web/nodepop