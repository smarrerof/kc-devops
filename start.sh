#!/bin/sh

# Reinstall node_modules
mkdir -p /var/www/nodepop/node_modules
npm install --prefix /var/www/nodepop

# Start services
service nginx restart &
mongod &
npm start --prefix /var/www/nodepop