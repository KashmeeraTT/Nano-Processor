----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 06:33:54 PM
-- Design Name: 
-- Module Name: RCA3_TB - Behavioral
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

entity RCA3_TB is
--  Port ( );
end RCA3_TB;

architecture Behavioral of RCA3_TB is

component RCA_3 
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);
end component;

signal A, B, S : STD_LOGIC_VECTOR (2 downto 0);
signal C_in, C_out : STD_LOGIC;

begin

UUT : RCA_3 
    PORT MAP(
        A => A,
        B => B,
        C_in => C_in,
        S => S, 
        C_out => C_out
    );

process
begin
    
    C_in <= '0';
    A <= "011";
    B <= "110";
    wait for 100ns;
    A <= "010";
    B <= "010";
    wait for 100ns;    
    A <= "011";
    B <= "110";
    wait for 100ns;
    A <= "000";
    B <= "000";
    wait for 100ns;
    C_in <= '1';
    A <= "011";
    B <= "110";
    wait;
end process;
end Behavioral;
