#!/bin/bash
"""
This code is borrowed from the link below.
Reference: https://gist.github.com/SSARCandy/46da40fb53d7d49b10a4c38e6f96ae23

"""
function show_gpu_user {
        pid=$(pstree -sg $1 | grep -Eo 'bash\([0-9]*\)' | head -1 | grep -Eo '[0-9]*');
        docker ps -q | xargs docker inspect --format "{{.Name}}  {{.State.Pid}}" | grep $pid | awk '{printf "%-24s", $1}';
        ps aux | grep $1 | grep -v grep | awk '{ for(i=1;i<=NF;i++) {if ( i >= 11 ) printf $i" "}; printf "\n" }';
}


echo " ";

gpu_status=$(nvidia-smi --query-compute-apps=gpu_serial,pid --format=csv,noheader);
busy_gpu=$(nvidia-smi --query-compute-apps=gpu_serial,pid --format=csv,noheader | awk "{print $1}" |sort -u | wc -l);
echo "Total GPUs: 8";
echo "Tasks on GPU: $busy_gpu";
echo " ";

if [[ $(docker ps -q) ]]; then
        echo -e "GPU_serial\tPorcess_id\tContainer_name\t\tProcess_name";
        echo "======================================================================================";

        while read -r line; do
                process=$(echo $line | awk '{print $2}');
                echo -en "$line\t\t" | sed 's/,\s/\t/';
                show_gpu_user $process;
        done <<< "$gpu_status"
else
        echo "No process found."
fi

echo " ";
