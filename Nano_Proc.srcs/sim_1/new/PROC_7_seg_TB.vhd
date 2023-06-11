----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 08:18:42 AM
-- Design Name: 
-- Module Name: PROC_7_seg_TB - Behavioral
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

entity PROC_7_seg_TB is
--  Port ( );
end PROC_7_seg_TB;

architecture Behavioral of PROC_7_seg_TB is

component PROC_7_seg
    Port (
    Clk, Reset : in STD_LOGIC;
    S_LED : out STD_LOGIC_VECTOR (3 downto 0);
    Zero : out STD_LOGIC;
    Clk_LED : out STD_LOGIC;
    Overflow : out STD_LOGIC;
    S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
    Anode : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

signal Reset, Zero, Overflow, Clk_LED : STD_LOGIC;
signal S_LED, Anode : STD_LOGIC_VECTOR (3 downto 0);
signal S_7Seg : STD_LOGIC_VECTOR (6 downto 0);
signal Clk : STD_LOGIC := '1';

begin

UUT : PROC_7_seg
    PORT MAP (
        Clk => Clk, 
        Clk_LED => Clk_LED,
        Reset => Reset,
        S_LED => S_LED,
        Overflow => Overflow,
        Zero => Zero,
        S_7Seg => S_7Seg,
        Anode => Anode
        );

    process
        begin
            Clk <= NOT(Clk);
            wait for 2ns;
    end process ;
    
    process
        begin
        Reset <= '1';
        wait for 20ns;
        Reset <= '0';
        wait;
    end process; 
end Behavioral;
