start=`date +%s`
read -t 2
echo "hello"
end=`date +%s`

runtime=$((end-start))
echo $runtime
