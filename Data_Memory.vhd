----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:49:50 10/28/2013 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Data_Memory is
	port (Address : in std_logic_vector(31 downto 0);
			Write_Data : in std_logic_vector(31 downto 0);
			MemRead: in std_logic;
			MemWrite: in std_logic;
			Read_Data : out std_logic_vector(31 downto 0));
end Data_Memory;

architecture Behavioral of Data_Memory is

   type ram_type is array (0 to 127) of std_logic_vector (7 downto 0);
   signal RAM: ram_type:= (X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", 
									X"00", X"01", X"02", X"03", X"04", X"05", X"06", X"07",
									X"08", X"09", X"0a", X"0b", X"0c", X"0d", X"0e", X"0f",
									X"10", X"11", X"12", X"13", X"14", X"15", X"16", X"17",
									X"18", X"19", X"1a", X"1b", X"1c", X"1d", X"1e", X"1f",
									X"01", X"02", X"03", X"04", X"00", X"00", X"00", X"00",
									X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
									X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
									X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
									X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
									X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
									X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
									X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
									X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
									X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00",
									X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00");
									
	signal temp : std_logic_vector(31 downto 0);
begin

	Read_Data(7 downto 0) <= RAM(conv_integer(Address)) when MemRead = '1';
	Read_Data(15 downto 8) <= RAM(conv_integer(Address)+1) when MemRead = '1';
	Read_Data(23 downto 16) <= RAM(conv_integer(Address)+2) when MemRead = '1';
	Read_Data(31 downto 24) <= RAM(conv_integer(Address)+3) when MemRead = '1';
	
end Behavioral;

