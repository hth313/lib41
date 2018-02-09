Library for HP-41
=================

This is a library of routines for the HP-41 calculator intended to
make it easy to include in your own HP-41 module.

The project builds into a library that needs to be used when linking
together with your own module.

To use a routine, simply declare the required routine as `.extern` and
if it is a function, put it in you function address table:

            .extern ASHFX
            ...
            .fat ASHFX

That is it! You now have imported the `ASHFX` instruction to your
module.

To use routines that are not functions, simply import what is needed
with `.extern` and use them appropriately, i.e. `gsbp` (page
relocatable call).
