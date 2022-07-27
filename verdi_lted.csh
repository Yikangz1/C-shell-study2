#!/bin/csh -f 

set script_location3=`dirname $0` # `dirname $0` represents obtaining the directory of the script
echo "the script location3 is : `cd $script_location3 && pwd`" # first change the current directory; second, pwd printed the current directory. So we can see that the current directory (absolute path) printed.


set CURDIR=`dirname $0`
set PRJDIR = `cd $CURDIR/../.. && pwd`

setenv PRJ_ROOT ${PRJDIR}

set filelist_path = ${script_location3}/../../flist  #catx_lted.vlst
set testbench_path = ${script_location3}/../tests/lted
#verdi -f ${filelist_path}/catx_lted.vlst &

bsub -Is -q DIPD_Cross_Department -n 1 -R "span[hosts=1] rusage[mem]=100" /rh/cad/bin/qsy.2010 verdi@2019.06sp2 -sv +v2k -f ${filelist_path}/catx_lted.vlst &
#${testbench_path}/lted_testbench_script_total.v &
