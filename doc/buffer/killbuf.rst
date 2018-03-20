.. index:: KILLBUF

.. object:: KILLBUF

Remove the I/O buffer as specified by the number in X (0 - 15).
Does nothing if a buffer with given number does not exist.

.. note::

   I/O area is packed as a result of this which means that any other
   buffer that has been marked for removal are also deleted.
