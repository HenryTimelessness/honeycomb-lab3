----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:41:18 10/28/2013 
-- Design Name: 
-- Module Name:    MemtoReg - Behavioral 
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

entity MemtoReg is
	port (Read_Data : in std_logic_vector(31 downto 0);
			Result1 :	in std_logic_vector(31 downto 0);
			MemtoReg_Ctrl : in std_logic;
			MemtoReg_Out : out std_logic_vector(31 downto 0));
end MemtoReg;

architecture Behavioral of MemtoReg is

begin

	MemtoReg_Out  <= Read_Data when MemtoReg_Ctrl = '1' else
				Result1;
	
end Behavioral;

