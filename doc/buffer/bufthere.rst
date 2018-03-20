.. index:: BUF?

.. object:: BUF?

Test if the I/O buffer as specified by the number in X (0 - 15) exists.
In keyboard mode, it will respond with either ``YES`` or ``NO``. In a
program it will skip the following line if the buffer does not exist.
