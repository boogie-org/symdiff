SRC = print_tokens.c
OBJ = $(SRC:.c=.obj)

all: $(OBJ)

.c.obj: 
	cl  -c -nologo $<
clean:
	del *.obj *.xml
