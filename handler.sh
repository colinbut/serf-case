#!/bin/bash

echo
echo "New Event : ${SERF_EVENT}. Data follows..."

while read line; do
    printf "${line}\n"
done