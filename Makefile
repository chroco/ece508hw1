######################################
# Makefile
# Author:  Chad Coates (crcoates@pdx.edu)
######################################

CC=iverilog
CFLAGS=-g2012 
BIN=tb_rca_8bits
SRC=tb_rca_8bits.sv fa.sv dut.sv adder_4bits.sv 

$(BIN): $(SRC) 
	$(CC) $(CFLAGS) -o $(BIN) $(SRC)

run:
	./$(BIN)

clean:
	rm $(BIN)
