# Simple bash script to compile things using G++ and run it through valgrind
# 
# Written by Thomas Helms 2/1/2016
#
# Usage:
# ./test.sh <File1.cpp> <File2.cpp> <File3.cpp> <File4.cpp> <File5.cpp>
#!/bin/sh
FILE1=$1
FILE2=$2
FILE3=$3
FILE4=$4
FILE5=$5

rm a.out
g++ $1 $2 $3 $4 $5 -pedantic -g -O0
if [ $? -eq 0 ]; then

echo Running Valgrind Simple...
valgrind ./a.out

	if [ $? -ne 0 ]; then
  clear
	echo Valgrind returned a problem! Running verbose with leak checks
  sleep 1
	valgrind -v --leak-check=full ./a.out
	fi

else
  echo ERROR Compiling
fi