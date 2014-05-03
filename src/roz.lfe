(defmodule roz
  (export all))

(defun noop ()
  'noop)

(defun start-db ()
  (case (roz-utils:running?)
    ('true #(error already-running))
    ('false (mnesia:start))))

(defun init ()
  `#(status
    #(create-schema ,(mnesia:create_schema (list (node))))
    #(start-db ,(start-db))
    #(structure ,(roz-structure:init))))
