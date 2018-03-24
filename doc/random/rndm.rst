.. index:: random numbers

.. object:: RNDM

As you probably know the HP-41 does not come with a pseudo random
number generator. The Games module by Hewlett-Packard has a pseudo
random number generator that generates 6 digit numbers between ``0`` and
``0.999999``.
The formula used here is the same as that one, but here it is written
in MCODE which makes it faster. It also just returns the next pseudo
random number to X without disturbing any registers.

The seed value is stored in a buffer number 6. This buffer is
created if it does not exist when a pseudo random number is requested.
The initial seed is based on the current time as provided by the time
module (if present). If not timer module is present, the initial seed
value ``0`` is used.

.. note::
   The returned pseudo random number may need to be scaled or adjusted
   to suit your application.

.. note::
   If you want to preserve the seed when calculator is turned off you
   need to reclaim buffer 6 by using deep sleep wake up poll vector.


.. object:: SEED

This routine takes the value from X and uses that as the seed. This
is useful when you want to generate a series of pseudo random numbers
that can be repeated (by setting the same initial seed value).
