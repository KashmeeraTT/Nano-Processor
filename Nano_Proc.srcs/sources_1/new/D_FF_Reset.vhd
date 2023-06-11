----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 04:19:47 PM
-- Design Name: 
-- Module Name: D_FF_Reset - Behavioral
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

entity D_FF_Reset is
    Port ( D : in STD_LOGIC_VECTOR(3 downto 0);
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(3 downto 0);
           Qbar : out STD_LOGIC_VECTOR(3 downto 0));
end D_FF_Reset;

architecture Behavioral of D_FF_Reset is

begin
    process (Clk)
    begin
        if rising_edge(Clk) then
            if Reset = '1' then
                Q <= (others => '0');
                Qbar <= (others => '1');
            else
                Q <= D;
                Qbar <= not D;
            end if;
        end if;
    end process;

end Behavioral;
