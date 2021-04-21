#!/bin/sh

ROOT="glucose-4.1"

BIN="$ROOT/usr/bin"
LIB="$ROOT/usr/lib"
GLUCOSE="$ROOT/usr/include/glucose"

rm -r "$ROOT/usr"
mkdir -p $BIN
mkdir -p $LIB
mkdir -p $GLUCOSE

PWD="$PWD/simp" make -C simp
PWD="$PWD/parallel" make -C parallel
PWD="$PWD/parallel" make -C parallel libr LIB=glucose

cp -t $LIB parallel/libglucose.a

cp -t $BIN parallel/glucose-syrup
cp -t $BIN simp/glucose 

find . -name "*.h" | while read file
do
    DIR=`dirname "$file" | sed 's|^\./||'`
    [ -d "$GLUCOSE/$DIR" ] || mkdir -p "$GLUCOSE/$DIR"
    cp -t "$GLUCOSE/$DIR" "$file"
done


dpkg-deb --build --root-owner-group "$ROOT"
