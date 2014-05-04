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

(defun list-data (table-name)
  (let (((tuple 'atomic data) (query-data table-name)))
    data))

(defun process-data (table-name fn)
  (progn
    (lists:map
      (lambda (x) (funcall fn x))
      (lists:sort (list-data table-name)))
    'ok))

(defun show-data (table-name)
  (process-data
    table-name
    (lambda (x) (lfe_io:format '"~p~n" (list x)))))

(defun show-groups ()
  (process-data
    'roz-group
    (lambda (x) (lfe_io:format '"* ~s~n" (list (roz-group-group-name x))))))

(defun show-teams ()
  (process-data
    'roz-team
    (lambda (x) (lfe_io:format '"* ~s~n" (list (roz-team-team-name x))))))

(defun show-products ()
  (process-data
    'roz-product
    (lambda (x) (lfe_io:format '"* ~s~n" (list (roz-product-product-name x))))))

(defun list-monsters ()
  (lists:map
    (lambda (x)
      (list (roz-monster-last x)
            (roz-monster-first x)
            (roz-monster-nick x)))
    (list-data 'roz-monster)))

(defun show-monsters ()
  (progn
    (lists:map
      (lambda (monster)
        (lfe_io:format '"* ~s, ~s (~s)~n" monster))
      (lists:sort (list-monsters))))
    'ok)
