.. index:: KILLBUF

.. object:: KILLBUF

   Remove the I/O buffer as specified by the number in X (0 - 15).
   Gives ``NONEXISTENT`` if given buffer does not exist (or given
   number is out of range).

.. note::

   I/O area is packed as a result of this which means that any other
   buffer that has been marked for removal are also deleted.
