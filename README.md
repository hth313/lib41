=================
Library for HP-41
=================

This is a library of routines for the HP-41 calculator intended to
be easy to use with your own HP-41 module.

The project produces a (static) library (`lib41.a`) which you can link
with your project by adding it to the linker command line.

           lnnut $(OBJS) linker.scm mymodule.moddesc lib41.a


To use a routine, simply declare the desired routine with `.extern` and
it is ready to use in your source file.

To make it even simpler, the `lib41.h` header file provides all the
`.extern` declarations and some macros. (The FAT macro combines the
`.fat` directive with a special label, to make it work with RPN
programs in the same module.)

For a named routine, all you need to do is to add add it to your
function address table:

    #include "lib41.h"
            ...
            FAT ASHFX

That is it! You now have imported the `ASHFX` function to your
module and it is ready to be used by any local RPN program!

In addition there are some support subroutines (not named routines for
the FAT), they can be called using `gsbp` or `golp` (page relocatable
calls):

    #include "lib41.h"
            ...
            gsbp    errorMessage  ; key code error
            .messl  "KEYCODE ERR"
            golp    errorExit
