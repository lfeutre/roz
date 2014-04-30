(defmodule roz
  (export all))

(defun noop ()
  'noop)

(defun init ()
  (tuple 'status
         (tuple 'create-schema (mnesia:create_schema (list (node))))
         (tuple 'start (mnesia:start))
         (tuple 'structure (roz-structure:init))))
