#!/bin/bash

hivetablecmd1='/user/Hive_cmd_complx_query.sql'
hiveQuerycmd2='/user/Hive_cmd_optmzed_table.sql'


hive -f $hivecmd1

result=`echo $?`

if [ $result -ne 0 ]; then

echo "we have encountered an hive Error while executing $hivecmd1"

echo "Hive error number is: $result"

exit 1

else

echo "no error, $hivecmd1 executed successfully. Hive tables are created"

fi