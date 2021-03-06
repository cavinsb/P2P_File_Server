CC = gcc
CFLAGS = -c -g -Wall -Wextra
LFLAGS = -g -Wall -Wextra -pthread

all: client_PFS server_PFS

client_PFS: client_PFS.o protocol.o list.o
	$(CC) $(LFLAGS) $^ -o $@

server_PFS: server_PFS.o protocol.o list.o
	$(CC) $(LFLAGS) $^ -o $@

client_PFS.o: client_PFS.c
	$(CC) $(CFLAGS) $<

server_PFS.o: server_PFS.c
	$(CC) $(CFLAGS) $<

list.o: list.c list.h
	$(CC) $(CFLAGS) $<

protocol.o: protocol.c protocol.h
	$(CC) $(CFLAGS) $<

clean:
	rm -f client_PFS
	rm -f server_PFS
	rm -f *.o
	rm -f *~