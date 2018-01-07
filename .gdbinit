echo Init- File Loaded!!

define target hookpost-remote
set verbose on
file cmake-build-debug/clion_embedded.elf
load
monitor reset
b main
end

