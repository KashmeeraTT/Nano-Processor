----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 09:07:58 PM
-- Design Name: 
-- Module Name: PROC_7_seg - Behavioral
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

entity PROC_7_seg is
    Port (
        Clk : in STD_LOGIC;
        Reset : in STD_LOGIC;
        S_LED : out STD_LOGIC_VECTOR (3 downto 0);
        Clk_LED : out STD_LOGIC;
        Zero : out STD_LOGIC;
        Overflow : out STD_LOGIC;
        S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
        Anode : out STD_LOGIC_VECTOR (3 downto 0)
     );
end PROC_7_seg;

architecture Behavioral of PROC_7_seg is

component NANO_PROC
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Clk_LED : out STD_LOGIC;
           LEDs : out STD_LOGIC_VECTOR(3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC );
end component;

component LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal leds : STD_LOGIC_VECTOR(3 downto 0);
signal c_led : STD_LOGIC;

begin

NANO_PROC_0 : NANO_PROC
    PORT MAP (
            Reset => Reset, 
            Clk => Clk,
            Clk_LED => c_led,
            LEDs => leds,
            Overflow => Overflow,
            Zero => Zero
    );

LUT_16_7_0 : LUT_16_7
    PORT MAP (
            address => leds,
            data => S_7Seg
    );

S_LED <= leds;
Anode <= "1110";
Clk_LED <= c_led;


end Behavioral;
