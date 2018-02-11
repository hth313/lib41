.. index:: MKXYZ

.. object:: MKXYZ

   This is an all MCODE version of the ``MK`` program in the PPC
   ROM. It assigns an arbitrary 2 byte function to any key and will
   not corrupt any I/O buffers.

.. code-block:: ca65

   Z:  first byte
   Y:  second byte
   X:  key-code
