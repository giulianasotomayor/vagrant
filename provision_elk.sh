#!/bin/bash

apt-get update >/dev/null 2>&1
apt-get install -y  w3m \
                    nginx \
                    net-tools \
                    apt-transport-https

exit 0
