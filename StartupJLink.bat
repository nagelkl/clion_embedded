:: FIXME Copy the .gdbinit- File to the Home- Folder
:: This is necessary because the CLion gdbserver configuration does not load the .gdbinit from the project root
copy Home.gdbinit %HOMEPATH%\.gdbinit

:: script to start a JLink gdbserver for the STM32L476RG controler mounted on the
:: nucleao board
JLinkGDBServerCL -select USB -device STM32L476RG -if SWD -speed 1000 -ir
