#######
roz API
#######

Working with the ``roz`` API.


Preparation
===========

Start the REPL:

.. code:: bash

    $ ./roz repl


Initialize roz Data
===================

Prep the database (create schemas, start mnesia, create tables, etc,):

.. code:: cl

    > (slurp '"src/roz.lfe")
    #(ok roz)
    > (init)
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
    >


Added Data
==========

TBD


Querying Data
=============

TBD


.. Links
.. -----
.. _LFE: https://github.com/rvirding/lfe
