----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:23:16 10/28/2013 
-- Design Name: 
-- Module Name:    Program_Counter - Behavioral 
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

entity Program_Counter is
	port (Clk : in	std_logic;
			Reset : in std_logic;
			Cur_Addr : out std_logic_vector(15 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is

signal temp_Addr : std_logic_vector(15 downto 0) := X"0000";

begin
process (Clk)
begin  

   if (Clk'event and Clk = '1') then
		
		--resets sets the PC to X"0000"
		if(Reset = '1') then
			Cur_Addr <= X"0000";
		else
		--subsequent PC starts from X"0004"
			temp_Addr <= temp_Addr + X"0004";
			Cur_Addr <= temp_Addr;
		end if;
		
	end if;
end process;
end Behavioral;

