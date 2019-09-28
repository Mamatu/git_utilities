#!/bin/sh

git log $1 | grep "^commit [a-f0-9]\{40\}" > /tmp/hashes
git log $2 | head -n 1 | grep "^commit [a-f0-9]\{40\}" > /tmp/hashes1

sed -i "1,/$(cat /tmp/hashes1)/!d" /tmp/hashes
tail -n +$(((`cat /tmp/hashes | wc -l` / 2) + 1)) /tmp/hashes | head -n 1
