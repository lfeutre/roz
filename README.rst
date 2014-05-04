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
to bring those scripts together under a single framework: `roz`_.


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

.. code:: bash

    $ git clone git@github.com:lfe/roz.git
    $ cd roz
    $ make get-deps
    $ make compile


Configuration
=============

Update the ``./resources/config/company-name`` file to hold your company's
name. Don't use any punctuation or spaces in the name. This will be used to
generate a directory in `pwd` where Mnesia data will be stored.

Next, set up ``roz`` Bash auto-completion (if you use Bash as your shell,
that is):

.. code:: bash

  $ . ./resources/bash/complete


CLI Usage
=========


roz REPL
--------

The following will start up an LFE REPL with the mnesia database (as
configured above) and all the dependency libs configured:

.. code:: bash

    $ ./bin/roz repl


Help
----

.. code:: bash

    $ ./bin/roz -h
    $ ./bin/roz help

These are also printed when an error is caught in the script.


Initialize roz Data
-------------------

.. code:: bash

    $ ./bin/roz init
    Initializing roz data ...


    #(status
      #(create-schema ok)
      #(start-db ok)
      #(structure
        #(ok
          (#(create-set-tables
             (#(atomic ok)
              #(atomic ok)
              #(atomic ok)
              #(atomic ok)
              #(atomic ok)
              #(atomic ok)))
           #(create-bag-tables (#(atomic ok) #(atomic ok)))))))

Add Data
--------

This tool is called "roz" so employees or "reports" are necessarily called
"monsters". You're welcome.

.. code:: bash

    $ ./bin/roz add monster alice456 Alice Roberts Engineering \
          Software-Development Messaging RabbitMQ

If you'd like to add groups, teams, and products ahead of time, you may do
that as well:

.. code:: bash

  $ ./bin/roz add group Software-Development
  $ ./bin/roz add team Messaging
  $ ./bin/roz add product Rabbit-MQ

Note that only single-word arguments are allowed. If your group, team, or
project has more than one word in it, join them with a hyphen.


Listing Data
------------

.. code:: bash

    $ ./bin/roz list groups
    $ ./bin/roz list teams
    $ ./bin/roz list products


Getting Info
------------

.. code:: bash

    $ ./bin/roz info db

.. code:: bash

    $ ./bin/roz info table group size
    $ ./bin/roz info table group type
    $ ./bin/roz info table group attributes
    $ ./bin/roz info table group all

For a full list of allowed table info parameters, see the mnesia `mnesia:table_info`_ docs.


.. Links
.. -----
.. _LFE: https://github.com/rvirding/lfe
.. _lfeunit: https://github.com/lfe/lfeunit
.. _lfetool: https://github.com/lfe/lfetool
.. _roz: http://www.youtube.com/watch?v=RtWBlDC2-ss#t=16s
.. _mnesia:table_info: http://www.erlang.org/doc/man/mnesia.html#table_info-2
