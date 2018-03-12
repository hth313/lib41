.. index:: F/E, FIX-ENG mode

.. object:: F/E

Sets mixed ``FIX`` and ``ENG`` display mode. Normally when the HP-41 is
in ``FIX`` mode and the number cannot be shown without an exponent,
the display routine uses scientific mode (``SCI``).
This routine configures the calculator so that it falls back to
engineering mode instead (``ENG``, showing exponents with multiples of 3).

This works because there are 2 flags controlling the mode display,
giving four possible settings. However, there are only commands to set
three of the four modes. This routine sets the "hidden" fourth
mode, which happens to act as ``FIX`` with fallback to ``ENG`` when an
exponent is needed.
