
-- Un testbench es un archivo VHDL auxiliar creado únicamente para simulación por software.


library ieee;
use ieee.std_logic_1164.all;
use work.all;                   -- Si no usara work al exportar la entidad deberia usar work.contador 
-- use std.env.finish;             -- Sirve para importar un procedimiento de finish en estimulo.


entity contador_4bits_tb is end;




architecture tb of contador_4bits_tb is 
-- Antes del begin se llama la zona declarativa de arch

    constant periodo: time := 10 ns;   -- Tiene que ser := no <=

    signal reset, hab, carga, clk: std_logic;      
    signal salida: std_logic_vector (3 downto 0);
    signal valor: std_logic_vector (3 downto 0);

begin
    DUT: entity work.contador       
        port map (
            reset => reset,
            hab => hab, 
            carga => carga, 
            clk => clk, 
            salida => salida, 
            valor => valor); -- Asignamos puertos a salidas


--DUT es una etiqueta (device under test) que significa que exporto un dispositivo de mi codigo vhdl. (el nombre puede variar)
-- Para vhdl previo a 2008 pongo work.contador


reloj: process
    begin
        clk <= '0';
        wait for periodo/2;
        clk <= '1';
        wait for periodo/2;
    end process;

--          Sin lista de sensibilidad: Al no tener lista de sensibilidad, este proceso se ejecuta en un 
--      bucle infinito durante toda la simulación


estimulo: process 
    begin 
        -- 1 Estado inicial con Reset activo.

        reset <= '1'; 
        hab <= '0'; 
        carga <= '0'; 
        valor <= "0000"; 
        wait for 20 ns;                 -- Se debería mantener.

        -- 2 Quito el Reset y habilito el conteo ascendente

         reset <= '0';
         hab <= '1'; 
        wait for 50 ns;                 -- Debería contar algunos ciclos

        -- 3 Inhabilito el contador 

        hab <= '0';
         wait for 30 ns;                -- Debería mantener el estado

        -- 4 Cargo el valor 10 (1010 en binario) mientras cuenta

        valor <= "1010";
        carga <= '1'; 
        wait for 10 ns;                  -- Debería carga en el flanco de subida
        
        -- 5 Quito carga y reanudo el conteo desde 10 

        carga <= '0';
        hab <= '1';
        wait for 60 ns;

        -- 6 Fin de la simulación 
        
         wait; -- Detiene el proceso para no repetir el bucle 
--        finish;     -- Este es el std.env.finish
     end process;   -- Estimulo
    
end architecture;


