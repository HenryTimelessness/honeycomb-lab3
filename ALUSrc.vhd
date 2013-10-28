----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:45:52 10/28/2013 
-- Design Name: 
-- Module Name:    ALUSrc - Behavioral 
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

entity ALUSrc is
	port (Read_Data_2 : in std_logic_vector(31 downto 0);
			Sign_Extend_Out :	in std_logic_vector(31 downto 0);
			ALUSrc_Ctrl : in std_logic;
			ALUSrc_Out : out std_logic_vector(31 downto 0));
end ALUSrc;

architecture Behavioral of ALUSrc is
	
begin

	 ALUSrc_Out  <= Read_Data_2 when ALUSrc_Ctrl = '0' else
				Sign_Extend_Out;

end Behavioral;

