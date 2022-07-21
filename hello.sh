#!/bin/csh -f       
# In Cshell script, the 1st line should start with "#!", except the 1st line"#!", other "#" are notes in the script (Note: can not put the notes in first line)
echo "hello world"
echo $HOME # display the root directory
echo "***********************$0 study***********" # double quotation marks would consider $0 as variable, so output the script name
echo '***********************$0 study***********' # single quotation marks would consider the contens as string
echo $0 # "S0" represents this script name
echo "name of this script: $0" # "S0" represents this script name
echo "1st input parameter: $1"   # "$1" represents the 1st input parameter 
echo "2nd input parameter: $2"   # "$2" represents the 1st input parameter 

echo '***************the next line output the num of input parameters in this script*****'
echo "num of param: $#" # "$#" represents the input parameter number

echo '***************$* study**********'
echo " param: $*" # $* output all of the input parameters in this script
echo $*>param  # print the input parameters into file "param"
echo '**************************zero pp************************************'

echo $argv[1]
echo "1st input param: $argv[1]"
#as=expr 2 + 2
echo "as"
set path1='/ux/INNOBASE_IM4101_DIPDCROSS/home/cns1063/shell_study'
set project1='gvim $path1/hello.sh'

echo '**************************zero************************************'
pwd
echo "the original script location is: `pwd`"
set CURDIR=`dirname $0` #`` represents the inner content is a shell command, where `dirname $0` command is to obatain the directory of the script
set PRJDIR = `cd $CURDIR/../.. && pwd` # change the current directory to " $CURDIR/../.." and then print the current directory (so far, not change the directory)
#set PRJDIR =  $CURDIR/../..
echo "curdir: $CURDIR; prjdir: $PRJDIR"
echo "analysis directory:`pwd`"
cd $PRJDIR # change the directory
#note for the above line code: although the varibale $PRJDIR is a action from its defination (actually, is not a directory), but the above line code can treat varibale $PRJDIR as a path, so that directory changed here.
echo "analysis directory2:`pwd`"
set CURDIR=`dirname aa2` #??????????????????????
echo "curdir: $CURDIR; prjdir: $PRJDIR"

echo '**************************1st************************************'
set ab=1
echo $ab

set abc="set use set"
echo $abc

set abcd='echo "hello wrold"; pwd'
$abcd

#set abcd2=`echo "hello wrold"; pwd`
#$abcd2


set aa=1+2
echo $aa
echo '**********************2nd****************************************'

echo '**********************3rd****************************************'

#set aab`
#expr 99991 + 2 > aab#????????????????
#echo $aa1

echo '**************************************************************'
set aa2
@ aa2 = 5 + 5
#aa2=expr 91 + 2 #????????????????
echo $aa2

set v2
@ v2 = $aa2 + 3 # in C_shell, use @ to conduct mathematical calculation
echo $v2
#set a=1
#set c
#@ c=$(1+2)
#echo $c

if ( $#argv == 2) then		 # if the num of the input param is 2, print the num of input parameter					
	echo "num of input param is 2"
  echo $#
else if ($#argv == 0) then
	echo "num of input param is 0"			
  exit 1
endif

echo $?# check the exit value is 0 or 1, if the script exit before this line code, would not print this result
echo "********************************usage***********************************************"
if ($#argv == 2) then
  set usage
endif				

if ($?usage) then
	cat << EOU
Usage:
 run_com <test_name> [options] [ohter plus argus]
 run_com launches a vsc simulation executable on the 
 test specified by the argument <test name>

 Options:
 -help:
 letx:
 fpga:
 run:

 The result output is placed in the following directory:
EOU
endif

cat << EOU
progress end
EOU

echo '***********************date usage study (begin)******************************'
echo `date`
echo "the real time is: `date`"
echo `date '--date=1 seconds ago' +%Y-%m-%d-%H-%T`
echo `date '--date=1 hour seconds ago' +%Y-%m-%d-%H-%T`
#echo $(date '--date=1 hour ago' +%Y-%m-%d-%H)
echo '***********************date usage study (end)******************************'


echo '*******************dirname command and pwd study***********************'
set script_location=`dirname $0` # `dirname $0` represents obtaining the directory of the script
echo "the script location1 is : $script_location" # if run `dirname $0`, the output is "."
echo "the script location2 is : `cd $script_location`" # by running this line code, you can find there is no contents printed, as only changed the directory but not printed the current directory
echo "the script location3 is : `cd $script_location && pwd`" # first change the current directory; second, pwd printed the current directory. So we can see that the current directory (absolute path) printed. 
pwd  # pwd prints the current directory of the current working path 
echo "the current directory is: `pwd`"

echo '*******************change directory study***********************'
set folder_location=`cd $script_location/.. && pwd`
echo $folder_location
echo "the current folder location is: $folder_location"

setenv script_location2  ${script_location}/cns1063/shell_study
#set script_location2=${script_location}/cns1063/shell_study  #this line code and the above the line code both can effectively change the current directory
echo "the current working directory is: `cd $script_location2 && pwd`" # the working directory changed
echo '*********************script_location2********************'
echo $script_location2 
set cns_1063 = ${script_location2}/.. # NOte!!!: here , variable cns_1063 is not a directory, only conduct operation on this variable cns_1063, cns_1063 would be considered as a directory,
echo '*************************cns*******************'
echo $cns_1063 # by printed $cns_1063, you can find $cns_1063 is "./cns1063/shell_study/.." instead of 
cd $cns_1063/shell_study_folder 
echo "the current directory(creat folder): `pwd`"

mkdir -p folder1/folder2 # here, -p represents create the folders recursively.
cd .. # back to the upper layer fo the folder
echo "back to the upper folder for one layer: `pwd`"
cd ./shell_study
echo "back to the inner folder for one layer: `pwd`"
#cp -rf hello.sh  $cns_1063/shell_study_folder/folder1/folder2

echo '*******************copy study***********************'
#cp -rf $shell_study_folder/shell_study_folder/../shell_study/hello.sh $shell_study_folder/shell_study_folder/folder1/folder2
echo $folder_location
cp -rf hello.sh $folder_location/home/cns1063/shell_study_folder/folder1/folder2
 
#cd /ux/INNOBASE_IM4101_DIPDCROSS/home/cns1063/shell_study/..
echo "back to the upper folder for one layer: `pwd`"
echo `ls  $folder_location/home/cns1063/shell_study_folder/folder1`



echo "******************************data array usage***********************"
set tests = ("a" b 3)
#foreach var (test); then
echo $tests
echo ${tests[1]}

#end

# foreach study
echo "******************************foreach usage (begin)***********************"
`pwd`
echo "`pwd`"
echo "the current directory is: `pwd`" # compare this line and the above two line codes, we can find that if `pwd` command not put into double quatation marks after echo, it would print "permission denied", so suggest that: If you                                       #wanna use `pwd` command in c-shell script, pls put `pwd` into double quatation marks after echo. (instead only write `pwd` without double quatation marks and echo)   

foreach pp1 ($tests)
 echo $pp1
end

set test2 = (a b c d)
set xx1 = ()
foreach i ($test2)
 echo $i
 echo "current directory is `pwd`" # ??? why after the directory printed, it is shown that "permission denied"? the answer is: `pwd` not put into double quatation marks after echo
# `lappend xx1 $i`
# echo $xx1
end

set test3 = (e f g h )
set j1 = 0
foreach j ($test3)
 echo "the $j1 element in test3 is $j"
 @ j1 = $j1 + 1
end
echo "******************************foreach usage (end)*******************************************"




echo "******************************if-else usage (begin)*****************************************"

set index1 = 2
if ($index1 == 1) then
			echo "variable index1 is 1"
else 
		  echo "variable index1 is not 1"
endif

if ($?index1) then
		  echo "the variable index1 has been defined"
else 
			echo "the varibale index1 has not been defined"
endif

echo "*****************************if-else usage (end)*******************************************"




echo "***********************set and shell-command joint usage (begin)************************************"
set bb2 = "the current directory2: `pwd` "
echo $bb2

set bb3 = 'the current directory3: `pwd` '
echo $bb3

set bb4 = "hello world2;`pwd`;`echo $home`;`echo "girl"`" # besides printing "hello world2", there are three C-shell commands to be executed.
echo $bb4
echo "***********************set and shell-command joint usage (end)************************************"

set cc1 = `pwd`
echo $cc1

echo "**********************script learning***********************************"
set ini_name = lted_sub.ini
set lte_x = `echo $ini_name | awk -F '_' '{print $1}'`
echo $lte_x

set ini_name2 = (lte d)
set lte_x2 = `echo $ini_name2 | awk '{print $2}'`
echo $lte_x2

echo "**********************absolute and relative path learning (begin)***********************************"

setenv script_location3  ${script_location}/cns1063/shell_study/$argv[3] # script_location3 is a 
echo $script_location3
#`cat $script_location3`


setenv report_file2  ${script_location}/cns1063/shell_study/aa.txt
echo "the directory:$report_file2"

set report_file2_location=`cd $script_location && pwd`  # absolute path
echo "report_file2_location: $report_file2_location"

setenv report_file $report_file2_location/report.txt


echo "Catx simulation: $argv[3]" > $report_file
echo "" >> $report_file
echo "Start run time:" >> $report_file
date >> $report_file
echo "**********************absolute and relative path learning (end)***********************************"


echo "**********************pattern match learning (begin)***********************************"
set ini_name = ltec_sub.ini# lte_d.ini 
if ( "$ini_name" =~ "lte?_*.ini") then
  echo "match"
else 
	echo "not match"
endif

echo "**********************pattern match learning (end)***********************************"

set section = Module
set key = module

#set key_module = `awk -F '=' '/\['$section'\]/{a=1} a==1&&$1~/'$key'/ {print $2;exit}' $ini_name` 
#alias get_key 'awk -F '\''='\'' '\''/['\''$section'\'']/{a=1} a==1&&$1~/'\''$key'\''/ {print $2;exit}'\'' $ini_name'
# get_key is get vaule of $1-section : $2-param 
alias get_key 'awk -F '\''='\''  '\''/\['\''\!:1'\''\]/{a=1} a==1&&$1~/'\''\!:2'\''/ {print $2;exit}'\'' $ini_name'
# get_simop is get simulation options, use :=
alias get_simop 'awk -F '\'':='\''  '\''/\['\''\!:1'\''\]/{a=1} a==1&&$1~/'\''\!:2'\''/ {print $2;exit}'\'' $ini_name'

alias get_key_sub 'awk -F '\''[+=]'\''  '\''/\['\''\!:1'\''\]/{a=1} a==1&&$3~/'\''\!:2'\''/ {print $4;exit}'\'' $ini_name'
alias get_key_test 'awk -F '\''[+=]'\''  '\''/\['\''\!:1'\''\]/{a=1} a==1&&$5~/'\''\!:2'\''/ {print $6;exit}'\'' $ini_name'

# get ltex module
set  key_module = `get_key $section $key`
echo "module is: $key_module" # 


# get fpga param, NULL:use asic ram, FPGA:use fpga ram
   set key_fpga = `get_key Module fpga`
   echo "fpga is :$key_fpga"

   # get run_all flag
   set key_runall = `get_key Module run_all`
   echo "runall is :$key_runall"

   # get test-case count
   set case_num = `get_key Module case_cnt`
   echo "the case_num is $case_num"

  set j = 1
	set key_run = ""

	 set sub_test = `get_key_sub Case$j sub_case`# get_key case1/case2 sub_case
	#	echo "sub_case is $sub_case"
		set test_case = `get_key_test Case$j test_case`
		echo "sub_test is $sub_test ($j)" # output: CW (1)
		echo "test_case is $test_case ($j)"

		echo "test_case is $test_case"
    set key_simop = `get_simop Case$j sim_op`
		echo "key_simop: $key_simop"
		echo "./run.csh $key_module $key_fpga $key_run $key_simop"
		
echo "**********************while learning (begin)***********************************"
set j = 1
set case_num = 6
while( $j <= $case_num)
	echo "biubiubiu"
#	@j =$j +1
	@ j += 1
	echo "j : $j"
end
echo "**********************while learning (end)***********************************"


echo "Finish run time:" >> $report_file
date >> $report_file
echo "" >> $report_file

echo "Catx: Check $argv[1] simulation result."
echo "Catx: Check $argv[1] simulation result." >> $report_file

echo "**********************diff learning (begin)***********************************"
diff  a.txt b.txt > compare.txt 


echo "**************************argv study ***************************************"
echo "1st input param: $argv[1]" # $argv[1] represent the first input element
echo "the total input parameters: $#argv" # $#argv is the total number of input element
echo "$argv[1-$#argv]"  # "$argv[1-$#argv]" represent from the 1st to the last input element
echo "$argv[1-3]"  # $argv[1-3] is the 1st/2nd/3rd input element
echo "$argv[1-2]"  # $argv[1-2] is the 1st/2nd input element
echo "$argv[2-3]"  # $argv[2-3] is the 2nd/3rd input element

echo "**************************regularization comparison study (begin)***************************************"
set ini_name2 = ltec_module2.ini
if ("$ini_name2" =~ "lte?_*.ini") then
				echo "regularization comparison success:ltec_module2.ini matched lte?_*.ini"
else
				echo "regularization comparison failed"
endif				


set ltex_module = "lte"
set run_arg = "ltec"
echo $run_arg 

if ( "$run_arg" =~ "${ltex_module}?") then
	      set ltex = `echo $run_arg | sed "s;-;;"`
				echo "ltex: $ltex (run_arg:$run_arg)"
else 
				echo "not match"
endif
echo "**************************regularization comparison study (end)***************************************"

echo "**************************script invoke inner script study ***************************************"
echo "`pwd`"
set script_location3=`dirname $0` # `dirname $0` represents obtaining the directory of the script
echo "the script location3 is : `cd $script_location3 && pwd`" # first change the current directory; second, pwd printed the current directory. So we can see that the current directory (absolute path) printed. 

set inner_script = $script_location3/invoked_script.sh
$inner_script   # according to this line and the above line code, we can find that within this hello.sh script, we can further invoke another script by: 1.let a variable equals to a executable fille; run this varibale (just write this variable's name)

echo "**************************'in C-shell: '|' and '&&' and '||'  '***************************************"
echo "**************************'in C-shell: '|' is the pipeline command '***************************************"
echo "hello" | cat > hello.txt

echo "**************************'in C-shell: '&& ' ***************************************"
set var3 = 1
test -s $script_location3/test2.dat || echo "Simulation PASS." # " in C-shell, "test -s filename" is used to: if the file is not empty, return boolean 1; if the file empty, return boolean 0. So, here, if test2.dat empty(results match the expect results), return 0. (command1 "||" command2) here, when command1 =0, execute command2, so at this time echo "Simulation PASS." 
test -s $script_location3/test2.dat || echo "the test2.dat empty, which means the results match (diff file empty), so simulation pass "

test -s $script_location3/test2.dat && echo "Simulation not PASS."  #in C-shell, (command1 "&&" command2):when command1 = 1, execute command2. Here, if test2.dat not empty, "test -s $script_location3/test2.dat "=1, then  echo "Simulation not PASS."
test -s $script_location3/test2.dat && echo "test2.dat not empty, which means the results not match, so simulation not pass."  
