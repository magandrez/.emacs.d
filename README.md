# emacs.d

## Installation

1. Install [Cask](http://cask.readthedocs.io/) using CURL.
`curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python`

2. Clone this repository in your home folder
`git clone https://github.com/magandrez/.emacs.d.git`

3. Install emacs using [brew](http://brew.sh/).
`brew install --HEAD --with-cocoa --srgb emacs`

 * Run `brew linkapps emacs` if you want to start Emacs from Launchpad/Spotlight/Quicksilver.
 
4. Run cask install in `~/.emacs.d/`
`cask install`

5. Install ag [the silver searcher](https://github.com/ggreer/the_silver_searcher)
`brew install the_silver_searcher`

6. Re-start emacs and you should be ready to go.

