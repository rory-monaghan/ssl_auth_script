#!/bin/bash
while read urls;
do
  printf "$urls : " >> certs.txt
  curl -I $urls | grep -i "certificate"
  printf | openssl s_client -showcerts -connect $urls:443 2>/dev/null | openssl x509 -noout -issuer >> certs.txt
done < urls.txt
