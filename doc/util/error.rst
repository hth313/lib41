.. index:: error handling

Error handling
^^^^^^^^^^^^^^

Commonly known routines from the Extended Functions to form error
messages. These are also available in the HP-41CX mainframe, which you
can use if you know you code will only run on an HP-41CX. Using the
routines provided here will work with all HP-41 models.

To display a custom error message:

.. code-block:: ca65

   ;;; Display a custom error "NO HP-IL"
               .extern errorMessage, errorExit
               gsbp    errorMessage
               .messl  "NO HP-IL"
               golp    errorExit


You can also use the variant that appends ``ERR`` to your message:

.. code-block:: ca65

   ;;; Display a custom error with " ERR" appended
               .extern errorMessage, displayERR
               gsbp    errorMessage
               .messl  "CHKSUM"                   ; CHECKSUM ERR
               golp    displayERR
