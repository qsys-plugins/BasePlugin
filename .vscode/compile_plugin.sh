#!/bin/sh

echo "$1"

oldnum="$( grep 'Version' info.lua | cut -d $'\"' -f2 | cut -d $'\"' -f1 )"
echo $oldnum
newnum="$oldnum"

if test "$1" = "ver_maj"
then
  echo "updating version major num"

  majnum=${oldnum:0:1}
  ((majnum++))
  newnum="$majnum.0.0.0"

elif test "$1" = "ver_min"
then
  echo "updating version minor num"

  minnum=${oldnum:2:1}
  ((minnum++))
  newnum="${oldnum:0:1}.$minnum.0.0"

elif test "$1" = "ver_fix"
then
  echo "updating version fix num"

  fixnum=${oldnum:4:1}
  ((fixnum++))
  newnum="${oldnum:0:3}.$fixnum.0"

elif test "$1" = "ver_dev"
then
  echo "updating version dev num"

  devnum=${oldnum:6:1}
  ((devnum++))
  newnum="${oldnum%.*}.$devnum"

else
  echo "updating version dev num"

  devnum=${oldnum:6:1}
  ((devnum++))
  newnum="${oldnum%.*}.$devnum"

fi

echo $newnum
sed -i -E "s/$oldnum/$newnum/" info.lua