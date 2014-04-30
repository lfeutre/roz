###
roz
###

.. image:: resources/images/Roz-transback-sml.png

*An Erlang Lisper's Tool for Team Management*

Introduction
============

I've been carrying around a set of scripts (written in different languages)
for several years which have helped me accomplish various management tasks
for engineering teams (and teams of teams). This project reflects an attempt
to bring those scripts together under a single framework.


Dependencies
------------

This project assumes that you have `lfetool`_ installed somwhere in your
``$PATH``.

This project depends upon the following, which are installed to the ``deps``
directory of this project when you run ``make deps``:

* `LFE`_ (Lisp Flavored Erlang; needed only to compile)
* `lfeunit`_ (needed only to run the unit tests)


Installation
============

Just add it to your ``rebar.config`` deps:

.. code:: erlang

    {deps, [
        ...
        {roz, ".*", {git, "git@github.com:lfe/roz.git", "master"}}
      ]}.


And then do the usual:

.. code:: bash

    $ rebar get-deps
    $ rebar compile


Download
========

Get the code from github and compile it:

.. code:: shell

    $ git clone git@github.com:lfe/roz.git
    $ cd roz
    $ make get-deps
    $ make compile


CLI Usage
=========

TBD

API Usage
=========

Update the ``data.mk`` file's ``DB`` variable to your company's name.

Start the REPL:

.. code:: bash

    $ make mnesia-shell

Prep the database (create schemas, start mnesia, create tables, etc,):

.. code:: cl

    > (slurp '"src/roz.lfe")
    #(ok roz)
    > (init)
    #(status
      #(create-schema ok)
      #(start ok)
      #(structure
        #(ok
          (#(create-set-tables
             (#(atomic ok) #(atomic ok) #(atomic ok) #(atomic ok)))
           #(create-bag-tables
             (#(atomic ok) #(atomic ok) #(atomic ok) #(atomic ok)))))))
    >

Now you're ready to start using ``roz``:

TBD

.. Links
.. -----
.. _LFE: https://github.com/rvirding/lfe
.. _lfeunit: https://github.com/lfe/lfeunit
.. _lfetool: https://github.com/lfe/lfetool
