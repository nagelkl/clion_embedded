# Init File for setting up the gdb when started from within the CLion GDB- Server configuration
# In the gdbserver configuration of CLion the default gdb has to be selected, then the gdb is started in the root of
# the project and loads this file
# Since the CLion gdbserver setup issues the target remote command during startup we have to use gdb hooks to force a
# download of the binary after the remote connection is established
echo Init- File Loaded!!

# hookpost-remote gets called after the target remote command has successful finished.
define target hookpost-remote
set verbose on
file cmake-build-debug/clion_embedded.elf
load
monitor reset
b main
end

