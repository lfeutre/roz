(defmodule roz-script
  (export all))

(defun format-run (args)
  (application:ensure_started 'mnesia)
  (lfe_io:format
    '"~p~n" (list (run args))))

(defun run (args)
  (let* (((tuple (list mod func) args) (lists:split 2 args))
         (new-args (list mod func (convert-args args))))
    ;; debug
    ;;(lfe_io:format '"new-args: ~p~n" (list new-args))
    (apply #'dispatch/3 new-args)))

(defun convert-args (args)
  (lists:map #'atom_to_list/1 args))

(defun dispatch
  ((mod func '())
    (call mod func))
  ((mod func (cons a '()))
    (call mod func a))
  ((mod func (cons a (cons b (cons c (cons d (cons e (cons f '())))))))
    (call mod func a b c d e f))
  ((mod func (cons a (cons b (cons c (cons d (cons e '()))))))
    (call mod func a b c d e))
  ((mod func (cons a (cons b (cons c (cons d '())))))
    (call mod func a b c d))
  ((mod func (cons a (cons b (cons c '()))))
    (call mod func a b c))
  ((mod func (cons a b))
    (call mod func a b)))
