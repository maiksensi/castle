# Homesick Castle
This repository contains my emacs and zsh configuration files. They are packaged as 
a [Homesick](https://github.com/technicalpickles/homesick) repository. 

## Get Started

Clone this repository: 
``` bash
git clone git clone https://bitbucket.org/maiksensi/castle.git
```

Ruby [Gem](https://rubygems.org/pages/download) needs to be installed in order to run
 homesick. On Ubuntu > 16.04 it should be installed by default.

Test whether gem is installed by running the command `gem --version`. It should 
return the installed version. 
```bash
[1] % gem --version
2.5.1
```

Install homesick: 
```bash
gem install homesick
```

Symlink the configurations: 
```bash
homesick link castle
```

By default you will need to add [powerline patched](https://github.com/powerline/fonts)
fonts when using the default theme `agnoster`.
