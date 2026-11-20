library ieee;
use ieee.numeric_std.all;       -- signal y por el shift
use ieee.math_real.all; 
use ieee.std_logic_1164.all;    

/*
Codigo de la ALU.
Nota: sel_fn es la entrada de selección, de 4 bit. A y B son los operandos, de W bit. Y es el
resultado, de W bit y Z es la indicación de resultado cero, de un bit. Los operadores << y
>> denotan desplazamiento a la izquierda y desplazamiento a la derecha respectivamente.
Los operadores = y < denotan las operaciones relacionales igual a y menor que, que evalúan
a 1 si se cumple la condición y 0 en caso contrario.

*/

entity alu is
    generic( 
        constant w natural := 32);

    port(
        a in std_logic_vector(w-1 downto 0);
        b in std_logic_vector(w-1 downto 0);
        y out std_logic_vector(w-1 downto 0);
        z out std_logic;
        sel_fn std_logic_vector(3 downto 0);
        );
    
        end alu;


architecture arc of alu is
    constant n :natural := integer(ceil(log2(real(w))));
    constant relleno : std_logic_vector(w-2 downto 0) := (others => '0');  
-- Signed y unsigned entregan un std_logic para asignarlo en y se necesita un std_logic_vector para eso concatenaremos
-- el resultado con un vector y ese lo asignamos.
                                                                                
begin

    with sel_fn select

    y <= std_logic_vector (unsigned(a) + unsigned(b)) when "0000";
         std_logic_vector (unsigned(a) - unsigned(b)) when "0001"
         std_logic_vector (shift_left(unsigned (a), to_integer(unsigned(b(n -1 downto 0))))) when "0010" | "0011";
         relleno & (signed (a) ?< signed (b)) when "0100" | "0101";         -- se 
         relleno & (unsigned (a) ?< unsigned (b)) when "0110" | "0111";
         a xor b when "1000" | "1001";
         std_logic_vector (shift_right(unsigned (a), to_integer(unsigned(b(n -1 downto 0))))) when "1010";
         std_logic_vector (shift_right(signed (a), to_integer(unsigned(b(n -1 downto 0))))) when "1011";
         a or b when "1100" | "1101";
         a and b when others;       -- Siempre me conviene poner others para contemplar casos que no tengo en cuenta.

    z <= nor y          -- otra opcion es z <= unsigned (y)?=0 


         end arc;



