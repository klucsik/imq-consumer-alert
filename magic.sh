# extract table:  
#       cat input-table-one-with51-gw-rw-69 | awk '/RUNNING/'

#  extract table and print only the two interesting columns: 
#       cat input-table-one-with51-gw-rw-69 | awk '/RUNNING/ {print $1, $6}'

# print out only if consumers are over 50
#       cat input-table-one-with51-gw-rw-69 | awk '/RUNNING/ && $6>50 {print $1, $6} '

# print out only if consumers are over 50 and its not the GW_RQ
#       cat input-table-one-with51-gw-rw-69 | awk '/RUNNING/ && $6>50 && !/GW_RQ/ {print $1, $6} '

# print out only if consumers are over 70 and it is the GW_RQ
#      cat input-table-gw-rw-over70 | awk '/RUNNING/ && $6>70 && /GW_RQ/ {print $1, $6} '

#use if and else if to combine the two
#Added two if else with checks of too less consumer on particular topics

cat input-table-one-with51-gw-rw-69 | awk '{if(/RUNNING/ && !/GW_RQ/ && $6>50) print $1, $6; else if(/RUNNING/ && /GW_RQ/ && $6>70) print $1, $6;else if(/RUNNING/ && /cif/ && $6<1) print $1, $6;else if(/RUNNING/ && /NB/ && $6<1) print $1, $6;} '
