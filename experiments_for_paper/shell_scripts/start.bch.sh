#! /bin/bash

betavals=(1)
propvals=(6)
nvals=(1000)
pvals=(2000)
epsvals=(1 4)
cvals=(1 4)
extravals=(1 2)
exp=(1)

reps=400

for ((i1=0; i1<${#betavals[@]} ;i1++))
do
for ((i2=0; i2<${#propvals[@]} ;i2++))
do
for ((i3=0; i3<${#nvals[@]} ;i3++))
do
for ((i4=0; i4<${#pvals[@]} ;i4++))
do
for ((i5=0; i5<${#epsvals[@]} ;i5++))
do
for ((i6=0; i6<${#cvals[@]} ;i6++))
do
for ((i7=0; i7<${#extravals[@]} ;i7++))
do
    beta=${betavals[$i1]}
    prop=${propvals[$i2]}
    n=${nvals[$i3]}
    p=${pvals[$i4]}
    eps=${epsvals[$i5]}
    c=${cvals[$i6]}
    extra=${extravals[$i7]}

    fnm="logging/progress-$beta-$prop-$n-$p-$eps-$c-$extra-$reps-$exp.out"
    echo $fnm

    nohup nice R CMD BATCH --no-save --no-restore "--args $beta $prop $n $p $eps $c $extra $reps $exp" main.R $fnm &
done
done
done
done
done
done
done
