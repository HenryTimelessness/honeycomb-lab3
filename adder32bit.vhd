----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:30:13 09/28/2013 
-- Design Name: 
-- Module Name:    adder32bit - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder32bit is
	Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
			 B : in STD_LOGIC_VECTOR (31 downto 0);
			 C_in : in STD_LOGIC;
			 C_out : out STD_LOGIC;
			 S : out STD_LOGIC_VECTOR (31 downto 0));
end adder32bit;

architecture Behavioral of adder32bit is

signal temp_S: STD_LOGIC_VECTOR (32 downto 0);

begin

	temp_S <= ('0'&A) + ('0'&B);
	S <= temp_S(31 downto 0);
	C_out <= temp_S(32);

end Behavioral;

