(defmodule roz-script
  (export all))

(defun format-run (args)
  (lfe_io:format
    '"~p~n" (list (run args))))

(defun run (args)
  (roz-structure:wait)
  (let (((tuple (list mod func) args) (lists:split 2 args)))
    ;; debug
    ;;(lfe_io:format '"new-args: ~p~n" (list new-args))
    (apply #'dispatch/3 (list mod func args))))

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
