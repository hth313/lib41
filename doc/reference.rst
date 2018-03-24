******************
Routines reference
******************

This chapter is divided into sections on different categories to group
routines together based on their application.


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

Bitwise operations on BCD integers.

.. include:: bitwise/bcdand.rst


Buffer
======

Routines related to I/O buffers and the buffer area (except for key
assignments.

.. include:: buffer/killbuf.rst

.. include:: buffer/bufsize.rst

.. include:: buffer/bufthere.rst


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

``KEYFC`` and ``KEYFCN`` are subroutines useful for dispatching on
keys using a table. Based on ``KEY-FC`` from the Time module.


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
