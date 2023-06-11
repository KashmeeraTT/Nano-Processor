----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 09:45:04 PM
-- Design Name: 
-- Module Name: ProgramCounter_Unit - Behavioral
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

entity ProgramCounter_Unit is
    Port ( Jump_flag : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Jump_Addr : in STD_LOGIC_VECTOR (2 downto 0);
           Count_in : in STD_LOGIC_VECTOR (2 downto 0);
           Count_out : out STD_LOGIC_VECTOR (2 downto 0));
end ProgramCounter_Unit;

architecture Behavioral of ProgramCounter_Unit is

component RCA_3
    port ( A : in STD_LOGIC_VECTOR (2 downto 0);
          B : in STD_LOGIC_VECTOR (2 downto 0);
          C_in : in STD_LOGIC;
          S : out STD_LOGIC_VECTOR (2 downto 0);
          C_out : out STD_LOGIC);
end component;

component MUX_2Way_3Bit
    port ( Sel : in STD_LOGIC;
        D0, D1 : in STD_LOGIC_VECTOR(2 downto 0);
        Y : out STD_LOGIC_VECTOR(2 downto 0));
end component;

component Program_Counter
    port ( Reset : in STD_LOGIC;
           Clock : in STD_LOGIC;
           pc_next : in STD_LOGIC_VECTOR (2 downto 0);
           Count : out STD_LOGIC_VECTOR (2 downto 0));
end component;


   
    signal S_out : STD_LOGIC_VECTOR (2 downto 0);
    signal M_count : STD_LOGIC_VECTOR (2 downto 0);

begin


RCA_3_0 : RCA_3
    port map(
        A => Count_in,
        B => "001",
        C_in => '0',
        S => S_out,
        C_out => open
        );
        
MUX_2Way_3Bit_0 : MUX_2Way_3Bit
    port map( 
        Sel => Jump_flag,
        D0 => S_out,
        D1 => Jump_Addr,
        Y => M_count
        );

Program_Counter_0 : Program_Counter
    port map(
        Reset => Reset,
        Clock => Clk,
        pc_next => M_count,
        count => Count_out
        );


end Behavioral;
