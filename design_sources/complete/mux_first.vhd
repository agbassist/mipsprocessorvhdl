LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY mux_first IS
   PORT( 
      input_0 : IN     std_logic_vector (4 DOWNTO 0);
      input_1 : IN     std_logic_vector (4 DOWNTO 0);
      sel     : IN     std_logic;
      jal     : in std_logic;
      output  : OUT    std_logic_vector (4 DOWNTO 0)
   );
END mux_first ;


ARCHITECTURE struct OF mux_first IS

BEGIN

   output <= input_0 when (sel ='0') else 
                input_1 when sel='1' else
                "11111" when jal='1';

END struct;
