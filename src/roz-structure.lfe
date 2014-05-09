(defmodule roz-structure
  (export all))

(include-lib "include/records.lfe")
(include-lib "deps/lfe-utils/include/mnesia-macros.lfe")

(defun get-default-attrs ()
  `(#(disc_copies (,(node)))))

(defun create-set-tables (default-attrs)
  "Define the tables that need unique entries."
  (let ((attrs (++ default-attrs '(#(type set)))))
    ;;(io:format '"~p~n" (list attrs))
    ;;(lfe_io:format '"~p~n" (list attrs))
    (list
      (create-table roz-monster attrs)
      (create-table roz-group attrs)
      (create-table roz-team attrs)
      (create-table roz-product attrs)
      (create-table roz-input attrs)
      (create-table roz-output attrs))))

(defun create-bag-tables (default-attrs)
  "Define the tables whose entries can have multiple values."
  (let ((attrs (++ default-attrs '(#(type bag)))))
    (list
      (create-table roz-comment attrs)
      (create-table roz-rating attrs))))

(defun get-status (list-of-tuples)
  "Get the overall status for a list of table status data.

  If every table is okay, the dropwhile will return an empty list. Whereas any
  non-ok table status will result in a non-empty list (and thus indicate an
  error)."
  (case (lists:dropwhile (lambda (x) (== (element 2 x) 'ok))
                         list-of-tuples)
    ('() 'ok)
    (_ 'error)))

(defun table-info
  ((table-name (cons info-key _))
    (mnesia:table_info table-name info-key)))

(defun init ()
  (let* ((attrs (get-default-attrs))
         (sets (create-set-tables attrs))
         (bags (create-bag-tables attrs))
         (status (get-status (++ sets bags))))
    (tuple
      status
      (list
        (tuple 'create-set-tables sets)
        (tuple 'create-bag-tables bags)))))

(defun wait ()
  (mnesia:wait_for_tables
    '(roz-monster roz-comment roz-rating roz-group roz-team roz-product
      roz-input roz-output)
    5000))

(defun delete-table (table-name)
  (mnesia:delete_table table-name))

; (defun add-set-table (table-name)
;   (create-table table-name (++ (get-default-attrs) '(#(type set)))))

; (defun add-bag-table (table-name)
;   (create-table table-name (++ (get-default-attrs) '(#(type bag)))))
