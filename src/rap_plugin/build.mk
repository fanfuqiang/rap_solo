
SRCS = $(wildcard *.c)
OBJS = $(SRCS:.c=.o)

LDFLAGS = -shared
CFLAGS = -O2 -std=gnu++98 -ggdb -fvisibility=hidden -fno-rtti -fno-exceptions -fPIC -c
HEADER = -I/usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include -I../../gcc-plugins
RAP = rap_plugin.so # target lib

$(RAP): $(OBJS)
	$(CXX) $(LDFLAGS) -o $@ $^

$(OBJS): %.o : %.c
	$(CXX) $(HEADER) $(CFLAGS) -o $@ $<

.PHONY: clean
clean:
	rm -f $(OBJS) $(RAP)
