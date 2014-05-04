(defmodule roz-querying
  (export all))

(include-lib "stdlib/include/qlc.hrl")
(include-lib "include/records.lfe")
(include-lib "deps/lfe-utils/include/mnesia-macros.lfe")

(defun query-data (table-name)
  (mnesia:transaction
    (lambda ()
      (mnesia:foldl
        (lambda (x acc) (++ (list x) acc))
        '()
        table-name))))

(defun process-data (table-name fn)
  (let (((tuple 'atomic data) (query-data table-name)))
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

(defun list-teams ()
  (process-data
    'roz-team
    (lambda (x) (lfe_io:format '"~s~n" (list (roz-team-team-name x))))))
