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
        # Valida si el visitante le ganó al equipo local
        if( $4 > $3 ) {
            printf(
                "%s (%d) - (%d) %s\n",
                $1, $3, $4, $2
            );
            $match++;
        }
        # NOTA: En Perl las variables de agrupaciones de expresiones regulares comienzan en:
        #       $0 = toda la cadena completa (en casi todos los lenguajes, la línea antes de hacer match) que nos puede servir para fragmentarla de otras formas
        #       $1 = primer grupo en la expresión regular de izquierda a derecha
        #       $2 = segundo grupo en la expresión regular de izquierda a derecha
        #       $(n) = así sucesivamente
    }
    else {
        $nomatch++;
    }
}

# Cierra el archivo
close( $file );

printf( "Se encontraron: \n - %d aciertos \n - %d desaciertos \n", $match, $nomatch );
