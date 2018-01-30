# Init File for setting up the gdb when started from within the CLion GDB- Server configuration
# FIXME This file has to be copied to the %HOMEPATH% as .gdbinit, CLiond gdbserver does not load the .gdbinit in the project root
# Since the CLion gdbserver setup issues the target remote command during startup we have to use gdb hooks to force a
# download of the binary after the remote connection is established

set verbose on
echo Init- File Loaded!!\n

# hookpost-remote gets called after the target remote command has successful finished.
# we force a download of the binary, do a reset and halt on the target and set an initial breakpoint in main
define target hookpost-remote
echo Hook post- remote called!!\n
load
monitor reset
monitor halt
b main
end
