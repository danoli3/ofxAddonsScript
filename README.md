ofxAddonScript
==============

OSX Bash command script to get specified openFrameworks addons

Version 1.2 

 - Supports custom folder names
 - Supports customised git remote addresses
 - Supports specific branches for repository
 - Supports specific SHA commit checkout


How to use:
--------------------------
--------------------------------------------

By placing the `addons.command` in a project directory or addon directory you can easily specify addons to download automatically by getting the user to run the command.

--------------------------------------------
Example usage:
--------------------------


Normal way using two parameters to master and latest commit
	
```
GetAddon "ofxAddonScript" "https://github.com/danoli3/ofxAddonScript.git"  
```

Advanced way using

``` 
GetAddon "ofxAddonScript" "https://github.com/danoli3/ofxAddonScript.git" "master" 
```

Advanced way using a specific SHA commit code (only use if you want a repo set to a specific commit).

```
GetAddon "ofxAddonScript" "https://github.com/danoli3/ofxAddonScript.git" "master" "78fd6f27cf82743644f0c12f926ae053a42a7aa3"
```
-----------------------------------------------

GetAddon Function Parameters
--------------------

- Param1: Addon folder name
- Param2: Github address
- Param3: Branch
- Param4: SHA commit

--------------------------------------------