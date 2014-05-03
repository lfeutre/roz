(defmodule roz
  (export all))

(defun noop ()
  'noop)

(defun init ()
  `#(status
    #(create-schema ,(mnesia:create_schema (list (node))))
    #(start-db ,(application:ensure_started 'mnesia))
    #(structure ,(roz-structure:init))))
