#!/bin/bash
export LC_ALL=C

for cmd in bash ld bison chown diff find gawk gcc g++ grep gzip m4 make patch perl python3 sed tar makeinfo xz; do
    if command -v "$cmd" >/dev/null 2>&1; then
        echo "OK: $cmd"
    else
        echo "FALTA: $cmd"
    fi
done

echo
echo "Kernel:"
uname -r

echo
echo "Compilador C++:"
printf 'int main(){}' | g++ -x c++ -o /tmp/lfs-test - && echo "OK: compilación" || echo "ERROR: compilación"
rm -f /tmp/lfs-test

echo
echo "Procesadores disponibles:"
nproc