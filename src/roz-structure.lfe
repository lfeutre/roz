(defmodule roz-structure
  (export all))

(include-lib "include/records.lfe")
(include-lib "deps/lfe-utils/include/mnesia-macros.lfe")

(defun create-set-tables ()
  "Define the tables that need unique entries."
  (list
    (create-table roz-monster ())
    (create-table roz-group ())
    (create-table roz-team ())
    (create-table roz-product ())
    (create-table roz-input ())
    (create-table roz-output ())))

(defun create-bag-tables ()
  "Define the tables whose entries can have multiple values."
  (list
    (create-table roz-comment (#(type bag)))
    (create-table roz-rating (#(type bag)))))

(defun get-status (list-of-tuples)
  "Get the overall status for a list of table status data.

  If every table is okay, the dropwhile will return an empty list. Whereas any
  non-ok table status will result in a non-empty list (and thus indicate an
  error)."
  (case (lists:dropwhile (lambda (x) (== (element 2 x) 'ok))
                         list-of-tuples)
    ('() 'ok)
    (_ 'error)))

(defun init ()
  (let* ((sets (create-set-tables))
         (bags (create-bag-tables))
         (status (get-status (++ sets bags))))
    (tuple
      status
      (list
        (tuple 'create-set-tables sets)
        (tuple 'create-bag-tables bags)))))
