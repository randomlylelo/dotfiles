# dotfiles

https://www.atlassian.com/git/tutorials/dotfiles

## Todo
- [ ] Setup script.
- [ ] Switch to a dotfiles tool like https://www.chezmoi.io/

Make sure to add\
`cfg update-index --skip-worktree ~/zshcustom/customtheme.zsh-theme`\
`cfg update-index --skip-worktree ~/README.md`\
to the script after removal of files.\
zshcustom folder is there because I can't seem to upload `.oh-my-zsh/custom/themes/customtheme.zsh-theme` so make sure to put the file there in setup script.\

Make sure to install `cups avahi` then ENABLE AND START `cups.service` & START `avahi-daemon.service`\
To set up printer, make sure to use `ipd://(PRINTERNAME)/BINARY_P1` not `dnssd://(blah)`\
You can change this in `system-config-printer`.

For monitor scaling, change .xResources, make it in increments of 96. https://wiki.archlinux.org/title/HiDPI#X_Resources
Right now at a 1.25 scale so 120. Usually, everything here is configured to 144, which is 1.5 scale. THe widgets are messed up a bit right now unless changed but oh well.

For conky:
https://askubuntu.com/questions/685045/ssd-temp-with-conky
Make sure to add the sudoers file etc.
