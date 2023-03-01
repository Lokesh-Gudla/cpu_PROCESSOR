# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param tcl.collectionResultDisplayLimit 0
set_param chipscope.maxJobs 4
set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.cache/wt [current_project]
set_property parent.project_path C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_cache_permissions disable [current_project]
read_verilog -library xil_defaultlib {
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/Mips.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/PS2Receiver.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/adder.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/alu.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/aluControl.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/ascii2char.v
  C:/Users/lokes/Videos/VLSI/F0ZMJ77IJSV3B4A/text_display/text_display.srcs/sources_1/new/ascii_rom.v
  C:/Users/lokes/Videos/VLSI/F0ZMJ77IJSV3B4A/text_display/text_display.srcs/sources_1/new/ascii_test.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/bin2hex.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/control.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/dataMem.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/datapath.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/debouncer.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/instMem.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/keyboard_seq.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/mux.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/pc.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/regFile.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/scan2ascii.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/sequence_detect.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/seven.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/shiftLeft.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/signExtend.v
  C:/Users/lokes/Videos/VLSI/F0ZMJ77IJSV3B4A/text_display/text_display.srcs/sources_1/new/top.v
  C:/Users/lokes/Videos/VLSI/F0ZMJ77IJSV3B4A/text_display/text_display.srcs/sources_1/new/vga_controller.v
  C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/new/topmodule.v
}
read_ip -quiet c:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/ip/ila_1/ila_1.xci
set_property used_in_synthesis false [get_files -all c:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/ip/ila_1/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/ip/ila_1/ila_v6_2/constraints/ila_impl.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/ip/ila_1/ila_v6_2/constraints/ila.xdc]
set_property used_in_implementation false [get_files -all c:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/sources_1/ip/ila_1/ila_1_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/constrs_1/new/myconst.xdc
set_property used_in_implementation false [get_files C:/Users/lokes/OneDrive/Documents/cpu_undertest_with_vga/cpu_udertest_test/cpu_udertest.srcs/constrs_1/new/myconst.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top topmodule -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef topmodule.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file topmodule_utilization_synth.rpt -pb topmodule_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]