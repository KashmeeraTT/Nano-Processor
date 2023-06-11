----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 03:35:10 PM
-- Design Name: 
-- Module Name: MUX_2Way_4Bit - Behavioral
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

entity MUX_2Way_4Bit is
    Port ( 
        Sel : in STD_LOGIC;
        D0, D1 : in STD_LOGIC_VECTOR(3 downto 0);
        Y : out STD_LOGIC_VECTOR(3 downto 0)
    );
end MUX_2Way_4Bit;

architecture Behavioral of MUX_2Way_4Bit is
begin
    process (Sel, D0, D1)
    begin
        if Sel = '0' then
            Y <= D0;
        else
            Y <= D1;
        end if;
    end process;
end Behavioral;