#!/usr/bin/bash


# These are a number of 'convenience' aliases and functions
# for working with Ruby development

# scriptAuthor: Will Fleming
# scriptDate: 23 Jan 2013

_HELP=0

_use() # helper function to print usage detail for functions
{
	# this is a special-case, this use statement must be commented out
	# or an infinite loop occurs. help on use will still work however
	#_use _use {aliasname}
	# silent if $_HELP isn't set
	if [ $_HELP == 1 ]; then
		echo -e "\e[1;34mUSAGE $1:\e[0m"
		val="^$1\(\) #"
		txt=`cat ~/.bash_aliases | grep -E "$val"`
		echo -e "\e[1;33m$txt"
		echo -e "\e[0m"
		cat ~/.bash_aliases | grep "_use $1" | awk '{print "\t" substr($0,7)}'
		echo ""

	fi
}

_gc_oct() # clones the named repository assuming "octanner"
{
	_use _gc_oct {projectName}
	git clone https://github.com/octanner/"$1"
}

_gc_wbf() # clones the named repository assuming "wfleming801"
{
	_use _gc_wbf {projectName}
	git clone https://github.com/wfleming801/"$1"
}

_gc_x() # clones the named project("$2".git) from gitUser|gitOrg ("1")  
{
	_use _gc_x {gitUser|gitOrg} {projectName}
	git clone https://github.com/"$1"/"$2".git
}

_gmc() # make and checkout a new branch
{
	_use _gmc {branchName}
	git branch "$1"
	git checkout "$1"
	git branch
}

_gb() # shows the current checkedout branch
{
	_use _gb
	git branch
}

_ga() # adda file to repository
{
	_use _ga {fname}
	git add "$1"
}

_gaf() # git add all files named within a file "$1.gaf"
{
	# create a file containing filenames separated by LF
	# name the file {filename}.gaf
	_use _gaf {filename.gaf}
	_ga `cat "$1.gaf"`
}

_gp() # git push to origin $1
{
	_use _gp {branch}
	git push origin "$1"
}

_gc() # git commit with message + push to origin
{
	_use _gc {message}
	currBranch=`git branch | grep "\*" | awk '{print $2}'`
	git commit -m "$1"
	_gp $currBranch
}

_gfm() # update (fetch and merge) into local branch
{
	_use _gfm
	_gb
	echo "Fetching from origin to current branch..."
	git fetch origin
	echo "Merging into current branch"
	git merge origin
}

_gdb() # delete latest branch
{
	_use _gdb
	git branch
	toDelBranch=`git branch | grep "\*" | awk '{print $2}'`
	echo "Delete $toDelBranch?"
	read -p "Press any key to continue... (CTRL-C to abort)"
	echo "Switching to master..."
	git checkout master
	_gfm
	git branch -d "$toDelBranch"
}

_list() # lists all current aliases with descriptions
{
	_use _list
	echo -e "\e[1;33m"
	cat ~/.bash_aliases | grep "_.*\(\) #" | grep -v "cat ~/\.bash_aliases"
	echo -e "\e[0m"
	echo ""
}

_help() # displays usage details for $1
{
	_use _help {command}
	_HELP=1
	export _HELP
	_use "$1"
	_HELP=0
	export _HELP
}



