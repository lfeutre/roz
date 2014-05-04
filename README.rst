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


Version
-------

.. code:: bash

    $ ./bin/roz -v
    $ ./bin/roz version

Output:

.. code:: cl

    Version info:

    (#(erlang "R16B03-1")
     #(emulator "5.10.4")
     #(driver-version "2.2")
     #(lfe "0.6.2")
     #(roz "0.0.1"))


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
    
Output:

.. code:: cl

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
"monsters". You're welcome. (Honestly, it is much more fun for everyone;
better a Monsters Inc. refernece than the dry, soulless specturm of terms
such as "report", "employee", "worker", "member", "user", etc.)

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
    $ ./bin/roz list monsters

Sample output:

.. code:: bash

Getting list of all monsters ...

    * Carol, Bob (bob321)
    * Davids, Carol (carol890)
    * Eve, David (deve29)
    * Fredericks, Evy (ev314)


Getting Info
------------

.. code:: bash

    $ ./bin/roz info db

Sample output:

.. code:: erlang

    Getting DB info ...

    ---> Processes holding locks <---
    ---> Processes waiting for locks <---
    ---> Participant transactions <---
    ---> Coordinator transactions <---
    ---> Uncertain transactions <---
    ---> Active tables <---
    schema         : with 9        records occupying 1362     words of mem
    roz-team       : with 2        records occupying 367      words of mem
    roz-product    : with 4        records occupying 379      words of mem
    roz-input      : with 0        records occupying 305      words of mem
    roz-comment    : with 0        records occupying 305      words of mem
    roz-group      : with 3        records occupying 393      words of mem
    roz-rating     : with 0        records occupying 305      words of mem
    roz-output     : with 0        records occupying 305      words of mem
    roz-monster    : with 5        records occupying 355      words of mem
    ===> System info in version "4.11", debug level = none <===
    opt_disc. Directory "/Users/oubiwann/Dropbox/lab/erlang/roz/MyCompany" is used.
    use fallback at restart = false
    running db nodes   = [nonode@nohost]
    stopped db nodes   = []
    master node tables = []
    remote             = []
    ram_copies         = []
    disc_copies        = ['roz-comment','roz-group','roz-input','roz-monster',
                          'roz-output','roz-product','roz-rating','roz-team',
                          schema]
    disc_only_copies   = []
    [{nonode@nohost,disc_copies}] = ['roz-monster','roz-output','roz-rating',
                                     'roz-group','roz-comment','roz-input',
                                     'roz-product','roz-team',schema]
    2 transactions committed, 0 aborted, 0 restarted, 0 logged to disc
    0 held locks, 0 in queue; 0 local transactions, 0 remote
    0 transactions waits for other nodes: []

.. code:: bash

    $ ./bin/roz info table group all
    $ ./bin/roz info table team size
    $ ./bin/roz info table product type
    $ ./bin/roz info table monsters attributes
    
Sample uutput for that last command:

.. code:: cl

    Getting table info for 'monster', key 'attributes' ...

    (nick first last org)

For a full list of allowed table info parameters, see the
`mnesia:table_info`_ docs.

The ``info`` command also has aliases for ``help`` and ``version``:

.. code:: bash

    $ ./bin/roz info usage
    $ ./bin/roz info version


.. Links
.. -----
.. _LFE: https://github.com/rvirding/lfe
.. _lfeunit: https://github.com/lfe/lfeunit
.. _lfetool: https://github.com/lfe/lfetool
.. _roz: http://www.youtube.com/watch?v=RtWBlDC2-ss#t=16s
.. _mnesia:table_info: http://www.erlang.org/doc/man/mnesia.html#table_info-2
