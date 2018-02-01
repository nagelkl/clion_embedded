:: script to start a JLink gdbserver for the STM32L476RG controler mounted on the
:: nucleao board
JLinkGDBServerCL -select USB -device STM32L476RG -if SWD -speed 1000 -ir
