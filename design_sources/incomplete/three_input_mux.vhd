LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY three_input_mux IS
   PORT( 
      input_0 : IN     std_logic_vector (31 DOWNTO 0);
      input_1 : IN     std_logic_vector (31 DOWNTO 0);
      input_2 : IN     std_logic_vector (31 DOWNTO 0);
      sel_0     : IN     std_logic;
      sel_1     : IN     std_logic;
      output  : OUT    std_logic_vector (31 DOWNTO 0)
   );
END three_input_mux ;


ARCHITECTURE struct OF three_input_mux IS

BEGIN

   output <= input_0 when (sel_1 ='0' AND sel_0= '0' ) ELSE
             input_1 when (sel_1 ='0' AND sel_1= '1' ) ELSE
             input_2 when (sel_1 ='1' AND sel_0= '0' ) ;

END struct;
