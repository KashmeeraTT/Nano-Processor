----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 10:34:58 AM
-- Design Name: 
-- Module Name: ADD_SUB_unit - Behavioral
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

entity ADD_SUB_unit is
    Port (
        Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 : in STD_LOGIC_VECTOR(3 downto 0);
        RegA_sel, RegB_sel : in STD_LOGIC_VECTOR(2 downto 0);
        AddSub_sel : in STD_LOGIC;
        overflow : out STD_LOGIC;
        Data : out STD_LOGIC_VECTOR(3 downto 0);
        zero : out STD_LOGIC;
        jump : out STD_LOGIC
    );
end ADD_SUB_unit;

architecture Behavioral of ADD_SUB_unit is

    component MUX_8Way_4Bit
        port (
            Sel : in STD_LOGIC_VECTOR(2 downto 0);
            D0, D1, D2, D3, D4, D5, D6, D7 : in STD_LOGIC_VECTOR(3 downto 0);
            Y : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component RCAS_4
        port (
            A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            C_in : in STD_LOGIC;
            S : out STD_LOGIC_VECTOR (3 downto 0);
            C_out : out STD_LOGIC
        );
    end component;

    signal dataA, dataB, data_out : STD_LOGIC_VECTOR(3 downto 0);
    signal jump_reg, zero_reg : STD_LOGIC;

begin

    Mux_0 : MUX_8Way_4Bit
        PORT MAP (
            Sel => RegA_sel,
            D0 => Q0,
            D1 => Q1,
            D2 => Q2,
            D3 => Q3,
            D4 => Q4,
            D5 => Q5,
            D6 => Q6,
            D7 => Q7,
            Y => dataA
        );
        
    Mux_1 : MUX_8Way_4Bit
        PORT MAP (
            Sel => RegB_sel,
            D0 => Q0,
            D1 => Q1,
            D2 => Q2,
            D3 => Q3,
            D4 => Q4,
            D5 => Q5,
            D6 => Q6,
            D7 => Q7,
            Y => dataB
        );
        
    RCAS : RCAS_4
        PORT MAP (
            A => dataA,
            B => dataB,
            C_in => AddSub_sel,
            S => data_out,
            C_out => overflow
        );


    process (data_out)
    begin
        if data_out = "0000" then
            zero_reg <= '1';
        else
            zero_reg <= '0';
        end if;
    end process;

    process (dataA)
    begin
        if dataA = "0000" then
            jump_reg <= '1';
        else
            jump_reg <= '0';
        end if;
    end process;

    process (data_out, jump_reg, zero_reg)
    begin
        Data <= data_out;
        jump <= jump_reg;
        zero <= zero_reg;
    end process;

end Behavioral;
