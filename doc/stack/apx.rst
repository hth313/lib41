.. index:: APX

.. object:: APX

``APX`` restarts digit entry and makes it possible to append to the
number in X, somewhat corresponding to the append facility in the
alpha register.

One idea to use it is to assign it to the ``SHIFT``-``XEQ`` key,
giving it the same position as the alpha append facility, but on
the user keyboard.

The sign of the number is observed. Decimal point is preserved
provided that the number is in range to be displayed without an
exponent and not losing non-zero digits.

Large exponents are ignored, giving the mantissa as an integer to
be edited. Very small numbers are made large enough to display
without exponent, but still as small as possible. A full mantissa
of digits will start digit entry without a displayed underscore,
which is consistent with how such numbers are shown in digit
entry. The number can still be edited and removing the last digit
will reveal the underscore prompt.

This is an MCODE variant of the synthetic program with the same
name that appears in the book *Extend your HP-41*.

.. note::

   ``APX`` is fully programmable, but is only meaningful if followed by
   either ``STOP`` or ``PSE`` in which case the program stops (or pauses)
   and the displayed number can be edited. Unfortunately it will not
   work properly if followed by ``PROMPT`` or ``AVIEW``.

   One bonus feature is that ``APX`` works as a programmable alpha
   append if used in a program with alpha mode on. In this case the
   alpha register is displayed with a prompt, ready to accept more
   characters to be appended to the alpha register.
