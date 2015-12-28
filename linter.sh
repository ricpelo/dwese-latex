#!/bin/sh

fn_php()
{
    mv $1.php $1
    echo "<?php\n" | cat - $1 > $1.php
    php -l $1.php 2> $1.linter
    php -l $1.php
}

cd code
if [ "$1" = "php" ]
then
    fn_php $2
fi
cd ..

