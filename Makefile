######################################
# Makefile
# Author:  Chad Coates (crcoates@pdx.edu)
######################################

CC=iverilog
CFLAGS=-g2012 
BIN=stimulus
SRC=compare.sv fulladd4.sv fulladd.sv mux2to1_nbits.sv bcd_adder.sv stimulus.sv 

$(BIN): $(SRC) 
	$(CC) $(CFLAGS) -o $(BIN) $(SRC)

run:
	./$(BIN)

clean:
	rm $(BIN)
