ISD_16_21_sles10sp1:~/sc_project_v0.01/aide # cat crontab/set_cron_time.sh
#!/bin/bash

##set crontab time for expect

while [ 1 ]
do
        echo -e "\nPlease input crontab time!\nFormat like: * * * * *\n"

        read time
        echo -e "Are you sure correct? y or n"

        read input
        if [ "$input" == "y" ]
        then
                command="sed -e \"s/^time=/time=\\\"$time\\\"/\"< crontab.sh > crontab_expct.sh"
                echo -e "$command" > sed_script
                chmod +x sed_script
                ./sed_script

                chmod +x crontab_expct.sh

                rm -f sed_script
                break
        fi
done
