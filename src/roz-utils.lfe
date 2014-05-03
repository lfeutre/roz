(defmodule roz-utils
  (export all))

(defun get-apps ()
  (lists:sort
    (lists:map
      (lambda (x) (element 1 x))
      (application:which_applications))))

(defun get-running ()
  (lists:sort
    (sets:to_list
      (sets:intersection
        (sets:from_list (get-apps))
        (sets:from_list '(mnesia))))))

(defun running? ()
  (case (get-running)
    ('() 'false)
    (_ 'true)))
