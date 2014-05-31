#!/bin/sh
here="`dirname \"$0\"`"
echo "cd-ing to $here"
cd "$here" || exit 1

echo "\n"
echo "Starting Dan's GitHub Addon Script! :D! OSX Only"

# just basic command script do rest here
echo "\n"
location="`$here/../../../addons/ofxUI/`"
#echo "$location";
#echo "\n";
if [ -d $location ]
then
    echo 'ofxUI exists. Attempting update on Master...'
    cd "$location";
    git pull;
    echo "Update completed"
    cd "$here"
else
	echo 'ofxUI does not exist. Checking out...'
fi