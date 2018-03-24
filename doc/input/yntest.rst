.. index:: Y/N

.. object:: Y/N

Display alpha register and the string ``Y/N?`` right justified in the
display and wait for key input. Pressing ``Y`` will resume execution
at the following line, ``N`` will also resume execution but skips the
following line.

Pressing ``ON`` will turn the calculator off. Pressing ``R/S`` or back
arrow will stop execution and leave the program pointer at the ``Y/N``
instruction that was interrupted.

Any other key will blink the display and wait for another key.

This routine times out after about 25 seconds and in that case behaves
as if ``N`` was pressed.
