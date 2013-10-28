----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:18:35 10/28/2013 
-- Design Name: 
-- Module Name:    RegDst - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegDst is
	port (Instr_20to16 : in std_logic_vector(4 downto 0);
			Instr_15to11 :	in std_logic_vector(4 downto 0);
			RegDst_Ctrl : in std_logic;
			RegDst_Out : out std_logic_vector(4 downto 0));
end RegDst;

architecture Behavioral of RegDst is
	
begin

	 RegDst_Out  <= Instr_20to16 when RegDst_Ctrl = '0' else
				Instr_15to11;

end Behavioral;

