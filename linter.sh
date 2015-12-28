#!/bin/sh

fn_php()
{
    mv $1.php $1
    echo "<?php\n" | cat - $1 > $1.php
    > $1.linter
    fn_iphp $1
}

fn_iphp()
{
    php -l $1.php 2>> $1.linter
    php -l $1.php
}

fn_htmlphp()
{
    tidy -eq $1.php 2> $1.linter
    tidy -eq $1.php
    fn_iphp $1
}

cd code

case $1 in
    php)
        fn_php $2;;
    html+php)
        fn_htmlphp $2;;
    iphp)
        fn_iphp $2;;
    *)
        ;;
esac

cd ..

