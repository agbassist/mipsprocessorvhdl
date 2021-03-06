LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


ENTITY IM IS
   PORT( 
      ReadAddress : IN     std_logic_vector (31 DOWNTO 0);
      rst         : IN     std_logic;
      Instruction : OUT    std_logic_vector (31 DOWNTO 0)
   );
END IM ;


ARCHITECTURE struct_4byte_wide OF IM IS

   -- Architecture declarations
   constant program_size : natural := 38; -- Number of instructions
         
   constant text_segment_start : std_logic_vector(31 downto 0) := x"00400000";
 
   type im_mem_type is array(0 to program_size-1) of std_logic_vector(31 downto 0);
   constant nop : std_logic_vector(31 downto 0) := (others => '0');
   -- Internal signal declarations
   SIGNAL im_mem : im_mem_type;
      
   constant program : im_mem_type :=
      -- Insert your program binaries (machine code) here --   
       (
      "00100000000001001111111111110011",
      "00001100000100000000000000000011",
      "00001000000100000000000000000010",
      "00100011101111011111111111110100",
      "10101111101111110000000000001000",
      "10101111101010000000000000000100",
      "10101111101001000000000000000000",
      "00000000100000000100000000101010",
      "00010001000000000000000000000001",
      "00000000000001000010000000100010",
      "00001100000100000000000000010010",
      "00010001000000000000000000000001",
      "00000000000000100001000000100010",
      "10001111101001000000000000000000",
      "10001111101010000000000000000100",
      "10001111101111110000000000001000",
      "00100011101111010000000000001100",
      "00000011111000000000000000001000",
      "00100000000000100000000000000001",
      "00000000010001000000100000101010",
      "00010100001000000000000000000010",
      "00000000000001000001000000100000",
      "00000011111000000000000000001000",
      "00100011101111011111111111110100",
      "10101111101111110000000000001000",
      "10101111101100000000000000000100",
      "10101111101001000000000000000000",
      "00100000100001001111111111111111",
      "00001100000100000000000000010010",
      "00000000010000001000000000100000",
      "00100000100001001111111111111111",
      "00001100000100000000000000010010",
      "00000000010100000001000000100000",
      "10001111101001000000000000000000",
      "10001111101100000000000000000100",
      "10001111101111110000000000001000",
      "00100011101111010000000000001100",
      "00000011111000000000000000001000"
      );

      ------------------------------------------------------       

BEGIN
   ---------------------------------------------------------------------------
   process1 : PROCESS (ReadAddress, rst)
   ---------------------------------------------------------------------------
   BEGIN
      IF (rst /= '0') THEN
         im_mem <= program;
         Instruction <= nop;
      ELSE
      report "Instruction Memory Value is: " & integer'image(CONV_INTEGER(im_mem((CONV_INTEGER(ReadAddress) - CONV_INTEGER(text_segment_start))/4)));
         Instruction <= im_mem( CONV_INTEGER(ReadAddress - text_segment_start)/4 );
      END IF;
   END PROCESS process1;

END struct_4byte_wide;
