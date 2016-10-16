# emacs.d

## Installation

* Install emacs using [brew](http://brew.sh/).

`brew install emacs --HEAD --cocoa --srgb`

* Install [Cask](http://cask.readthedocs.io/) using CURL.

`curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
`

* Clone this repo

`git clone https://github.com/magandrez/emacs.d.git .`

* Run cask install in `~/.emacs.d/`

`cask install`

* Install auto-complete from emacs

`M-x package-install auto-complete`

* Install ag (the silver searcher)[https://github.com/ggreer/the_silver_searcher]

`brew install the-silver-searcher`

* Enable MELPA packages (to install `ag`)

Add `(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))` to init.el. Packages should be available under `M-x package-list-packages`.

Re-start emacs and you should be ready to go.

