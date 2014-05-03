(defmodule roz
  (export all))

(defun noop ()
  'noop)

(defun init ()
  ;; if mnesia is running, we need to stop if before we call create_schema
  ;; debug
  ;;(io:format '"Is running? ~p~n" (list (roz-utils:running?)))
  (if (roz-utils:running?)
    (mnesia:stop))
  `#(status
    #(create-schema ,(mnesia:create_schema (list (node))))
    #(start-db ,(application:ensure_started 'mnesia))
    #(structure ,(roz-structure:init))))
