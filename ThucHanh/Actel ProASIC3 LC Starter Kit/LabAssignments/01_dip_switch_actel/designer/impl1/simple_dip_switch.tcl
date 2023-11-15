# Created by Microsemi Libero Software 11.8.0.26
# Tue Nov 27 14:15:28 2018

# (OPEN DESIGN)

open_design "simple_dip_switch.adb"

# set default back-annotation base-name
set_defvar "BA_NAME" "simple_dip_switch_ba"
set_defvar "IDE_DESIGNERVIEW_NAME" {Impl1}
set_defvar "IDE_DESIGNERVIEW_COUNT" "1"
set_defvar "IDE_DESIGNERVIEW_REV0" {Impl1}
set_defvar "IDE_DESIGNERVIEW_REVNUM0" "1"
set_defvar "IDE_DESIGNERVIEW_ROOTDIR" {W:\OneDrive - Hanoi University of Science and Technology\TaiLieuMonHoc\IT4251_ThietKeIC\ThucHanh\Actel ProASIC3 LC Starter Kit\LabAssignments\01_dip_switch_actel\designer}
set_defvar "IDE_DESIGNERVIEW_LASTREV" "1"

report -type "timing" -format "TEXT" -analysis "max" -print_summary "yes" -use_slack_threshold "no"                             -print_paths "yes" -max_paths 5 -max_expanded_paths 1                             -max_parallel_paths 1 -include_user_sets "no"                             -include_pin_to_pin "yes" -include_clock_domains "yes"                             -select_clock_domains "no" {simple_dip_switch_maxdelay_timing_report.txt}
report -type "timing" -format "TEXT" -analysis "min" -print_summary "yes" -use_slack_threshold "no"                             -print_paths "yes" -max_paths 5 -max_expanded_paths 1                             -max_parallel_paths 1 -include_user_sets "no"                             -include_pin_to_pin "yes" -include_clock_domains "yes"                             -select_clock_domains "no" {simple_dip_switch_mindelay_timing_report.txt}
report -type "timing_violations" -format "TEXT" -analysis "max" -use_slack_threshold "yes" -slack_threshold 0.00                               -limit_max_paths "yes" -max_paths 100 -max_expanded_paths 0                               -max_parallel_paths 1 {simple_dip_switch_maxdelay_timingviolations_report.txt}
report -type "timing_violations" -format "TEXT" -analysis "min" -use_slack_threshold "yes" -slack_threshold 0.00                               -limit_max_paths "yes" -max_paths 100 -max_expanded_paths 0                               -max_parallel_paths 1 {simple_dip_switch_mindelay_timingviolations_report.txt}

save_design
