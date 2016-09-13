#!/bin/sh
VIM_SWITCH_SCRIPT_PATH=$( cd `dirname $0` && pwd)

VIM_FILE_PATH=$VIM_SWITCH_SCRIPT_PATH/vimrc-file
# prefix string of host files, configure this to change the file name arrange style, e.g hosts.dev, hosts.prod
VIM_FILE_PREFIX="vimrc."
VIM_MODE_FILE="$VIM_FILE_PATH/vim-mode"

if [[ -f $VIM_MODE_FILE ]]; then
	source $VIM_MODE_FILE
else
	if [[ ! -d $VIM_FILE_PATH ]]; then
		mkdir $VIM_FILE_PATH
	fi
	touch $VIM_MODE_FILE
fi

function vimswitch(){
	if [[ ! -f ${VIM_FILE_PATH}/${VIM_FILE_PREFIX}${@} ]]; then
		echo "Error, template vimrc file not exist."
	else
		sudo cp ${VIM_FILE_PATH}/${VIM_FILE_PREFIX}${@} $HOME/.vimrc
		VIM_FILE_MODE=${VIM_FILE_PREFIX}${@}
		#echo "Reset local DNS setting"
		#sudo killall -HUP mDNSResponder
		vimode
		echo "VIM_FILE_MODE=$VIM_FILE_MODE" > $VIM_MODE_FILE
	fi
}


function vimode(){
	if [[ $VIM_FILE_MODE'x' == 'x' ]]; then
		echo "${Red}Error vimrc status UNKNOWN${NC}"
	else
		echo "vimrc file in use: ${Blue}$VIM_FILE_MODE${NC}"
	fi
}

unset VIM_SWITCH_SCRIPT_PATH
