library ieee;
use ieee.std_logic_1164.all;    
use ieee.numeric_std.all;       -- permite usar el unsigned y signed


--La libreria ieee tiene muchos paquetes (como std_logic_1164 y numeric_std) nosotros solo
--usamos los que son utiles. El .all hace directamente visibles todas las declaraciones 
--(tipos de datos, constantes, funciones y operadores) 
--contenidas dentro de un paquete o biblioteca sin tener que nombrarlas una por una, ejemplo: ieee.numeric_std.unsigned() 
--en vez de usar unsigned () directamente.



--Entity entiendo que es el chip y se declara los pines a usar para esté chip.


entity contador is
    port(                                           -- Declaro los puertos de mi interfaz
    carga: in std_logic;                            -- Entradas de 1 bit
    hab: in  std_logic;
    reset: in std_logic;        
    clk: in std_logic;

    salida: out std_logic_vector (3 downto 0);      -- El downto es para declarar el MSB y LSB.
    valor: in std_logic_vector (3 downto 0)         -- EL ultimo puede no llevar punto y coma.        
    );
end contador;


-- Dentro de port el ; sirve para separar elementos de una lista, no como terminador de una sentencia.




--En la arquitectura va la logica que describe el chip.



architecture arch of contador is                        -- Declaro mi implementacion

    signal estado, estado_sig : unsigned (3 downto 0);      -- signal declara las conexiones internas, es como para declarar variables.
begin
    memoria: process (clk) is       -- clk es la lista de sensibilidad, si pongo all uso todas las entradas que definí
    begin
        if rising_edge (clk) then
            estado <= estado_sig;
        end if;
    end process;

-- LOGICA COMBINACIONAL DE ESTADO SIGUIENTE (DATAPATH)

estado_sig <= "0000" when reset = '1' else
            unsigned (valor) when carga = '1' else
            estado when hab = '0' else
            estado + 1;                         -- En VHDL no se existe estado ++

-- LOGICA COMBINACIONAL DE ESTADO ACTUAL (DATAPATH)

salida <= std_logic_vector(estado);


end arch ; 

