***********
Using Lib41
***********

Getting Lib41 into your project can be done in a number of ways.

Perhaps the simplest way is just to copy the ``lib41.a`` library into
your project.

If you want to work closer with Lib41 and are using Git, you can
import it as a Git submodule to your own project. Refer to the `Pro Git book
<https://git-scm.com/book/en/v2/Git-Tools-Submodules>`_ and `Working
with submodules on GitHub
<https://github.com/blog/2104-working-with-submodules>`_.

Either way, you need to link with ``lib41.a``, so you linker line
may look something like:

.. code-block:: sh

  lnnut $(OBJS) lib41.a linker.scm mymod.moddesc


Bring it in
===========

To actually make use of something in Lib41 you need to refer to it. If
it is a names MCODE routine, there will be a public label after the
``.name`` directive with the same name as the routine. So if you want
to include the ``ARCLINT`` routine in your module:

.. code-block:: ca65

   #include "lib41.h"
   ;;; In your FAT section

              .con    XROMno        ; XROM number
              .con    .fatsize FatEnd ; number of entry points
              ...
              .fat    ARCLINT


As can be seen, once ``lib41.h`` has been included all entry points
are known. Simply add the MCODE routines that you want to your FAT
(Function Address Table).

If you also have RPN code in your module that makes use of local MCODE
routines, the ``FAT`` macro can be used. It behaves as the ``.fat``
directive and additionally inserts the special label that makes it
possible to refer to as a local routine from RPN:

.. code-block:: ca65

   #include "lib41.h"
   ;;; In your FAT section

              .con    XROMno        ; XROM number
              .con    .fatsize FatEnd ; number of entry points
              ...
              FAT    ARCLINT
