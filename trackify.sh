#!/bin/bash

# echo out track number
string=$(echo "$1" | cut -d/ -f 5)
echo $string
string="http://open.spotify.com/track/$string"
wget -q -O tmp.html "$string"

# download cover image
string=$(grep -oE --color "background:[^>]+><[^>]+><[^>]+src=[^>]+>" tmp.html | grep -oE 'src="[^"]+*"' | cut -d\" -f2)
wget -q -O cover.jpg "$string"

rm -f tmp.htm
