# TwoD's dotfiles

I am Henrik 'TwoD' Danielsson, and these are my dotfiles.

# Requirements

Installation is simple and requires no pre-existing software, other than the
program(s) the dotfiles are meant for, of course.
To make installation and version control easy, I symlink my dotfiles to their
appropriate location using [GNU Stow](https://www.gnu.org/software/stow).

## What's inside

The configuration for a program is usually found under a folder named after
its binary. Dotfiles for git are found under 'git' and those for vim are found
under 'vim', etc. I have not documented the contents and reasoning beind some
choices yet so for now you'll have to dig around a bit to see what everything
does. The basics are simple though; This repository is meant to set up my
personal preferences and non-secret configuration wherever I need it.

# Installing

I keep my dotfiles checkout in a '~/dotfiles' directory, so this assumes that
layout. If you have checked it out elsewhere, the arguments to `stow` may need
to change to compensate for the relative path difference.

To install a dotfile package with GNU Stow, use its name:

- `stow vim`
- `stow git`
- `stow tmux`

Since these are all meant to go into `$HOME`, and my dotfiles checkout is
located directly below it, nothing else is needed.
For a package meant for some global configuration, you would need to add a
target directory:

- `stow -t / apache`

# Removing

- `stow -D vim`
- `stow -D git`
