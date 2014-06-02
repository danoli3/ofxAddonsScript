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

echo "----------------------------------"
echo "ofxAddonScript v1.1 (OSX Edition)."
echo "----------------------------------"

# Check if Git's installed (yet to be tested if Git's not installed)
if test "$(git --version 2>&1 | echo)" = "\n"
then
	echo "----------------------------------"
    echo "FATAL ERROR: Git not installed. Script terminating..."
    echo "----------------------------------"
    exit 1
fi

# Get script directory (needed to run the script from any location!)
scriptdirectory=$(dirname $0)


# Global Variables
relativeaddonpath="../../addons"
#relativeaddonpath="../../../addons" # normal oF Project->addons location
echo "Global Addons Path: $relativeaddonpath"
echo "----------------------------------"

#-------------------------------------------------------------- GetAddon Function
# Function to get an addon
# Param1: Addon folder name
# Param2: Github address
# Param3: Branch
# Param4: SHA commit
GetAddon(){

# NOTE: Change the following string if the addons folder is not two levels up from the directory of this script.
addonsdirectory="$scriptdirectory/$relativeaddonpath"
branch="$3"
sha="$4"

# if a branch is not specified - Default to master
if [ "$branch" == "" ]
then
	branch="master"	
fi




echo "========================"
echo "Name:    $1"
echo "Origin:  $2"
echo "Branch:  $branch"

if [ "$sha" != "" ]
then
	echo "SHA:     $sha"
fi

echo "------------------------"
# Check the addon location
if [ -d $addonsdirectory ]
then
	echo "openFrameworks Addon Directory Found!"
	echo "------------------------"
	addondirectory="$addonsdirectory/$1/"
	if [ -d $addondirectory ]
	then
    	# Update if the directory exists
    	cd "$addondirectory"
    	echo "Addon directory already exists! '$1'!"
    	echo "------------------------"
#    	echo "Verbose: Addon Full Path: \n $addondirectory" # verbose
		echo "Setting branch to: $branch"
		git checkout $branch
		echo "------------------------"
    	echo "Now attempting update on $branch..."
   		git pull $2
   		# checkout a particular SHA commit
   		if [ "$sha" != "" ]
		then
			echo "------------------------"
			echo "Checking out SHA commit: $sha"
			git checkout $sha
			git status
			echo "------------------------"
		fi
   		echo "------------------------"
    	echo "$1 successfully updated"  #assuming git pull does not fail actually...
    else
    	# Clone if the directory doesn't exist
   	 	echo "$1 does not exist in the addons directory."
#  	 	echo "$relativeaddonpath/$relativeaddonpath" # verbose
    	cd "$addonsdirectory"
	    echo "Checking out $1 into $relativeaddonpath/$1"
    	echo "------------------------"
    	git clone $2 $1
    	echo "------------------------"
    	echo "$1 cloned successfully!"
    	echo "------------------------"
    	echo "Setting branch to: $branch"
		git checkout $branch
		echo "------------------------"
    	echo "Now attempting update on $branch..."
   		git pull $2
   		if [ "$sha" != "" ]
		then
			echo "------------------------"
			echo "Checking out SHA commit: $sha"
			git checkout $sha
			git status
			echo "------------------------"
		fi
    fi
else
    # Addons Folder not in location
    echo "------------------------"
    echo "ERROR! Addons directory not found at: $relativeaddonpath"
#   echo "Verbose: Addons Full Path: \n $addonsdirectory" # verbose
    echo "------------------------"
fi

# Reset environment location back to script directory.
cd $scriptdirectory
echo "========================"
}

##------------------------------- MODIFY BELOW HERE!!! ----------------------------------

# Get the addons
GetAddon "ofxAddonScript" "https://github.com/danoli3/ofxAddonScript.git" "master"
