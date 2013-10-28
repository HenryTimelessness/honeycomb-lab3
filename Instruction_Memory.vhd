----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:14:31 10/28/2013 
-- Design Name: 
-- Module Name:    Instruction_Memory - Behavioral 
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

entity Instruction_Memory is
	port (Read_Address : in std_logic_vector(15 downto 0);
			Instr : out std_logic_vector(31 downto 0));
end Instruction_Memory;

architecture Behavioral of Instruction_Memory is
	type rom_type is array (0 to 11) of std_logic_vector (7 downto 0);                 
   signal ROM : rom_type:= (X"20", X"00", X"68", X"8e", X"20", X"40", X"48", X"02", X"20", X"00", X"68", X"ae");
	--1.lw $t0, 	32($s3)
	--2.add $t0,	$s2, $t0
	--3.sw $t0, 	32($s3)
begin

	Instr(7 downto 0) <= ROM(conv_integer(Read_Address));
	Instr(15 downto 8) <= ROM(conv_integer(Read_Address)+1);
	Instr(23 downto 16) <= ROM(conv_integer(Read_Address)+2);
	Instr(31 downto 24) <= ROM(conv_integer(Read_Address)+3);
	
end Behavioral;



