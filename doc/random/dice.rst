.. index:: dice; two rolls, random numbers

.. object:: 2D6

This is an example of using the pseudo random generator from inside
MCODE. It simulates rolling two six sided dices and returns the result
``2``-``12``.

Key properties of a pseudo random number generator is to produce
seemingly random numbers with a fairly even distribution. Sometimes
you may want distributions that have other properties, which rolling
two dices and adding the values together is a good example of.

You may also want to study the implementation of ``2D6`` as it shows
how to use the MCODE entry points provided by ``RNDM``. Making
multiple pseudo random numbers can be made much faster in MCODE
compared to RPN.


.. note::

  Uneven distributions can be useful in generating more interesting
  behaviors in games.
  You are not limited to rolling dices, it is possible to implement
  elaborate actions, such as combat sequences with messages all in
  MCODE, opening up for fast paced action games.
