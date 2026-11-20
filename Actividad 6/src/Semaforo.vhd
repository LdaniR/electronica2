library ieee;
use ieee.std_logic_1164.all;        



entity semaforo is
    port(
        
        clk: in std_logic;    
        fin_de_cuenta: in std_logic;           -- Z
        nreset: in std_logic;                  -- Entrada activa baja, es decir, reacciona con la bajada de la señal de clk
        solicitud_NS: in std_logic;
        solicitud_EO: in std_logic;
        emergencia_NS in std_logic;
        emergencia_EO in std_logic;
        
        semaforo_NS out std_logic_vector(2 downto 0);         -- Luz norte a sur puedo codificar en one-hot las tres luces
        semaforo_EO out std_logic_vector(2 downto 0);         -- Luz este a oeste
        carga: out std_logic;                          -- carga es el tiempo para el temporizador
        
        );
        end semaforo;
        
        
architecture arc of semaforo is 
--ZONA DECLARATIVA
 constant frecuencia_trabajo: integer:= 11999;   -- Frecuencia del oscilador de cristal de la FPGA
        


-- PREESCALER

preescaler: process (clk,nreset)

begin


    end process preescaler;


end arc;