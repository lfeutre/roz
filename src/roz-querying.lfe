(defmodule roz-querying
  (export all))

(include-lib "stdlib/include/qlc.hrl")
(include-lib "include/records.lfe")
(include-lib "deps/lfe-utils/include/mnesia-macros.lfe")

(defun list-data (table-name)
  (mnesia:transaction
    (lambda ()
      (mnesia:foldl
        (lambda (x acc) (++ (list x) acc))
        '()
        table-name))))

(defun process-data (table-name fn)
  (let (((tuple 'atomic data) (list-data table-name)))
    (lists:map
      (lambda (x) (funcall fn x))
      data))
    'ok)

(defun show-data (table-name)
  (process-data
    table-name
    (lambda (x) (lfe_io:format '"~p~n" (list x)))))

(defun list-groups ()
  (process-data
    'roz-group
    (lambda (x) (lfe_io:format '"~s~n" (list (roz-group-group-name x))))))
