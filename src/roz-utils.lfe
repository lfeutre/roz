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

(defun get-app-src-version (filename)
  (let* (((tuple 'ok (list app)) (file:consult filename)))
    (proplists:get_value 'vsn (element 3 app))))

(defun get-lfe-version ()
  (get-app-src-version '"deps/lfe/src/lfe.app.src"))

(defun get-roz-version ()
  (get-app-src-version '"src/roz.app.src"))

(defun get-version ()
  `(#(erlang ,(erlang:system_info 'otp_release))
    #(emulator ,(erlang:system_info 'version))
    #(driver-version ,(erlang:system_info 'driver_version))
    #(lfe ,(get-lfe-version))
    #(roz ,(get-roz-version))))
