if {[catch {

# define run engine funtion
source [file join {C:/lscc/radiant/3.0} scripts tcl flow run_engine.tcl]
# define global variables
global para
set para(gui_mode) 1
set para(prj_dir) "D:/Users/nicob/Desktop/TP2_E3-G2/AlarmModule"
# synthesize IPs
# synthesize VMs
# synthesize top design
file delete -force -- AlarmModule_Alarm.vm AlarmModule_Alarm.ldc
run_engine_newmsg synthesis -f "AlarmModule_Alarm_lattice.synproj"
run_postsyn [list -a iCE40UP -p iCE40UP5K -t SG48 -sp High-Performance_1.2V -oc Industrial -top -w -o AlarmModule_Alarm_syn.udb AlarmModule_Alarm.vm] "D:/Users/nicob/Desktop/TP2_E3-G2/AlarmModule/Alarm/AlarmModule_Alarm.ldc"

} out]} {
   runtime_log $out
   exit 1
}
