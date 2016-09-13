# vim-switch
A small plugin to switch between different vim mode

#### Notice
- Notice: Please backup your own vimrc file before use this plugin, this is IMPORTANT!
- This plugin works as a mode switcher for vim editor by switch your vimrc file. Thus you need at least two vimrc file as the mode to switch to. So no need to worry that the plugins installed will be removed.


#### Instruction
- Backup your origin vimrc file, and make a copy to `path-to-vim-switch-plugin/vimrc-file/`, rename the file as vimrc.origin.
- Prepare a second vimrc file with different content, make a copy to `path-to-vim-switch-plugin/vimrc-file/`, rename the file as like vimrc.new.
- Use `vimswitch new` to switch current using script with `vimrc.new`. Type `vimswitch origin` to switch to your origin setting.
- Use `vimstatus` to display which script you are currently using.
- And you may add as many vimrc file as different mode on you own need. But always remember to make a backup.
