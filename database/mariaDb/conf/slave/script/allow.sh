#!/bin/bash

echo "root path"
ls

echo "modify role to User"
chown root /etc/mysql/conf.d/slave.cnf

echo "modify permission to file"
chmod 755 /etc/mysql/conf.d/slave.cnf
