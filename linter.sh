#!/bin/sh

fn_php()
{
    if ! head -1 $1 | grep -qs "<?php"
    then
        mv $1 $1.orig
        echo "<?php\n" | cat - $1.orig > $1
        rm $1.orig
    fi
    > $1.linter
    fn_iphp $1
}

fn_iphp()
{
    php -l $1 2>> $1.linter
    php -l $1
}

fn_htmlphp()
{
    tidy -eq $1 2> $1.linter
    tidy -eq $1
    fn_iphp $1
}

echo "el 1 es $1 y el 2 es $2"

cd code

case $1 in
    php)
        fn_php $2;;
    htmlphp)
        fn_htmlphp $2;;
    iphp)
        fn_iphp $2;;
    *)
        ;;
esac

cd ..

