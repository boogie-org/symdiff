SRC = print_tokens2.c
OBJ = $(SRC:.c=.obj)

all: $(OBJ)

.c.obj: 
	cl  -c -nologo $<
clean:
	del *.obj *.xml
