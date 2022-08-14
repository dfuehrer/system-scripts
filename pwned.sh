#!/usr/bin/env bash
#read -p 'Password: ' pw
read -esp 'Password: ' pw
pwh="$(printf '%s' "$pw" | sha1sum | cut -d' ' -f1)"
pwh5="$(echo "$pwh" | cut -c-5)"
pwhn5="$(echo "$pwh" | cut -c6-)"
hashes="$(curl "https://api.pwnedpasswords.com/range/$pwh5")"
found="$(echo "$hashes" | grep -i "$pwhn5")"
if [ -n "$found" ]; then
    nfound="$(echo "$found" | tr -d '\r' | cut -d: -f2)"
else
    nfound='no'
fi
#printf "found %d uses off the password in the data breaches!\n" "$nfound"
echo found $nfound uses off the password in the data breaches!
