/**
 * Originally:
 * Módulo que permite trabajar con patrones hexagonales tipo panal.
 *
 * @author  Joaquín Fernández
 * @url     https://gitlab.com/joaquinfq/openscad/blob/master/Modules/Pattern/honeycomb.scad
 * @license CC-BY-NC-4.0
 * @see     http://www.thingiverse.com/thing:2124344
 * Modified by: John Flinchbaugh
 * Added the sleeve, tabs, and a measurement-sized module.
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
    for (_row = [ 0 : rows ]) {
        translate([ 
            (_row % 2) * _halfSize, 
            _row * _halfSize * sqrt(3), 
            0 
        ]) {
            for (_column = [0 : columns]) {
                translate([ _column * size, 0, 0 ]) {
                    rotate([0, 0, 30]) {
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
module honeycombCube(columns, rows, height, size, thickness,   sleeve_thickness, slot_width) {
    _width  = (columns ) * size;
    _length = (rows) * size * sqrt(3) / 2;
    difference() {
        // main body
        translate([sleeve_thickness, sleeve_thickness, 0]) {
            minkowski() {
                cube([ 
                    _width + sleeve_thickness , 
                    _length - sleeve_thickness, 
                    height + sleeve_thickness - 1]);
                cylinder(r=sleeve_thickness, h = 1);
            }
        }

        // carve out indent for sleeve
        translate([
            sleeve_thickness * 3, 
            sleeve_thickness * 3/2, 
            height
        ]) {
            minkowski() {
                cube([ 
                    _width - 3 * sleeve_thickness, 
                    _length - 2 * sleeve_thickness, 
                    sleeve_thickness - 1
                ]);
                cylinder(r=sleeve_thickness/2, h = 1);
            }
        }

        // carve out honey comb
        intersection() {
            translate([
                sleeve_thickness * 3, 
                sleeve_thickness * 3/2, 
                0
            ]) {
                minkowski() {
                    cube([ 
                        _width - 3 * sleeve_thickness, 
                        _length - 2 * sleeve_thickness, 
                        height
                    ]);
                    cylinder(r=sleeve_thickness/2, h = 1);
                }
            }

            translate([
                sleeve_thickness, 
                sleeve_thickness / 2, 
                0 
            ]) {
                honeycomb(columns + 1, rows + 1, height, size, thickness);
            }
        }

        // carve out slots
        translate([
            sleeve_thickness * 3/4, 
            (sleeve_thickness + _length - slot_width) / 2,
            0
        ]) {
            cube([
                sleeve_thickness, 
                slot_width, 
                height + sleeve_thickness
            ]);
        }

        translate([
            sleeve_thickness * 5/4 + _width, 
            (sleeve_thickness + _length - slot_width) / 2,
            0
        ]) {
            cube([
                sleeve_thickness, 
                slot_width, 
                height + sleeve_thickness
            ]);
        }
    }
}

module honeycombCubeSize(
    width,
    length,
    height,
    size,
    thickness,
    sleeve_thickness,
    slot_width
) {
    columns = (width + sleeve_thickness * 2)  / size;
    rows = (length + sleeve_thickness* 2) / size / sqrt(3) * 2;

    honeycombCube(
        columns,
        rows,
        height,
        size,
        thickness,
        sleeve_thickness,
        slot_width
    );
}



// 66 x 41 - YN-460II
//honeycombCubeSize(66, 42, 15, 6.6, 0.43, 1.6, 15);


sleeve_thickness = 3.0; // mm
tolerance = 0.4; //mm
strap_length = 50; // mm
// 77 x 49 - YN-560IV
// honeycombCubeSize(77, 49, 17, 6.6, 0.5, sleeve_thickness, 20);

// straps
module strap(strap_length, strap_width, sleeve_thickness, tolerance) {
    difference() {
        cube([
            strap_width - 2 * tolerance, 
            strap_length, 
            sleeve_thickness - tolerance
        ]);
        translate([sleeve_thickness, sleeve_thickness, 0]) {
            cube([
                strap_width - tolerance - 5 * sleeve_thickness, 
                strap_length - 2 * sleeve_thickness,
                sleeve_thickness - tolerance
            ]);
        }
        translate([sleeve_thickness * 4 - tolerance, sleeve_thickness, 0]) {
            cube([
                strap_width - tolerance - 5 * sleeve_thickness, 
                strap_length - 2 * sleeve_thickness,
                sleeve_thickness - tolerance
            ]);
        }
        translate([sleeve_thickness, sleeve_thickness, 0]) {
            cube([
                strap_width - 2 * tolerance - 2 * sleeve_thickness, 
                strap_length - 6 * sleeve_thickness,
                sleeve_thickness - tolerance
            ]);
        }
    }
    translate([-1 * sleeve_thickness, 0, 0]) {
        cube([
            strap_width + 2 * sleeve_thickness - tolerance * 2, 
            sleeve_thickness, 
            sleeve_thickness
        ]);
    }
}

strap(strap_length, 20, sleeve_thickness, tolerance);