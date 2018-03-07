Library for HP-41
=================

This is a library of routines for the HP-41 calculator intended to
be easy to use with your own HP-41 module.

The project produces a (static) library (`lib41.a`) which you can link
with your project by adding it to the linker command line.

           lnnut $(OBJS) linker.scm mymodule.moddesc lib41.a


To use a routine, simply declare the desired routine with `.extern` and
it is ready to use in your source file.

If it is a complete function then just add it to your function address
table:

            .extern ASHFX
            ...
            .fat ASHFX

That is it! You now have imported the `ASHFX` function to your
module.

To use a subroutine (that is not a named function), simply declare it
and it is ready to be called using `gsbp` or `golp` (page relocatable
calls):

            .extern errorMessage, errorExit
            ...
            gsbp    errorMessage  ; key code error
            .messl  "KEYCODE ERR"
            golp    errorExit
