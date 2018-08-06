#!/usr/bin/perl

use strict;
use warnings;

# Abre el archivo
open( my $file, "<./files/results.csv" ) or die( "No hay archivo" );

# Itera cada uno de las líneas del archivo
while( <$file> ) {
    print $_;
}

# Cierra el archivo
close( $file );
