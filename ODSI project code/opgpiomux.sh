#!/bin/bash
##################################################################
#
#       opgpiomux.sh
#       GPIO management interface
#
##################################################################

BASEDIR=/opt/odsi/domain/
CODEDIR=/opt/odsi/code/
DOM=$1
OP=$2

LOGDIR=/opt/odsi/logs
LOGFILE=$LOGDIR/gpio`date +%Y-%m-%d`.log

# Auxiliar functions

function printHelp {
    echo " "
    echo "Usage:    opgpiomux.sh DOMAIN COMMAND [PARAMS]"
    echo "      API to manage sensor domains"
    echo ""
    echo "Domains:"
    echo "  led1  Manage led"
    echo "          opgpiomux.sh led1 on"
    echo "          opgpiomux.sh led1 of"
    return
}

function startTrace {
    if [[ ! -d $LOGDIR ]]; then
        sudo mkdir -p $LOGDIR
    fi 
    if [[ ! -f $LOGFILE ]]; then
        sudo touch $LOGFILE
        sudo chmod 666 $LOGFILE
        trace "Starting log file"
    fi    
    return 0
}

function trace {
    echo $@ 
    echo `date '+%Y-%m-%d %H:%M:%S'`: $@ >> $LOGFILE
    return 0
}

#-------------------------------------------------------------------------------------------
# Command functions

function gpio18_led_on {
    #   Exports pin to userspace
    echo "18" > /sys/class/gpio/export
    # Sets pin 12 as an output
    echo "out" > /sys/class/gpio/gpio18/direction
    # Sets pin 12 to high
    echo "1" > /sys/class/gpio/gpio18/value
}

function gpio18_led_off {
    #   Exports pin to userspace
    echo "18" > /sys/class/gpio/export
    # Sets pin 12 as an output
    echo "out" > /sys/class/gpio/gpio18/direction
    # Sets pin 18 to low
    echo "0" > /sys/class/gpio/gpio18/value 
}

# #   Exports pin to userspace
# echo "18" > /sys/class/gpio/export                  

# # Sets pin 18 as an output
# echo "out" > /sys/class/gpio/gpio18/direction

# # Sets pin 18 to high
# echo "1" > /sys/class/gpio/gpio18/value

# # Sets pin 18 to low
# echo "0" > /sys/class/gpio/gpio18/value 
# This next snippet sets up pin 4 to be an input, then reads the value of the input.

# echo "4" > /sys/class/gpio/export
# echo "in" > /sys/class/gpio/gpio4/direction
# cat /sys/class/gpio/gpio4/value



#-------------------------------------------------------------------------------------------

# MAIN
startTrace

if [[ ! -n "$DOM" ]]; then
    trace "Missing domain"
    printHelp
    exit -1
fi
if [[ ! -n "$OP" ]]; then
    trace "Missing operation"
    printHelp
    exit -2
fi

DOMDIR=$BASEDIR$DOM

case $DOM in
	led1)
        # Creating new domain structure
        # IDENT=$3
        # if [[ ! -n "$IDENT" ]]; then
        #     trace "Missing parameter"
        #     printHelp
        #     exit -3
        # fi
        
        trace $DOM $OP 

        case $OP in
            on)
                gpio18_led_on
                ret=$?
                trace Creation result: $ret
                exit $ret
                ;;
            off)
                gpio18_led_off
                ret=$?
                trace Creation result: $ret
                exit $ret
                ;;
            *)
                trace "Error: unknown operation"
                printHelp
                exit -5
                ;;
		esac
        ;;
	*)
		trace "Error: unknown domain"
        printHelp
        exit -5
		;;
  esac



