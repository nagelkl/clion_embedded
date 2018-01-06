echo Init- File Loaded!!

define target hookpost-remote
set verbose on
file cmake-build-debug/FirstSTM32L4.elf
load
monitor reset
b main
end

