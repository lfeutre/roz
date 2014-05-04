(defmodule roz-script-help
  (export all))

(defun noop ()
  'noop)

(defun usage
  ((script-path (cons script-name _))
    (io:format '"
Usage: ~s <command> <subcommand> [<args>]

The easiest way to use ~s is with the bash tab-completion script provided:
  $ . ./resources/bash/completion

Available commands include: help, version, init, repl, add, info, list.

Some of these have subcommands.

Full documentation for all the commands is avaiable here:
  https://github.com/lfe/roz/blob/master/README.rst#cli-usage


" (list (atom_to_list script-path) (atom_to_list script-name)))))
