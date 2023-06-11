----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2023 05:41:07 PM
-- Design Name: 
-- Module Name: Program_Counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_Counter is
    Port ( Reset : in STD_LOGIC;
           Clock : in STD_LOGIC;
           pc_next : in STD_LOGIC_VECTOR (2 downto 0);
           Count : out STD_LOGIC_VECTOR (2 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is

    signal pc_out : STD_LOGIC_VECTOR (2 downto 0);
    signal pc_internal : STD_LOGIC_VECTOR (2 downto 0);
    
    
    component D_FF is
        Port ( D : in STD_LOGIC;
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;

    
    
    
begin

    -- Instantiate the D flip-flops
    FF0: D_FF port map (
        D => pc_internal(0),
        Res => Reset,
        Clk => Clock,
        Q => pc_out(0)
    );
    
    FF1: D_FF port map (
        D => pc_internal(1),
        Res => Reset,
        Clk => Clock,
        Q => pc_out(1)
    );
    
    FF2: D_FF port map (
        D => pc_internal(2),
        Res => Reset,
        Clk => Clock,
        Q => pc_out(2)
    );



    -- Process for updating the program counter value
process (Reset, pc_next)
    begin
      if Reset = '1' then
        pc_internal <= "000";
      else
        pc_internal <= pc_next;
      end if;
    end process;



    -- Output the program counter value
    Count <= pc_out;

end Behavioral;