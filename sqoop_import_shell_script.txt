#This is to demonstrate sample shell script using sqoop command
lines=`cat db.properties`

#Function to read db.properties and set values to connect to database
function setProperties() {
  while read LINE
  do
    KEY=`echo $LINE|cut -d= -f1`
    VALUE=`echo $LINE|cut -d= -f2`
    if [ "$KEY" == "DBSERVER" ]; then
      DBSERVER=${VALUE}
    elif [ "$KEY" == "DBNAME" ]; then
      DBNAME=${VALUE}
    elif [ "$KEY" == "DBUSER" ]; then
      DBUSER=${VALUE}
    elif [ "$KEY" == "DBPASSWORD" ]; then
      DBPASSWORD=${VALUE}
    fi
  done <<< "echo -e $lines"
}

#Function to iterate and import each of table listed in the file into HDFS
function importTablesToHDFS() {
  cat listoftables|while read LINE
  do
    DBTABLE=${LINE}
    COUNT=`sqoop import \
      --connect "jdbc:mysql://${DBSERVER}/${DBNAME}" \
      --username ${DBUSER} \
      --password ${DBPASSWORD} \
      --table ${DBTABLE} \
      --warehouse-dir /user/hdfsDir/ \
  done
}

setProperties
importTablesToHDFS