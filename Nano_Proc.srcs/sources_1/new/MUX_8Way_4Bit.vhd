----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 03:28:48 PM
-- Design Name: 
-- Module Name: MUX_8Way_4Bit - Behavioral
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

entity MUX_8Way_4Bit is
    Port ( 
        Sel : in STD_LOGIC_VECTOR(2 downto 0);
        D0, D1, D2, D3, D4, D5, D6, D7 : in STD_LOGIC_VECTOR(3 downto 0);
        Y : out STD_LOGIC_VECTOR(3 downto 0)
    );
end MUX_8Way_4Bit;

architecture Behavioral of MUX_8Way_4Bit is
begin
    process (Sel, D0, D1, D2, D3, D4, D5, D6, D7) is
    begin
        case Sel is
            when "000" =>
                Y <= D0;
            when "001" =>
                Y <= D1;
            when "010" =>
                Y <= D2;
            when "011" =>
                Y <= D3;
            when "100" =>
                Y <= D4;
            when "101" =>
                Y <= D5;
            when "110" =>
                Y <= D6;
            when "111" =>
                Y <= D7;
            when others =>
                Y <= (others => '0');
        end case;
    end process;
end Behavioral;