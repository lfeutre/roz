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


Download
========

Get the code from github and compile it:

.. code:: shell

    $ git clone git@github.com:lfe/roz.git
    $ cd roz
    $ make get-deps
    $ make compile


Configuration
=============

Update the ``company-name`` file to hold your company's name. Don't use any
punctuation or spaces in the name. This will be used to generate a directory
in `pwd` where Mnesia data will be stored.

Next, set up ``roz`` Bash auto-completion (if you use Bash as your shell,
that is):

.. code:: bash

  $ . bash-complete


CLI Usage
=========

roz REPL
,,,,,,,,

The following will start up an LFE REPL with the mnesia database (as
configured above) and all the dependency libs configured:

.. code:: bash

    $ ./roz repl


Initialize roz Data
,,,,,,,,,,,,,,,,,,,

.. code:: bash

    $ ./roz init


Add Data
,,,,,,,,

This tool is called "roz" so employees or "reports" are necessarily called
"monsters". You're welcome.

.. code:: bash

    $ ./roz add monster alice456 Alice Roberts Engineering \
    "Software Development" Messaging RabbitMQ

If you'd like to add groups, teams, and products ahead of time, you may do
that as well:

.. code:: bash

  $ ./roz add gruop "Software Development"
  $ ./roz add team Messaging
  $ ./roz add product "Rabbit MQ"


API Usage
=========

Start the REPL:

.. code:: bash

    $ ./roz repl


Initialize roz Data
,,,,,,,,,,,,,,,,,,,

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
