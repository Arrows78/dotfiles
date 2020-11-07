# Setup default configuration

## Toolset

- [oh-my-zsh](http://ohmyz.sh/)
- [Sublime Text](https://www.sublimetext.com/)
- [git](https://git-scm.com/)
- Ruby via [`rbenv`](https://github.com/rbenv/rbenv)


## Install

**Assumption**: you have [`oh-my-zsh`](http://ohmyz.sh/) is already installed.

Your dotfiles are personal. [Fork this repo](https://github.com/lewagon/dotfiles/fork) on Github, and then clone it on your computer.

```
# Don't copy paste this line, type it and put *your*
$ GITHUB_USERNAME=my_github_username

# You can copy paste this line *without changing anything*
$ mkdir -p ~/code/$GITHUB_USERNAME && cd $_ && git clone git@github.com:$GITHUB_USERNAME/dotfiles.git && cd dotfiles
```

Run the `dotfiles` installer. It will prompt you for your name and your email.

```bash
$ zsh install.sh
```

Then run the git installer:

```bash
zsh git_setup.sh
```

☝️ This will prompt you for your name (Firstname Lastname) and your email.

Be careful, you need to put the same email as the one you sign up with on GitHub.


You're all set!
