----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:17:03 10/28/2013 
-- Design Name: 
-- Module Name:    CPU - Behavioral 
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

entity CPU is
	port(Clk : in std_logic;
			Reset : in std_logic;
			test_PC : out std_logic_vector(15 downto 0);
			test_Instr : out std_logic_vector(31 downto 0);
			test_ALUOp : out std_logic_vector(5 downto 0);
			test_Read_Data_1 : out std_logic_vector(31 downto 0);
			test_Read_Data_2 : out std_logic_vector(31 downto 0);
			test_Result1 : out std_logic_vector(31 downto 0);
			test_DM_Read_Data : out std_logic_vector(31 downto 0);
			test_RF_Write_Data : out std_logic_vector(31 downto 0));
end CPU;

architecture Behavioral of CPU is

component Program_Counter
	port (Clk : in	std_logic;
			Reset : in std_logic;
			Cur_Addr : out std_logic_vector(15 downto 0));
end component;

component Instruction_Memory
	port (Read_Address : in std_logic_vector(15 downto 0);
			Instr : out std_logic_vector(31 downto 0));
end component;

component Register_File
	port (Read_Addr_1 : in std_logic_vector(4 downto 0);
			Read_Addr_2 : in std_logic_vector(4 downto 0);
			RegDst_Out : in std_logic_vector(4 downto 0);
			Write_Data : in std_logic_vector(31 downto 0);
			RegWrite : in std_logic;
			Read_Data_1 : out std_logic_vector(31 downto 0);
			Read_Data_2 : out std_logic_vector(31 downto 0));
end component;

component Control_Unit
	port (Instr : in std_logic_vector(5 downto 0);
			ALUOp : out std_logic_vector(5 downto 0);
			Branch : out std_logic;
			MemRead : out std_logic;
			MemtoReg_Ctrl : out std_logic;
			MemWrite : out std_logic;
			ALUSrcCtrl : out std_logic;
			RegWrite : out std_logic;
			RegDst_Ctrl : out std_logic);
end component;

component Sign_Extend
	port (Instr_15to0 : in std_logic_vector(15 downto 0);
			Sign_Extend_Out : out std_logic_vector(31 downto 0));
end component;

component RegDst
	port (Instr_20to16 : in std_logic_vector(4 downto 0);
			Instr_15to11 :	in std_logic_vector(4 downto 0);
			RegDst_Ctrl : in std_logic;
			RegDst_Out : out std_logic_vector(4 downto 0));
end component;

component ALUSrc
	port (Read_Data_2 : in std_logic_vector(31 downto 0);
			Sign_Extend_Out :	in std_logic_vector(31 downto 0);
			ALUSrc_Ctrl : in std_logic;
			ALUSrc_Out : out std_logic_vector(31 downto 0));
end component;

component ALU_Control
	port (ALUOp : in std_logic_vector(5 downto 0);
			Instr_5to0 : in std_logic_vector(5 downto 0);
			ALU_Control_Out : out std_logic_vector(5 downto 0));
end component;

component ALU
	port (Clk			: in	STD_LOGIC;
		Control		: in	STD_LOGIC_VECTOR (5 downto 0);
		Operand1	: in	STD_LOGIC_VECTOR (31 downto 0);
		Operand2	: in	STD_LOGIC_VECTOR (31 downto 0);
		Result1		: out	STD_LOGIC_VECTOR (31 downto 0);
		Result2		: out	STD_LOGIC_VECTOR (31 downto 0);
		Debug		: out	STD_LOGIC_VECTOR (31 downto 0));
end component;

component Data_Memory
	port (Address : in std_logic_vector(31 downto 0);
			Write_Data : in std_logic_vector(31 downto 0);
			MemRead: in std_logic;
			MemWrite: in std_logic;
			Read_Data : out std_logic_vector(31 downto 0));
end component;

component MemtoReg
	port (Read_Data : in std_logic_vector(31 downto 0);
			Result1 :	in std_logic_vector(31 downto 0);
			MemtoReg_Ctrl : in std_logic;
			MemtoReg_Out : out std_logic_vector(31 downto 0));
end component;

signal Instr, RF_Read_Data_1, RF_Read_Data_2, Sign_Extend_Out, ALUSrc_Out, Result1, Result2, Debug, DM_Read_Data, MemtoReg_Out : std_logic_vector(31 downto 0);
signal Cur_Addr : std_logic_vector(15 downto 0);
signal ALUOp, ALU_Control_Out : std_logic_vector(5 downto 0);
signal RegDst_Out : std_logic_vector(4 downto 0);
signal Branch, MemRead, MemtoReg_Ctrl, MemWrite, ALUSrcCtrl, RegWrite, RegDst_Ctrl, ALUSrc_Ctrl : std_logic;

begin

	Program_Counter_1 : Program_Counter						port map(Clk, Reset, Cur_Addr);
	Instruction_Memory_1 :  Instruction_Memory       	port map(Cur_Addr, Instr);
	Control_Unit_1 : Control_Unit								port map(Instr(31 downto 26), ALUOp, Branch, MemRead, MemtoReg_Ctrl, MemWrite, ALUSrcCtrl, RegWrite, RegDst_Ctrl);
	RegDst_1 : RegDst												port map(Instr(20 downto 16), Instr(15 downto 11), RegDst_Ctrl, RegDst_Out);
	Register_File_1 : Register_File 							port map(Instr(25 downto 21), Instr(20 downto 16), RegDst_Out, MemtoReg_Out, RegWrite, RF_Read_Data_1, RF_Read_Data_2);
	ALUSrc_1 : ALUSrc												port map(RF_Read_Data_2, Sign_Extend_Out, ALUSrc_Ctrl, ALUSrc_Out);
	Sign_Extend_1 : Sign_Extend								port map(Instr(15 downto 0), Sign_Extend_Out);
	ALU_Control_1 : ALU_Control								port map(ALUOp, Instr(5 downto 0), ALU_Control_Out);
	ALU_1 : ALU														port map(Clk, ALU_Control_Out, RF_Read_Data_1, ALUSrc_Out, Result1, Result2, Debug);
	Data_Memory_1 : Data_Memory								port map(Result1, RF_Read_Data_2, MemRead, MemWrite, DM_Read_Data);
	MemtoReg_1 : MemtoReg										port map(DM_Read_Data, Result1, MemtoReg_Ctrl, MemtoReg_Out);

	test_PC <= Cur_Addr;
	test_Instr <= Instr;
	test_ALUOp <= ALUOp;
	test_Read_Data_1 <= RF_Read_Data_1;
	test_Read_Data_2 <= RF_Read_Data_2;
	test_Result1 <= Result1;
	test_DM_Read_Data <= DM_Read_Data;
	test_RF_Write_Data <= MemtoReg_Out;
	
end Behavioral;

