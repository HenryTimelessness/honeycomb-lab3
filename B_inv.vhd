----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:13:09 09/30/2013 
-- Design Name: 
-- Module Name:    B_inv - Behavioral 
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

entity B_inv is
	Port ( B : in STD_LOGIC_VECTOR (31 downto 0);
			 Binv_bool : in STD_LOGIC;
			 S : out STD_LOGIC_VECTOR (31 downto 0));
end B_inv;

architecture Behavioral of B_inv is

begin

	S <= not B when Binv_bool='1' else
				B;

end Behavioral;


