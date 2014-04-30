(defmodule roz-content
  (export all))

(include-lib "include/records.lfe")

(defun add-monster (first last nick org)
  "A utility function for adding an entry to the monster table."
 (let* ((id (lfe-utils:uuid4 #(type list)))
        (monster (make-roz-monster id id
                                   first first
                                   last last
                                   nick nick
                                   org org)))
   (mnesia:transaction (lambda () (mnesia:write monster)))))

(defun add-monsters
  "A utility function for populating the monster table from a list of lists."
  (('())
   'ok)
  (((cons (list first last nick org) tail))
   (add-monster first last nick org)
   (add-monsters tail)))

; (defun insert-employee (employee department-id project-names)
;   "A utility function for populating the employee table and updating all the
;   associated relationships."
;   (mnesia:transaction
;     (lambda ()
;       (mnesia:write employee)
;       (insert-department-relation (employee-id employee) department-id)
;       (insert-project-relations (employee-id employee) project-names))))

; (defun insert-department-relation (employee-id department-id)
;   "A function that is used when establishing the relationship between an
;   employee and a department."
;   (let ((in-department (make-in-department
;                               employee-id employee-id
;                               department-id department-id)))
;     (mnesia:write in-department)))

; (defun insert-project-relations
;   "A function that is used when establishing the relationships between an
;   employee and any number of projects."
;   ((_ '())
;     'ok)
;   ((employee-id (cons project-name tail))
;     (let ((in-project (make-in-project
;                         employee-id employee-id
;                         project-name project-name)))
;       (mnesia:write in-project)
;       (insert-project-relations employee-id tail))))

; (defun insert-employees
;   "Batch 'em up."
;   (('())
;     'ok)
;   (((cons (list id nm sal gen ph rm dep projs) tail))
;     (let ((employee (make-employee
;                       id id
;                       name nm
;                       salary sal
;                       gender gen
;                       phone ph
;                       room-number rm)))
;       (insert-employee employee dep projs)
;       (insert-employees tail))))

; (defun insert-manager (employee-id department-id)
;   (mnesia:transaction
;     (lambda ()
;       (mnesia:write
;         (make-manager employee-id employee-id
;                       department-id department-id)))))
