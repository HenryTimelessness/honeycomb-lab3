----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:39:18 09/18/2013 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

entity alu is
Port (Clk			: in	STD_LOGIC;
		Control		: in	STD_LOGIC_VECTOR (5 downto 0);
		Operand1	: in	STD_LOGIC_VECTOR (31 downto 0);
		Operand2	: in	STD_LOGIC_VECTOR (31 downto 0);
		Result1		: out	STD_LOGIC_VECTOR (31 downto 0);
		Result2		: out	STD_LOGIC_VECTOR (31 downto 0);
		Debug		: out	STD_LOGIC_VECTOR (31 downto 0));
end alu;

architecture Behavioral of alu is

component adder32bit
	Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
			 B : in STD_LOGIC_VECTOR (31 downto 0);
			 C_in : in STD_LOGIC;
			 C_out : out STD_LOGIC;
			 S : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component B_inv
	Port ( B : in STD_LOGIC_VECTOR (31 downto 0);
			 Binv_bool : in STD_LOGIC;
			 S : out STD_LOGIC_VECTOR (31 downto 0));
end component;

signal adder_out, newOperand2, andResult, mulResult1, mulResult2, divResult1, divResult2, leftShiftResult, rightShiftResult: STD_LOGIC_VECTOR (31 downto 0);
signal carry_in, zero_flag, carry_flag, divide_flag, Binv_bool, sltResult, bool_sign, bool_SRA: STD_LOGIC;

begin

	adder32bit_1 : adder32bit         			port map (Operand1, newOperand2, carry_in, carry_flag, adder_out);
	B_inv_1 : B_inv 						 			port map (Operand2, Binv_bool, newOperand2);

process (Clk)
begin  
   if (Clk'event and Clk = '1') then
	
-----------------(20)RESET---------------------------------------------
      if Control(5) = '1' then
			Result1 <= X"00000000";
			Result2 <= X"00000000";
			Debug   <= X"00000000";
-----------------(00)NOP: No Operation---------------------------------
		elsif Control = "000000" then
-----------------(01)ADD: Add signed-----------------------------------
		elsif Control = "000001" then
			Binv_bool <= '0';
			carry_in <= '0';
         Result1  <= adder_out;
			Result2 <= X"00000000";
			Debug   <= X"00000000";
			--ignore carryflag
-----------------(02)ADDU: Add unsigned--------------------------------	 
      elsif Control = "000010" then
			Binv_bool <= '0';
			carry_in <= '0';
         Result1  <= adder_out;
			Result2 <= X"00000000";
			Debug    <= (X"0000000"&'0'&'0'&'0'&carry_flag);
			--if carryflag is 1, there is a carry
			--if carryflag is 0, there is no carry
-----------------(03)SUB: Subtract signed------------------------------
		elsif Control = "000011" then
			Binv_bool <= '1';
			carry_in <= '1';
         Result1  <= adder_out;
			Result2 <= X"00000000";
			Debug   <= X"00000000";
			--ignore carryflag
-----------------(04)SUBU: Subtract unsigned---------------------------
		elsif Control = "000100" then
			Binv_bool <= '1';
			carry_in <= '1';
         Result1  <= adder_out;
			Result2 <= X"00000000";
			Debug    <= (X"0000000"&'0'&'0'&'0'&carry_flag);
			--if carryflag is 1 it is positive
			--if carryflag is 0 it is negative
-----------------(09)AND: AND------------------------------------------
		elsif Control = "001001" then
			Result1 <= Operand1 and Operand2;
			Result2 <= X"00000000";
			Debug   <= X"00000000";
-----------------(0a)OR: OR--------------------------------------------
		elsif Control = "001010" then
			Result1 <= Operand1 or Operand2;
			Result2 <= X"00000000";
			Debug   <= X"00000000";
-----------------(0c)NOR: Not OR---------------------------------------
		elsif Control = "001100" then
			Result1 <= Operand1 nor Operand2;
			Debug   <= X"00000000";
-----------------(0d)SLT: Set Less Than--------------------------------
		elsif Control = "001101" then
			Binv_bool <= '1';
			carry_in <= '1';
			Result1  <= (X"0000000"&'0'&'0'&'0'&sltResult);
			Result2 <= X"00000000";
			Debug   <= X"00000000";
-----------------(11)BEQ: Branch On Equal------------------------------
		elsif Control = "010001" then
			Result1 <= X"00000000";
			Result2 <= X"00000000";
			if(Operand1=Operand2) then
				Debug    <= (X"0000000"&'0'&'0'&'1'&'0');
			else
				Debug    <= X"00000000";
			end if;
			--Zeroflag = 1 if equal
---------------------Debug---------------------------------------------
---------------------bit 0: Carry flag---------------------------------
---------------------bit 1: Zero flag----------------------------------
---------------------bit 2: Divide by Zero flag------------------------
      end if;
   end if;
end process;


end Behavioral;

