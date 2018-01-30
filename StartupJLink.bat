:: script to start a JLink gdbserver for the STM32L476RG controler mounted on the
:: nucleao board
:: TODO get rid of the absolute path to the install location of the segger tools
"C:\Program Files (x86)\SEGGER\JLink_V612d\JLinkGDBServerCL.exe" -select USB -device STM32L476RG -if SWD -speed 1000 -ir
