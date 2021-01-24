# Example .gdbinit file in the project root
# To enable the load of this file on gdb startup you have to place a .gdbinit file with the following content in  your
# %HOMEPATH% :
#       set auto-load local-gdbinit on
#       add-auto-load-safe-path /


# Set a breakpont at main()
define hookpost-load
b main
end

