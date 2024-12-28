#!/bin/bash

secret_file="/dev/stdout"

if [ $# -eq 1 ]; then
    secret_file="$1"   
fi

# https://github.com/dani-garcia/vaultwarden/wiki/Enabling-admin-page#secure-the-admin_token
read -s -p "Enter password: " password
echo

read -s -p "Confirm password: " confirm_password
echo

if [ "$password" == "$confirm_password" ]; then
    echo -n $(echo -n "$password" | argon2 "$(openssl rand -base64 32)" -e -id -k 65540 -t 3 -p 4) > $secret_file
else
    echo "Passwords do not match. Please try again."
    exit 1
fi