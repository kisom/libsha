libsha
======

This is a library of the extracted code from RFC 6234, "US Secure Hash
Algorithms (SHA and SHA-based HMAC and HKDF)". It was motivated by a
need to have a standalone SHA library (e.g. for embedded use) without
bringing in the full weight of a cryptographic library like LibreSSL,
cryptopp, or similar.

As it is useful to have all the code present in one repository, this
is that repository.


Modifications
-------------

I have made a few minor changes to the code, namely where the
(inarguably pedantic) compiler flags threw warnings.


TODO
----

+ Documentation


LICENSE
-------

This is a port of code that was originally provided by D. Eastlake and
T. Hansen in RFC 6234, and released by the IETF. The original license
from the RFC is in LICENSE.
