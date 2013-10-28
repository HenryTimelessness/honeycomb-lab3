----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:10:05 10/28/2013 
-- Design Name: 
-- Module Name:    Control_Unit - Behavioral 
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

entity Control_Unit is
	port (Instr : in std_logic_vector(5 downto 0);
			ALUOp : out std_logic_vector(5 downto 0);
			Branch : out std_logic;
			MemRead : out std_logic;
			MemtoReg_Ctrl : out std_logic;
			MemWrite : out std_logic;
			ALUSrcCtrl : out std_logic;
			RegWrite : out std_logic;
			RegDst_Ctrl : out std_logic);
end Control_Unit;

architecture Behavioral of Control_Unit is

begin

	-- LW : op=35="100011"
	RegWrite <= '1' when Instr = "100011" else '0';
	ALUSrcCtrl <= '1' when Instr = "100011" else '0';
	MemRead <= '1' when Instr = "100011" else '0';
	MemtoReg_Ctrl <= '1' when Instr = "100011" else '0';
	RegDst_Ctrl <= '0' when Instr = "100011" else '1';
	
	-- Add if LW : op=35="100011"
	ALUOp <= "000001" when Instr = "100011" else "000000";

end Behavioral;