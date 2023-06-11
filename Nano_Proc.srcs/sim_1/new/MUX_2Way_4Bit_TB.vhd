----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 07:46:05 PM
-- Design Name: 
-- Module Name: MUX_2Way_4Bit_TB - Behavioral
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

entity MUX_2Way_4Bit_TB is
--  Port ( );
end MUX_2Way_4Bit_TB;

architecture Behavioral of MUX_2Way_4Bit_tb is

    component MUX_2Way_4Bit is
        Port ( 
            Sel : in STD_LOGIC;
            D0, D1 : in STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;


    signal Sel : STD_LOGIC;
    signal D0, D1 : STD_LOGIC_VECTOR(3 downto 0);
    signal Y : STD_LOGIC_VECTOR(3 downto 0);

begin

    uut: MUX_2Way_4Bit
        port map (
            Sel => Sel,
            D0 => D0,
            D1 => D1,
            Y => Y
        );


    process
    begin
        Sel <= '0';
        D0 <= "0011";
        D1 <= "1011";
        wait for 100 ns;

        Sel <= '1';
        D0 <= "0011";
        D1 <= "1011";
        wait for 100 ns;

        Sel <= '0';
        D0 <= "0100";
        D1 <= "0011";
        wait for 100 ns;

        Sel <= '1';
        D0 <= "0100";
        D1 <= "0011";
        wait for 100 ns;

        wait;
    end process;

end Behavioral;