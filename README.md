ofxAddonsScript
==============

openFrameworks Addon for downloading ofxAddons or git repo's defined in script.

Screenshot:

![Screenshot](https://github.com/danoli3/ofxAddonsScript/raw/master/ofxaddons_thumbnail.png)


Version 1.22

 - Supports custom folder names
 - Supports customised git remote addresses
 - Supports specific branches for repository
 - Supports specific SHA commit checkout


How to use:
--------------------------
--------------------------------------------

By placing the `ofxAddonsScript.command` in a project directory or addon directory you can easily specify addons to download automatically by getting the user to run the command.

--------------------------------------------
Example usage:
--------------------------


Normal way using two parameters to master and latest commit
	
```
GetAddon "ofxAddonsScript" "https://github.com/danoli3/ofxAddonsScript.git"  
```

Advanced way using

``` 
GetAddon "ofxAddonsScript" "https://github.com/danoli3/ofxAddonsScript.git" "master" 
```

Advanced way using a specific SHA commit code (only use if you want a repo set to a specific commit).

```
GetAddon "ofxAddonsScript" "https://github.com/danoli3/ofxAddonsScript.git" "78fd6f27cf82743644f0c12f926ae053a42a7aa3"
```
-----------------------------------------------

GetAddon Function Parameters
--------------------

- Param1: Addon folder name
- Param2: Github address
- Param3: Branch / SHA Commit

--------------------------------------------