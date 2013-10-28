----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:53:16 10/28/2013 
-- Design Name: 
-- Module Name:    Sign_Extend - Behavioral 
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

entity Sign_Extend is
	port (Instr_15to0 : in std_logic_vector(15 downto 0);
			Sign_Extend_Out : out std_logic_vector(31 downto 0));
end Sign_Extend;

architecture Behavioral of Sign_Extend is

begin

	Sign_Extend_Out <= X"0000" & Instr_15to0;

end Behavioral;

