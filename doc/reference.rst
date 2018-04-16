******************
Routines reference
******************

This chapter is divided into sections on different categories to group
routines together based on their application.


.. table:: Overview
 :widths: 1 1 4
 :column-dividers: none single single none

 +--------------+----------------+----------------------------------+
 |Name          |Category        |Description                       |
 +==============+================+==================================+
 |``ARCLINT``   |alpha           |Append integer from X to alpha    |
 |              |                |register                          |
 +--------------+----------------+----------------------------------+
 |``ASHFX``     |alpha           |Delete X number of characters     |
 |              |                |from alpha register               |
 +--------------+----------------+----------------------------------+
 |``ATOXR``     |alpha           |Take rightmost character from     |
 |              |                |alpha register and return as      |
 |              |                |character code in X               |
 +--------------+----------------+----------------------------------+
 |``XTOAL``     |alpha           |Take character code from X and    |
 |              |                |insert character to left end of   |
 |              |                |alpha register                    |
 +--------------+----------------+----------------------------------+
 |``MAPKEYS``   |assignment      |Rebuild the assignment bitmap     |
 +--------------+----------------+----------------------------------+
 |``MKXYZ``     |assignment      |Make assignment based on          |
 |              |                |instruction codes on stack        |
 +--------------+----------------+----------------------------------+
 |``BCDAND``    |bitwise         |Bitwise AND floating point        |
 |              |                |integer in X                      |
 +--------------+----------------+----------------------------------+
 |``BCDOR``     |bitwise         |Bitwise OR floating point         |
 |              |                |integer in X                      |
 +--------------+----------------+----------------------------------+
 |``BCDXOR``    |bitwise         |Bitwise exclusive OR floating     |
 |              |                |point integer in X                |
 +--------------+----------------+----------------------------------+
 |``BCDNOT``    |bitwise         |Bitwise complement floating       |
 |              |                |point integer in X                |
 +--------------+----------------+----------------------------------+
 |``BUFSIZE``   |buffer          |Get the size of a buffer          |
 +--------------+----------------+----------------------------------+
 |``BUF?``      |buffer          |Does a buffer exist?              |
 +--------------+----------------+----------------------------------+
 |``KILLBUF``   |buffer          |Remove a buffer                   |
 +--------------+----------------+----------------------------------+
 |``LUHN?``     |checksum        |Luhn algorithm                    |
 +--------------+----------------+----------------------------------+
 |``XEQ>GTO``   |control         |Drop topmost return address       |
 +--------------+----------------+----------------------------------+
 |``PC<>RTN``   |control         |Exchange PC with topmost return   |
 |              |                |address                           |
 +--------------+----------------+----------------------------------+
 |``RTN?``      |control         |Is there a return address on the  |
 |              |                |call stack?                       |
 +--------------+----------------+----------------------------------+
 |``GE``        |control         |Go to end of program memory       |
 +--------------+----------------+----------------------------------+
 |``CODE``      |conversion      |Convert hex number in alpha       |
 |              |                |register to NNN in X              |
 +--------------+----------------+----------------------------------+
 |``DECODE``    |conversion      |Convert NNN in X to hex number    |
 |              |                |in alpha register                 |
 +--------------+----------------+----------------------------------+
 |``Y/N?``      |input           |Ask the user a yes or no question |
 +--------------+----------------+----------------------------------+
 |``RNDM``      |random          |Get pseudo random number          |
 +--------------+----------------+----------------------------------+
 |``SEED``      |random          |Set seed for pseudo random number |
 |              |                |generator                         |
 +--------------+----------------+----------------------------------+
 |``APX``       |stack           |Append to number in X             |
 +--------------+----------------+----------------------------------+
 |``F/E``       |stack           |Set mixed ``FIX`` and ``ENG``     |
 |              |                |mode                              |
 +--------------+----------------+----------------------------------+
 |``VMANT``     |stack           |Display mantissa of X             |
 +--------------+----------------+----------------------------------+


.. index:: alpha

Alpha
=====

Routines mainly related to the Alpha register.

.. include:: alpha/arclint.rst

.. include:: alpha/ashfx.rst

.. include:: alpha/atoxr.rst

.. include:: alpha/xtoal.rst


.. index:: assignments

Assignments
===========

Routines related to key re-assignments.

.. include:: assignments/mapkeys.rst

.. include:: assignments/mkxyz.rst


Bitwise
=======

Bitwise operations on BCD integers. These are limited to 32-bit values.

.. include:: bitwise/bcdand.rst


Buffer
======

Routines related to I/O buffers and the buffer area (except for key
assignments.

.. include:: buffer/bufsize.rst

.. include:: buffer/bufthere.rst

.. include:: buffer/killbuf.rst


Checksum
========

Routines related to checksum algorithms.

.. include:: checksum/luhn.rst


.. index:: control

Control
=======

Execution control and the return stack.

.. include:: control/xeqTOgto.rst

.. include:: control/pcEXrtn.rst

.. include:: control/rtnQmark.rst

.. include:: control/ge.rst


.. index:: conversions; float point integer to binary
.. index:: conversions; binary to floating point
.. index:: binary to floating point conversion
.. index:: float point integer to binary conversion


Conversion
==========

Various conversion utilities.

``AtoX`` converts a binary number in A to floating point integer and
saves to X by the ``RCL`` routine in mainframe. Alternative entry
points allows for saving ``A.X`` (``AXtoX``) and drop the result into
X (``AtoXDrop``), suitable after a binary operation.

In the other direction ``XBCD2BIN`` and ``BCD2BIN`` can convert
floating point integer numbers to binary allowing for much larger
numbers compared to ``BCDBIN`` in mainframe.

For getting range limited numbers as input some routines coming from
Extended Functions are provided. These are ```X<999```, ```A<999```
and ```X<256```.


.. include:: conversion/code.rst

.. include:: conversion/decode.rst


Input
=====

``KEYFC`` is useful for dispatching on keys using a table. This is
essentially the same as ``KEY-FC`` from the Time module.


.. include:: input/yntest.rst


.. index:: random numbers, pseudo random numbers

Pseudo random numbers
=====================

.. include:: random/rndm.rst

.. include:: random/dice.rst


.. index:: stack

Stack
=====

.. include:: stack/apx.rst

.. include:: stack/fixeng.rst

.. include:: stack/vmant.rst


.. index:: utilities

Utilities
=========

.. include:: util/error.rst
