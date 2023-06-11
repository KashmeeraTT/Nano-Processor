----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2023 05:13:37 PM
-- Design Name: 
-- Module Name: Slow_Clk_Sim - Behavioral
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

entity Slow_Clk_Sim is
--  Port ( );
end Slow_Clk_Sim;

architecture Behavioral of Slow_Clk_Sim is

  signal Clk_in : std_logic := '0';
  signal Clk_out : std_logic;

  component Slow_Clk
  port (
      Clk_in : in STD_LOGIC;
      Clk_out: out STD_LOGIC);
  end component;

begin
UUT : Slow_Clk
    port map (
        Clk_in => Clk_in,
        Clk_out => Clk_out
    );

    Clk_in_process: process
    begin
        Clk_in <= NOT(Clk_in);
        wait for 10 ns;
        
    end process Clk_in_process;


end Behavioral;
