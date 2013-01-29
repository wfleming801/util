![alt text](wfleming801/util/utilIcon.jpg "Util")

util
====

bash_aliases
============

NOTE: works reasonably well, needs full testing still, try out before using wholesale...

- a set of shortcut/aliases for ccommon git commands we intend to use during Ruby development
- self-documented, use of _help {command} and _list
- if you don't already have a ".bash_aliases" file in your homedir, simply copy this into place as:
	"~/.bash_aliases"
	- this will get called automatically on next terminal session
- I'm using "_" (the underbar) for a namespace so there is no collision with existing/future commands

- minimal path for development changes:
---------------------------------------
	* (assuming project already cloned using _gc_NNN())
		* _gmc {branchName}
			* [Make changes]
		* _gac {message}	
			* (unless new files -- _ga {filename}, or _gaf {filename.gaf})
			* uses commit -a (commit all)
		* [PULL REQUEST]
		* _gdb

Adding new aliases:

- Coding style is paramount for _help and _list to function
	- first column start a new function
	- _{functionName}() # {textDescription} {lineFeed} {openBrace}
	- first line of function: '_use {functionName} {paramList}'
	- {body of function}
	- {closeBrace}


javaInstall.bsh
===============

NOTE: This works reasonably well, but should be tried with caution... Take a snapshot on your VM prior to executing this script in case there are issues. The /etc/profile had reasonable testing, but may need further testing for additional scenarios.

- a script to facilitate installation of Oracle Java onto an Ubuntu 12.10 os installation. Will likely work for any Ubuntu version.
- read the header within the script to familiarize with the cli options
- This is based on an article found on wikiHow titled "How to install Oracle Java on Ubuntu Linux"
