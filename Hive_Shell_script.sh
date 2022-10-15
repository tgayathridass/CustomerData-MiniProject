#!/bin/bash


for file in /user/Hive_scripts/*.sql; 
do 
hive -f $f
result=`echo $?`
   if [ $result -ne 0 ]; then
             echo "we have encountered an hive Error while executing $f"
             echo "Hive error number is: $result"
     exit 1
   else
             echo "no error, $f executed successfully. Hive tables are created"
fi
done
