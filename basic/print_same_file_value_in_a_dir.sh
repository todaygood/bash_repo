

��ӡ/proc�����жϵ�affinity�Ľű�Ƭ��

for f in `find . -name "smp_affinity"`; 

do 

echo -ne "$f->" && cat $f; 

done