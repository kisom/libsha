STATIC_TARGET =	libsha.a
SHARED_TARGET =	libsha.so
TARGETS =	$(STATIC_TARGET) $(SHARED_TARGET)
TESTDRIVER =	shatest-static
TESTDRIVER2 =	shatest-shared
TESTS =		$(TESTDRIVER) $(TESTDRIVER2)
OBJS =		hkdf.o sha1.o sha224-256.o sha384-512.o usha.o hmac.o
TESTOBJS =	shatest.o
TESTRUNS =	1000
CFLAGS +=	-Wall -Wextra -pedantic -Wshadow -Wpointer-arith -Wcast-align
CFLAGS +=	-Wwrite-strings -Wmissing-prototypes -Wmissing-declarations
CFLAGS +=	-Wnested-externs -Winline -Wno-long-long  -Wunused-variable
CFLAGS +=	-Wstrict-prototypes -Werror
CFLAGS +=	-std=c99 -D_XOPEN_SOURCE -g -O0
CC =		clang
OS =		$(shell uname -s)

# TEST_LDFLAGS determines whether we can build a static binary.
ifeq ($(OS), "Darwin")
TEST_LDFLAGS =
else
TEST_LDFLAGS =	-static
endif

.PHONY: all
all: $(TARGETS)

.PHONY: info
info:
	@echo "Targets: $(TARGETS)"
	@echo "Object files: $(OBJS)"

%.o: %.c
	$(CC) $(CFLAGS) -c $<

$(STATIC_TARGET): $(OBJS)
	ar -rcs $@ $(OBJS)

$(SHARED_TARGET): $(OBJS)
	$(CC) -shared -o $@ $(LDFLAGS) $(CFLAGS) $(OBJS)

.PHONY: test
test: $(TESTDRIVER) $(TESTDRIVER2)
	./$(TESTDRIVER) -p -R $(TESTRUNS)
	./$(TESTDRIVER2) -p -R $(TESTRUNS)

$(TESTDRIVER): $(STATIC_TARGET) $(TESTOBJS)
	$(CC) $(LDFLAGS) -o $@ $(TESTOBJS) $(STATIC_TARGET)

$(TESTDRIVER2): $(SHARED_TARGET) $(TESTOBJS)
	$(CC) $(LDFLAGS) -o $@ $(TESTOBJS) $(SHARED_TARGET)


.PHONY: clean
clean:
	rm -f $(OBJS) $(TESTOBJS) $(TARGET) $(TESTS)
