#!/bin/bash
memory=$( free | grep Mem: | awk ' { printf "%.0f\t", $3/$2*100 }' )
while getopts ":c::w::e:" arg; do
case $arg in
c)
critical=${OPTARG}
if [[ $critical -eq "" ]] ; then
echo "No parameter supplied for critical threshold. Please input a value higher than $memory "
exit 0
fi

w)
warning=${OPTARG}
if [[ $warning -eq "" ]] ; then
echo "No parameter supplies for warning threshold. Please input a value higher than $memory "
exit 0
fi

e)
mail=${OPTARG}
;;

esac
done

if [ $warning -ge $critical ] ; then
echo "The warning threshold should not be larger than the critical threshold."
exit 0
fi

if [ $memory -ge $critical ] ; then
echo "The critical threshold has been reached! $memory "
exit 2
elif [ $memory -le $critical ] ; then
echo "The memory is below critical threshold. $memory "
fi

if [ $memory -ge $warning ] ; then
echo "The warning threshold has been reached! $memory "
exit 1
elif [ $memory -le $warning ] ; then
echo "The total memory is below warning threshold. $memory "
fi

if [[ -z $mail ]] ; then
echo "Please provide your email address. "
else
exit 0
fi

