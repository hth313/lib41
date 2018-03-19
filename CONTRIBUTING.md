Contributing to lib41
=====================

These are a set of guidelines for contributing to this project.


Structure
---------

The `src` directory uses a number of category directories with the
idea of keeping the `src` root reasonable free of source files.


Spaces, TABs and newlines
-------------------------

- Use spaces for indentation, not TAB
- End all lines, including the last one with a newline
- Avoid multiple newlines at end of a file
- Follow the indentation used in the existing code

If you use Emacs, `gas-mode` and `ethan-wspace-mode` are helpful
packages that makes it easier to following the above guidelines.


RPN source files
----------------

RPN source files are welcome!


Non-source files
----------------

Try to avoid files that do not have proper source code, like `.raw`
files and hex dumps. It is desirable to have proper source files to
make it easy to maintain and make changes.


Git commit messages
-------------------

- Separate subject from bode with a blank line
- Make the subject line 50 characters or less
- Capitalize the subject line
- Do not end subject line with a period
- Use the present tense ("Add feature" not "Added feature")
- Wrap lines at 72 characters in body
- Use the body to explain what and why, rather than how


License matters
---------------

I would like to keep a permissive license on this code base so the 3-clause
BSD license is used. Individual authors are added to it roughly in the order
of companies, large contributors and the rest. Then ordered alphabetically in
each sub-group. Roughly.
