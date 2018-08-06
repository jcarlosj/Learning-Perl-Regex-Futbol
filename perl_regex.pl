#!/usr/bin/perl

use strict;
use warnings;

my $match = 0;
my $nomatch = 0;

# Abre el archivo
open( my $file, "<./files/results.csv" ) or die( "No hay archivo" );

# Itera cada uno de las líneas del archivo
while( <$file> ) {
    chomp;      # Quita los saltos de línea y los caracteres raros
    # Usamos la función m (match) para validar nuestra expresión que en Perl se encierra entre / slashes
    if( m/^[\d]{4,4}.*?,(.*?),(.*?),(\d+),(\d+),.*$/ ) {
        print $_ ."\n";
        $match++;
    }
    else {
        $nomatch++;
    }
}

# Cierra el archivo
close( $file );

printf( "Se encontraron: \n - %d aciertos \n - %d desaciertos \n", $match, $nomatch );
