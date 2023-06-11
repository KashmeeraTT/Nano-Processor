----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 11:21:10 AM
-- Design Name: 
-- Module Name: ADDSUB_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADDSUB_TB is
--  Port ( );
end ADDSUB_TB;

architecture Behavioral of ADDSUB_TB is

component ADD_SUB_unit
 Port ( Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 : in STD_LOGIC_VECTOR(3 downto 0);
           RegA_sel, RegB_sel : in STD_LOGIC_VECTOR(2 downto 0);
           AddSub_sel : in STD_LOGIC;
           overflow : out STD_LOGIC;
           Data : out STD_LOGIC_VECTOR(3 downto 0);
           zero : out STD_LOGIC;
           jump : out STD_LOGIC
     );
end component;

signal Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7, Data : STD_LOGIC_VECTOR(3 downto 0);
signal RegA_sel, RegB_sel : STD_LOGIC_VECTOR(2 downto 0);
signal AddSub_sel, overflow, zero, jump : STD_LOGIC;

begin

UUT : ADD_SUB_unit
    PORT MAP ( 
           Q0 => Q0, 
           Q1 => Q1, 
           Q2 => Q2, 
           Q3 => Q3, 
           Q4 => Q4, 
           Q5 => Q5, 
           Q6 => Q6, 
           Q7 => Q7, 
           RegA_sel => RegA_sel, 
           RegB_sel => RegB_sel,
           AddSub_sel => AddSub_sel,
           overflow => overflow,
           Data => Data,
           zero => zero,
           jump => jump);

process
    begin
    
    Q0 <= "0000";
    Q1 <= "0111";
    Q2 <= "0110";
    Q3 <= "0101";
    Q4 <= "0011";
    Q5 <= "0011";
    Q6 <= "0001";
    Q7 <= "1111";
    
    wait for 50 ns;
    RegA_sel <= "000"; 
    RegB_sel <= "010";
    AddSub_sel <= '0';
    wait for 50 ns;
    RegA_sel <= "000"; 
    RegB_sel <= "010";
    AddSub_sel <= '1';
    wait for 50 ns;
    RegA_sel <= "001"; 
    RegB_sel <= "011";
    AddSub_sel <= '0';
    wait for 50 ns;
    RegA_sel <= "110"; 
    RegB_sel <= "111";
    AddSub_sel <= '0';
    wait for 50 ns;
    RegA_sel <= "111"; 
    RegB_sel <= "110";
    AddSub_sel <= '1';
    end
process;
end Behavioral;
