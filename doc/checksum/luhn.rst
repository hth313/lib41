.. index:: LUHN?

.. object:: LUHN?

Validate numbers using the Luhn algorithm which is used on a variety
of identification numbers, such as credit card numbers, IMEI numbers,
National Provider Identifier numbers in the United States, Canadian
Social Insurance Numbers, Israel ID Numbers and Greek Social Security
Numbers (ΑΜΚΑ).

This routine expects the number to be entered as a raw BCD number in Y
(upper part) and X (lower 14 digits). This can either be done by
entering up to 14 digits in alpha register and then run ``CODE``.

Another alternative is to use the Ladybug module and set the
calculator to word size 56 and hexadecimal mode, then you can just
enter the digits beyond the 14 first to Y, and the rest to X:

.. code-block:: ca65

   WSIZE 56
   HEX
   34    H
   ENTER
   35828475722223 H
   LUHN?

With respond with ``YES`` or ``NO`` in keyboard mode. In a program it
will skip the next program line if the check digit is not correct.
