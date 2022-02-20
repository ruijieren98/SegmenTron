echo "V100"
nodestat -F gpuv100

echo "A100"
nodestat -F gpua100

echo "local memory"
getquota_zhome.sh

echo "/work3/ memory"
getquota_work3.sh

nodestat -j -g -r -m -n n-62-12-21
nodestat -j -g -r -m -n n-62-12-22
nodestat -j -g -r -m -n n-62-12-23
nodestat -j -g -r -m -n n-62-12-24
