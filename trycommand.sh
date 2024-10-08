#!/busybox/sh
# Trycommand
# By Tedezed
# Source: https://raw.githubusercontent.com/Tedezed/devops-command-tools/master/trycommand/trycommand

usage ()
{
cat <<EOF
Usage trycommand -s 2 -t 5 -c "echo 'Hello1'; echo 'Hello2'"
    -s : Sleep time
    -t : Try number
    -c : Command to execute
EOF
exit 2
}

while getopts ":s:t:c:h" OPTIONS; do
    case "${OPTIONS}" in
        s) SLEEP_TIME=${OPTARG} ;;
        t) TRY_NUMBER=${OPTARG} ;;
        c) COMMAND=${OPTARG} ;;
        h) usage ;;
        *) usage ;;
    esac
done

n=0
until [ "$n" -ge $TRY_NUMBER ]
do
    eval $COMMAND && break
    n=$((n+1)) 
    sleep $SLEEP_TIME
done

