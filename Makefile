# Nome do executável
TARGET = iolib

# Fontes Assembly
SRCS = main.asm iolib.asm

# Objetos derivados automaticamente
OBJS = $(SRCS:.asm=.o)

# Ferramentas
ASM = nasm
ASMFLAGS = -f elf64

LD = ld
LDFLAGS =

# Regra padrão
all: $(TARGET)

# Linkedição
$(TARGET): $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $(OBJS)

# Montagem (pattern rule)
%.o: %.asm
	$(ASM) $(ASMFLAGS) -o $@ $<

# Limpeza
clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: all clean

