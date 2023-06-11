----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/11/2023 07:17:43 PM
-- Design Name: 
-- Module Name: Decoder_2_to_4_TB - Behavioral
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

entity Decoder_3_to_8_TB is
end Decoder_3_to_8_TB;

architecture Behavioral of Decoder_3_to_8_tb is

    -- Component declaration
    component Decoder_3_to_8 is
        Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
               EN : in STD_LOGIC;
               Y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    -- Inputs
    signal I : STD_LOGIC_VECTOR (2 downto 0);
    signal EN : STD_LOGIC;

    -- Outputs
    signal Y : STD_LOGIC_VECTOR (7 downto 0);

begin

    -- Instantiate the Decoder_3_to_8 module
    uut: Decoder_3_to_8
        port map (
            I => I,
            EN => EN,
            Y => Y
        );


    process
    begin
        EN <= '1';
        I <= "011";
        wait for 50 ns;
        I <= "110";
        wait for 50 ns;
        I <= "010";
        wait for 50 ns;
        I <= "010";
        wait for 50 ns;
        I <= "011";
        wait for 50 ns;
        I <= "110";
        wait;
    end process;

end Behavioral;


