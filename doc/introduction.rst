************
Introduction
************

Welcome to Lib41 for the HP-41 calculator! Lib41 is a collection of
routines that can be easily imported to your own module.


Library
=======

This is a library and not a module. It builds into an archive library
that you can link with your own module. This allows you to pick the
routines you actually need for your module without having to drag in
things you do not want.


Background
==========

Creating your own module for the HP-41 has never been easier. Given
that you have a an RPN application or collection that you want to
publish in module form, your code may be written to make use of useful
routines found in other modules. This can become a problem as your new
module may have dependencies to perhaps two or three other
modules. Now your users need not only to install your module, but
several others as well. Your users  may not have space in their module
emulators or the addressing space to keep them all in memory. Worse,
they may conflict with other modules used by the user, or be intrusive
to his or her work flow.

As a result, your module becomes hard to use for others. Would it not
be nice to collect those few cool routines you actually want to use,
which are spread over those two or three modules into your own module?
Resulting in a self contained application module with few external
module dependencies. This is one of the use-cases Lib41 aims to help
solving over time.

It can also be that you have some good routines of your own, but it is
not enough to warrant a complete module. Finding material to include
in your module can result in a lot of work. By using Lib41 you can
hopefully find good routines to complement your own routines and
provide a richer and more complete result. On the other hand, it
is probably not a good idea to wildly include things just for the sake
of it. Include things that makes sense to you and that may be a good
fit for what you are doing.

By rolling your own module, you can optimize it to your own
use-case. Maybe others will like it too, so do not be afraid to share
it.

By providing Lib41, it is hoped that a decent amount of useful source
code can be collected in one place. This makes it easier to keep track
of it, study it and make good use of it.


Contributions
=============

Contributions to this library are welcome, refer to the information
provided on its project page at GitHub.


License
=======

The code is provided under the BSD three clause license. The original
developers retain their copyrights.

The ``LICENSE`` file lists the contributors as they are known.

As some of this code has been floating around for years, it is not
always easy to assess the original author. If you find or think there
is any faults in the copyright holders, or you do not want your code
shared this way, please get in touch with hth313@gmail.com or open a
new issue.
