#!/bin/sh
# Script para captura dos valores do Bios e console da Huawei 
# OID de BIOS: 1.3.6.1.4.1.2011.2.235.1.1.11.50.1.4.4.66.73.79.83
# OID de Console: 1.3.6.1.4.1.2011.2.235.1.1.11.50.1.4.11.65.99.116.105.118.101.32.105.66.77.67

oid_bios='1.3.6.1.4.1.2011.2.235.1.1.11.50.1.4.4.66.73.79.83'
oid_console='1.3.6.1.4.1.2011.2.235.1.1.11.50.1.4.11.65.99.116.105.118.101.32.105.66.77.67'

function help(){
    echo "colocar as coisas aqui!"
    exit 1 
}
function executa(){
    versao_bios=`/usr/bin/snmpwalk -v3 -l authPriv -u $1 -a SHA -A $1 -x AES -X $2 $3 $oid_bios | awk {'print $4}'| sed -e 's/"//g'`
    versao_console=`/usr/bin/snmpwalk -v3 -l authPriv -u $1 -a SHA -A $1 -x AES -X $2 $3 $oid_console | awk {'print $4}'| sed -e 's/"//g'`
     
    echo -e "{\"versao_console\":\""$versao_console"\", \"versao_bios\":\""$versao_bios"\"}"

}


while getopts "hs:u:p:" option 
do 
    case $option in 
        h) help
            ;;
        v) echo "`basename $0` versao 1."
            exit
            ;;
        s) servidor="${OPTARG}"
            ;;
        u) usuario="${OPTARG}"
            ;;
        p) password="${OPTARG}"
            ;;
    esac
done

executa "$usuario" "$password" "$servidor"
#echo $command_console
#echo $command_bios
