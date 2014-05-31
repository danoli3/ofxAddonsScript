#!/bin/sh

# The MIT License (MIT)

# Copyright (c) 2014 Daniel Rosser & Colin Friend

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

echo "ofxAddonScript v1.0 (OSX Edition)."

# Check if Git's installed (yet to be tested if Git's not installed)
if test "$(git --version 2>&1 | echo)" = "\n"
then
    echo "Git not installed."
    exit 1
fi

# Get script directory
scriptdirectory=$(dirname $0)

# Function to get an addon
# Param1: Addon folder name
# Param2: Github address
GetAddon(){

# NOTE: Change the following string if the addons folder is not two levels up from the directory of this script.
addondirectory="$scriptdirectory/../../addons/"

# Check the addon location
if [ -d $addondirectory ]
then

    # Update if the directory exists
    cd "$addondirectory/$1/"
    echo "$addondirectory/$1/ exists.\nAttempting update on Master..."
    git pull $2
    echo "Update completed."
else

    # Clone if the directory doesn't exist
    echo "$addondirectory does not exist.\nChecking out..."
    cd "$addondirectory"
    git clone $2
    echo "Check out completed."
fi
}

# Get the addons
GetAddon "ofxAddonScript" "https://github.com/danoli3/ofxAddonScript.git"
