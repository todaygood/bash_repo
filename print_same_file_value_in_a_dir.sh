

打印/proc下面中断的affinity的脚本片段

for f in `find . -name "smp_affinity"`; 

do 

echo -ne "$f->" && cat $f; 

done