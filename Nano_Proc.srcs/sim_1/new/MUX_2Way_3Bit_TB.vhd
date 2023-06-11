----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 06:52:02 PM
-- Design Name: 
-- Module Name: MUX_2Way_3Bit_TB - Behavioral
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

entity MUX_2Way_3Bit_TB is
--  Port ( );
end MUX_2Way_3Bit_TB;

architecture Behavioral of MUX_2Way_3Bit_TB is

component MUX_2Way_3Bit
    Port ( 
        Sel : in STD_LOGIC;
        D0, D1 : in STD_LOGIC_VECTOR(2 downto 0);
        Y : out STD_LOGIC_VECTOR(2 downto 0)
    );
end component;

signal D0, D1, Y : STD_LOGIC_VECTOR(2 downto 0);
signal Sel : STD_LOGIC;

begin

UUT : MUX_2Way_3Bit
    PORT MAP(
        Sel => Sel,
        D0 => D0,
        D1 => D1,
        Y => Y
        );

process
begin
    D0 <= "011";
    D1 <= "110";
    
    Sel <= '1';
    wait for 100 ns;
    Sel <= '0';
    wait for 100 ns;
    Sel <= '1';
    wait;
    
end process;
end Behavioral;
