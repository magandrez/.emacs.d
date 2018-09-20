# emacs.d

n-th re-write of emacs configs. This time as literate code.

The configs are byte compiled, this is just an exercise "for science", since there is no real need for byte compile configs for speed unless complex there is defuncs.

Overall, the startup time and response is faster than previous iteration of configs.

More info in the `init.org` itself.

## Notes

- `init.el` should only contain the following, enabling init.org to be tangled and loaded into init.el

```lisp
(require 'org)
;; Open the configuration
(find-file (concat user-emacs-directory "init.org"))
;; tangle it
(org-babel-tangle)
;; load it
(load-file (concat user-emacs-directory "init.el"))
;; finally byte-compile it
(byte-compile-file (concat user-emacs-directory "init.el"))
```

Thus, init.el should be ignored from the repo:

`git update-index --assume-unchanged init.el`

- Adding new packages would mean:
-- Editing the block in init.org where packages are requried.
-- Remove the compiled init.elc from the repo.
-- Stop and start emacs server.

## Disclaimer

There are some bugs in the configs, such as the use of built-in line numbering with `display-line-numbers-mode` not working as expected.
