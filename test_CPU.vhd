--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:32:56 10/29/2013
-- Design Name:   
-- Module Name:   C:/Users/Jia Rong/Documents/Xilinx/LAB3/test_CPU.vhd
-- Project Name:  LAB3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CPU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_CPU IS
END test_CPU;
 
ARCHITECTURE behavior OF test_CPU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CPU
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         test_PC : OUT  std_logic_vector(15 downto 0);
         test_Instr : OUT  std_logic_vector(31 downto 0);
         test_ALUOp : OUT  std_logic_vector(5 downto 0);
         test_Read_Data_1 : OUT  std_logic_vector(31 downto 0);
         test_Read_Data_2 : OUT  std_logic_vector(31 downto 0);
         test_Result1 : OUT  std_logic_vector(31 downto 0);
         test_DM_Read_Data : OUT  std_logic_vector(31 downto 0);
         test_RF_Write_Data : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal test_PC : std_logic_vector(15 downto 0);
   signal test_Instr : std_logic_vector(31 downto 0);
   signal test_ALUOp : std_logic_vector(5 downto 0);
   signal test_Read_Data_1 : std_logic_vector(31 downto 0);
   signal test_Read_Data_2 : std_logic_vector(31 downto 0);
   signal test_Result1 : std_logic_vector(31 downto 0);
   signal test_DM_Read_Data : std_logic_vector(31 downto 0);
   signal test_RF_Write_Data : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CPU PORT MAP (
          Clk => Clk,
          Reset => Reset,
          test_PC => test_PC,
          test_Instr => test_Instr,
          test_ALUOp => test_ALUOp,
          test_Read_Data_1 => test_Read_Data_1,
          test_Read_Data_2 => test_Read_Data_2,
          test_Result1 => test_Result1,
          test_DM_Read_Data => test_DM_Read_Data,
          test_RF_Write_Data => test_RF_Write_Data
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
--
--      wait for Clk_period*10;

      -- insert stimulus here 
		Reset <= '1';
		wait for 50ns;
		Reset <= '0';
		wait for 50ns;

      wait;
   end process;

END;
