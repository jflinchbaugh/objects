/**
 * Módulo que permite trabajar con patrones hexagonales tipo panal.
 *
 * @author  Joaquín Fernández
 * @url     https://gitlab.com/joaquinfq/openscad/blob/master/Modules/Pattern/honeycomb.scad
 * @license CC-BY-NC-4.0
 * @see     http://www.thingiverse.com/thing:2124344
 */
/**
 * Dibuja un panal de miel completo.
 *
 * @param {Number} columns   Número de columnas (Eje X).
 * @param {Number} rows      Número de filas (Eje Y).
 * @param {Number} height    Altura del cubo (Eje Z).
 * @param {Number} size      Tamaño del hexágono.
 * @param {Number} thickness Grosor de las paredes del panal.
 */
module honeycomb(columns, rows, height, size, thickness)
{
    _halfSize = size / 2;
    for (_row = [ 0 : rows ])
    {
        translate([ (_row % 2) * _halfSize, _row * _halfSize * sqrt(3), 0 ])
        {
            for (_column = [0 : columns])
            {
                translate([ _column * size, 0, 0 ])
                {
                    rotate([0, 0, 30])
                    {
                        cylinder(
                            r   = (size - thickness) / sqrt(3),
                            h   = height,
                            $fn = 6
                        );
                    }
                }
            }
        }
    }
}
/**
 * Dibuja un panal acotado por un cubo hueco.
 *
 * @param {Number} columns   Número de columnas (Eje X).
 * @param {Number} rows      Número de filas (Eje Y).
 * @param {Number} height    Altura del cubo (Eje Z).
 * @param {Number} size      Tamaño del hexágono.
 * @param {Number} thickness Grosor de las paredes del panal.
 */
module honeycombCube(columns, rows, height, size, thickness, sleeve_height, tab_height)
{
    _width  = (columns ) * size;
    _length = (rows) * size * sqrt(3) / 2;
    difference()
    {
        cube([ _width + thickness, _length + thickness, height + sleeve_height + tab_height]);
        translate([thickness, thickness, height]) {
            cube([ _width-thickness, _length-thickness, sleeve_height + tab_height]);
        }
        translate([0, 0, height + sleeve_height]) {
            cube([2 * size + thickness, _length+thickness, tab_height]);
        }
        translate([_width - 2 * size, 0, height + sleeve_height]) {
            cube([2 * size + thickness, _length+thickness, sleeve_height + tab_height]);
        }
        intersection()
        {
            translate([ thickness, thickness, 0 ])
            {
                cube([ _width - thickness, _length - thickness, height ]);
            }
            translate([ thickness / 2, thickness / 2, 0 ])
            {
                honeycomb(columns, rows, height, size, thickness);
            }
        }
    }
}

// 66 x 41 - YN-460II
honeycombCube(10, 7, 15, 6.5, 0.42, 3, 10);

// 76 x 49 - YN-560IV
//honeycombCube(12, 8, 15, 6.5, 0.42, 3, 10);

