***********
Using Lib41
***********

Getting Lib41 into your project can be done in a number of ways.

Perhaps the simplest way is just to copy the ``lib41.a`` library into
your project.

If you want to work closer with Lib41 and are using Git, you can
import it as a Git submodule to your own project. Refer to the `Pro Git book
<https://github.com/blog/2104-working-with-submodules>`_ and `Working
with submodules on GitHub
<https://git-scm.com/book/en/v2/Git-Tools-Submodules>`_.

Either way, you need to link with ``lib41.a``, so you linker line
may look something like:

.. code-block:: sh

  lnnut $(OBJS) lib41.a linker.scm mymod.moddesc


Bring it in
===========

To actually make use of something in Lib41 you need to refer to it. If
it is an MCODE instruction, there will be a public label after the
``.name`` directive with the same name as the instruction. So if
you want to include the ``RTN?`` instruction in your module:

.. code-block:: ca65

   ;;; In your FAT section
              .extern `RTN?`

              .con    XROMno        ; XROM number
              .con    .fatsize FatEnd ; number of entry points
              ...
              .fat    `RTN?`


As can be seen, all that is needed is an ``.extern`` directive to
make the symbol known and and entry in the function address table.
