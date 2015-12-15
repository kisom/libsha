AM_CFLAGS :=	-Wextra -pedantic -Wshadow -Wpointer-arith -Wcast-align
AM_CFLAGS +=	-Wwrite-strings -Wmissing-prototypes -Wmissing-declarations
AM_CFLAGS +=	-Wredundant-decls -Wnested-externs -Winline -Wno-long-long
AM_CFLAGS +=	-Wconversion -Wstrict-prototypes -Wall -Werror -std=c99
AM_CFLAGS +=	-D_XOPEN_SOURCE -Os

headersdir =		$(includedir)/sha
headers_HEADERS =	sha/sha.h sha/sha-private.h
lib_LTLIBRARIES =	libsha.la
libsha_la_SOURCES =	hkdf.c hmac.c sha1.c sha224-256.c sha384-512.c usha.c

check_PROGRAMS =	shatest

shatest_SOURCES =	shatest.c
shatest_LDADD =		libsha.la
