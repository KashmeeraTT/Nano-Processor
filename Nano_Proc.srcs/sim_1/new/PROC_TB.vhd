----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 10:26:36 PM
-- Design Name: 
-- Module Name: PROC_TB - Behavioral
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

entity PROC_TB is
--  Port ( );
end PROC_TB;

architecture Behavioral of PROC_TB is

component NANO_PROC
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Clk_LED : out STD_LOGIC;
           LEDs : out STD_LOGIC_VECTOR(3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC );
end component; 

signal Reset, Clk, Overflow, Zero, c_led : STD_LOGIC;
signal LEDs : STD_LOGIC_VECTOR(3 downto 0);

begin

UUT : NANO_PROC
    Port map ( 
        Reset => Reset,
        Clk => Clk,
        Clk_LED => c_led,
        LEDs => LEDs,
        Overflow => Overflow,
        Zero => Zero 
    );
    
-- Clock process
      process
      begin
        Clk <= '0';
        wait for 2 ns;
        Clk <= '1';
        wait for 2 ns;
      end process;
      
      
process
        begin
        Reset <= '1';
        wait for 20 ns;
        Reset <= '0';
        wait;
end process;

end Behavioral;
