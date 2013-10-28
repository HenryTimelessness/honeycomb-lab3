----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:40:09 10/28/2013 
-- Design Name: 
-- Module Name:    ALU_Control - Behavioral 
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

entity ALU_Control is
	port (ALUOp : in std_logic_vector(5 downto 0);
			Instr_5to0 : in std_logic_vector(5 downto 0);
			ALU_Control_Out : out std_logic_vector(5 downto 0));
end ALU_Control;

architecture Behavioral of ALU_Control is

begin

	ALU_Control_Out  <= ALUOp when ALUOp = "000001" else
				Instr_5to0;

end Behavioral;

