CC = gcc
CFLAGS = -lobjc -std=c99 -I /usr/lib/GNUStep/System/Library/Headers \
-L /usr/lib/GNUStep/System/Library/Libraries -lgnustep-base \
-fconstant-string-class=NSConstantString

OBJECTS = main.o cell.o nitrobase.o mutate.o shuffle.o

main.exe : $(OBJECTS)
		$(CC) $(CFLAGS) $(OBJECTS) -o main.exe

main.o: main.m 
		$(CC) $(CFLAGS) -lbsd -c $< -o $@ -lbsd

%.o : %.m %.h
		$(CC) $(CFLAGS) -c $< -o $@

run: main.exe
		TZ='W-SU' ./main.exe

clean:
		rm -f *.o main.exe
