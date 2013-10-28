----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:51:24 10/28/2013 
-- Design Name: 
-- Module Name:    Data_Memory - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_File is
	port (Read_Addr_1 : in std_logic_vector(4 downto 0);
			Read_Addr_2 : in std_logic_vector(4 downto 0);
			RegDst_Out : in std_logic_vector(4 downto 0);
			Write_Data : in std_logic_vector(31 downto 0);
			RegWrite : in std_logic;
			Read_Data_1 : out std_logic_vector(31 downto 0);
			Read_Data_2 : out std_logic_vector(31 downto 0));
end Register_File;

architecture Behavioral of Register_File is

   type ram_type is array (0 to 31) of std_logic_vector (31 downto 0);
   signal RAM: ram_type:= (X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", 
									X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", 
									X"00000000", X"00000000", X"00000000", X"00000008", X"00000000", X"00000000", X"00000000", X"00000000", 
									X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", X"00000000");
	signal temp : std_logic_vector(31 downto 0);
begin

	Read_Data_1 <= RAM(conv_integer(Read_Addr_1));
	Read_Data_2 <= RAM(conv_integer(Read_Addr_2));
	
end Behavioral;



