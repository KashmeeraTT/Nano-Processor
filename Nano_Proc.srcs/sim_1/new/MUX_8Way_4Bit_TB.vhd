----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 07:56:50 PM
-- Design Name: 
-- Module Name: MUX_8Way_4Bit_TB - Behavioral
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

entity MUX_8Way_4Bit_TB is
--  Port ( );
end MUX_8Way_4Bit_TB;

architecture Behavioral of MUX_8Way_4Bit_TB is

component MUX_8Way_4Bit is
    Port ( 
        Sel : in STD_LOGIC_VECTOR(2 downto 0);
        D0, D1, D2, D3, D4, D5, D6, D7 : in STD_LOGIC_VECTOR(3 downto 0);
        Y : out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

signal Sel : STD_LOGIC_VECTOR(2 downto 0);
signal D0, D1, D2, D3, D4, D5, D6, D7 : STD_LOGIC_VECTOR(3 downto 0);
signal Y : STD_LOGIC_VECTOR(3 downto 0);

begin

    uut: MUX_8Way_4Bit
        port map (
            Sel => Sel,
            D0 => D0,
            D1 => D1,
            D2 => D2,
            D3 => D3,
            D4 => D4,
            D5 => D5,
            D6 => D6,
            D7 => D7,
            Y => Y
        );
        
        
process
begin
        
    D0 <= "0011";
    D1 <= "1011";
    D2 <= "0100";
    D3 <= "0011";
    D4 <= "0011";
    D5 <= "0110";
    D6 <= "0000";
    D7 <= "1001";
    
    Sel <= "000";
    wait for 50 ns;
    Sel <= "001";
    wait for 50 ns;
    Sel <= "010";
    wait for 50 ns;    
    Sel <= "011";
    wait for 50 ns;
    Sel <= "100";
    wait;
    
end process;       
end Behavioral;
