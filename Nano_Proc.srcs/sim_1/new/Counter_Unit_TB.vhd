----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 10:47:14 PM
-- Design Name: 
-- Module Name: Counter_Unit_TB - Behavioral
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

entity Counter_Unit_TB is
--  Port ( );
end Counter_Unit_TB;

architecture Behavioral of Counter_Unit_TB is

  component ProgramCounter_Unit
    Port (
      Jump_flag : in STD_LOGIC;
      Reset : in STD_LOGIC;
      Clk : in STD_LOGIC;
      Jump_Addr : in STD_LOGIC_VECTOR (2 downto 0);
      Count_in : in STD_LOGIC_VECTOR (2 downto 0);
      Count_out : out STD_LOGIC_VECTOR (2 downto 0)
    );
  end component;

  signal Jump_flag, Reset, Clk : STD_LOGIC;
  signal Jump_Addr, Count_in, Count_out : STD_LOGIC_VECTOR (2 downto 0);

begin

  UUT : ProgramCounter_Unit
    port map(
      Jump_flag => Jump_flag,
      Reset => Reset,
      Clk => Clk,
      Jump_Addr => Jump_Addr,
      Count_in => Count_in,
      Count_out => Count_out
    );
  
  -- Clock process
  process
  begin
    Clk <= '0';
    wait for 10 ns;
    Clk <= '1';
    wait for 10 ns;
  end process;
  
  
  -- Test stimuli process
  process
  begin
    Jump_flag <= '0';
    Reset <= '0';
    Jump_Addr <= "111";
   
    wait for 20 ns;
    Count_in <= "000";
    wait for 20 ns;
    Count_in <= Count_out;
    wait for 20 ns;
    Count_in <= Count_out;
    wait for 20 ns;
    Count_in <= Count_out;
    wait for 20 ns;

    Count_in <= Count_out;

    wait for 20 ns;
    Count_in <= Count_out;
    wait for 20 ns;
    Count_in <= Count_out;
    wait for 20 ns;
    Count_in <= Count_out;
    wait for 20 ns;
    Jump_flag <= '1';
    Jump_Addr <= "100";
    wait for 20 ns;
    Count_in <= Count_out;
    wait for 20 ns;
    Jump_flag <= '0';
    wait for 20 ns;
    Count_in <= Count_out;
    wait for 20 ns;
    Count_in <= Count_out;
    wait for 20 ns;
    Reset <= '1';
    wait for 40 ns;
    Reset <= '0';
    Count_in <= Count_out;
    wait for 20 ns;
    Count_in <= Count_out;
    wait for 20 ns;
    Count_in <= Count_out;
    wait for 20 ns;
    Count_in <= Count_out;
    wait for 20 ns;
    Reset <= '1';
    wait for 40 ns;
    Reset <= '0';
    Count_in <= Count_out;
    wait for 20 ns;
    Count_in <= Count_out;
    wait for 20 ns;
    Count_in <= Count_out;
    wait for 20 ns;
    Count_in <= Count_out;
    wait for 20 ns;
    Count_in <= Count_out;
    wait for 20 ns;
    Count_in <= Count_out;
    wait for 20 ns;
    Count_in <= Count_out;
    wait for 20 ns;
    Count_in <= Count_out;
    wait for 20 ns;
    Count_in <= Count_out;
    wait;
  end process;

end Behavioral;
