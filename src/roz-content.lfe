(defmodule roz-content
  (export all))

(include-lib "include/records.lfe")

(defun add-monster (nick first last org group team product)
  "A utility function for adding an entry to the monster table."
  (let* ((monster (make-roz-monster nick nick
                                    first first
                                    last last
                                    org org)))
    (add-group group nick)
    (add-team team nick)
    (add-product product nick)
    (mnesia:transaction (lambda () (mnesia:write monster)))))

(defun add-monsters
  "A utility function for populating the monster table from a list of lists."
  (('())
   'ok)
  (((cons (list nick first last org group team product) tail))
   (add-monster nick first last org group team product)
   (add-monsters tail)))

(defun add-group (name)
  "A utility function for adding an entry to the group table."
  (let* ((group (make-roz-group group-name (atom_to_list name))))
    (mnesia:transaction (lambda () (mnesia:write group)))))

(defun add-group (name nick)
  "Add a group with a relation to a monster."
  (let ((link (make-roz-group-link monster-nick nick group-name name)))
    (add-group name)
    (mnesia:transaction (lambda () (mnesia:write link)))))

(defun add-groups
  "A utility function for populating the group table from a list of lists."
  (('())
   'ok)
  (((cons (list name) tail))
   (add-group name)
   (add-groups tail)))

(defun add-team (name)
  "A utility function for adding an entry to the team table."
  (let* ((team (make-roz-team team-name (atom_to_list name))))
    (mnesia:transaction (lambda () (mnesia:write team)))))

(defun add-team (name nick)
  "Add a team with a relation to a monster."
  (let ((link (make-roz-team-link monster-nick nick team-name name)))
    (add-team name)
    (mnesia:transaction (lambda () (mnesia:write link)))))

(defun add-teams
  "A utility function for populating the group table from a list of lists."
  (('())
   'ok)
  (((cons (list name) tail))
   (add-team name)
   (add-teams tail)))

(defun add-product (name)
  "A utility function for adding an entry to the product table."
  (let* ((product (make-roz-product product-name (atom_to_list name))))
    (mnesia:transaction (lambda () (mnesia:write product)))))

(defun add-product (name nick)
  "Add a product with a relation to a monster."
  (let ((link (make-roz-product-link monster-nick nick product-name name)))
    (add-product name)
    (mnesia:transaction (lambda () (mnesia:write link)))))

(defun add-products
  "A utility function for populating the product table from a list of lists."
  (('())
   'ok)
  (((cons (list name) tail))
   (add-product name)
   (add-products tail)))
