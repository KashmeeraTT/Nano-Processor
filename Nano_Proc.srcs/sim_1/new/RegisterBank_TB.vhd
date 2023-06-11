----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 06:19:51 PM
-- Design Name: 
-- Module Name: RegisterBank_TB - Behavioral
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

entity RegisterBank_TB is
--  Port ( );
end RegisterBank_TB;

architecture Behavioral of RegisterBank_TB is

    -- Component declaration
    component RegisterBank_4bit is
        Port (
            D : in STD_LOGIC_VECTOR(3 downto 0);
            Data : in STD_LOGIC_VECTOR(3 downto 0);
            Addr : in STD_LOGIC_VECTOR(2 downto 0);
            Reset, En_R7 : in STD_LOGIC;
            Clk : in STD_LOGIC;
            Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    -- Inputs
    signal D : STD_LOGIC_VECTOR(3 downto 0);
    signal Data : STD_LOGIC_VECTOR(3 downto 0);
    signal Addr : STD_LOGIC_VECTOR(2 downto 0);
    signal Reset, En_R7, Clk : STD_LOGIC;

    -- Outputs
    signal Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 : STD_LOGIC_VECTOR(3 downto 0);
    
    
begin

UUT : RegisterBank_4bit
    PORT MAP (
    D => D,
    Data => Data,
    Addr => Addr,
    Reset => Reset,
    En_R7 => En_R7,
    Clk => Clk,
    Q0 => Q0,
    Q1 => Q1,
    Q2 => Q2,
    Q3 => Q3,
    Q4 => Q4,
    Q5 => Q5,
    Q6 => Q6,
    Q7 => Q7
    );
    

 -- Clock process
        process
        begin
            Clk <= '0';
            wait for 10 ns;
            Clk <= '1';
            wait for 10 ns;
        end process;
    
        -- Stimulus process
        process
        begin
            
            En_R7 <= '1';
            -- Initialize inputs
            Reset <= '1';
    
            -- Apply inputs
            wait for 100 ns;
            Reset <= '0';
            D <= "0111";
            Data <= "0110";
            wait for 100 ns;
            Addr <= "001";
            wait for 110 ns;
            D <= "0101";
            wait for 100 ns;
            Addr <= "011";
            wait for 100 ns;
            Reset <= '1';
        wait;
        end process;

end Behavioral;
