# dotfiles

https://www.atlassian.com/git/tutorials/dotfiles

## Todo
- [ ] Setup script.

Make sure to add\
`cfg update-index --skip-worktree ~/zshcustom/customtheme.zsh-theme`\
`cfg update-index --skip-worktree ~/README.md`\
to the script after removal of files.\
zshcustom folder is there because I can't seem to upload `.oh-my-zsh/custom/themes/customtheme.zsh-theme` so make sure to put the file there in setup script.\

Make sure to install `cups avahi` then ENABLE AND START `cups.service` & START `avahi-daemon.service`\
To set up printer, make sure to use `ipd://(PRINTERNAME)/BINARY_P1` not `dnssd://(blah)`\
You can change this in `system-config-printer`.
