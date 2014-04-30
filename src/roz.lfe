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
    ;; note that create_schema starts the mnesia database
    #(create-schema ,(mnesia:create_schema (list (node))))
    #(structure ,(roz-structure:init))))
