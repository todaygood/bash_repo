
echo "host-10-225-10-60"  >> hosts.list 
echo "cloud-sz-control-b12-02.sz.cloud.genomics.cn"  >> hosts.list

grep '(?<!sz.cloud.genomics.cn)$'  hosts.list
