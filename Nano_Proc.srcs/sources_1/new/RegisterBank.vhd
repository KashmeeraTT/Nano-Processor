----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 04:36:34 PM
-- Design Name: 
-- Module Name: RegisterBank - Behavioral
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

entity RegisterBank is
    Port (
        D : in STD_LOGIC_VECTOR(3 downto 0);
        Addr : in STD_LOGIC_VECTOR(2 downto 0);
        Reset : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR(3 downto 0)
    );
end RegisterBank;

architecture Behavioral of RegisterBank is

component Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR(2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR(7 downto 0));
end component;

component Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

    signal decoder_output : STD_LOGIC_VECTOR(7 downto 0);

begin

    -- Instantiate the 3-to-8 decoder
    Decoder: Decoder_3_to_8
        port map (
            I => Addr,
            EN => '1',
            Y => decoder_output
        );
        
    -- Instantiate the Registers
    Reg_0: Reg
        PORT MAP(
            D => D,
            En => decoder_output(0),
            Clk => Clk,
            Q => Q
        );       
    Reg_1: Reg
        PORT MAP(
            D => D,
            En => decoder_output(1),
            Clk => Clk,
            Q => Q
        );     
    Reg_2: Reg
        PORT MAP(
            D => D,
            En => decoder_output(2),
            Clk => Clk,
            Q => Q
        );
    Reg_3: Reg
        PORT MAP(
            D => D,
            En => decoder_output(3),
            Clk => Clk,
            Q => Q
        );   
    Reg_4: Reg
        PORT MAP(
            D => D,
            En => decoder_output(4),
            Clk => Clk,
            Q => Q
        );     
    Reg_5: Reg
        PORT MAP(
            D => D,
            En => decoder_output(5),
            Clk => Clk,
            Q => Q
        );       
    Reg_6: Reg
        PORT MAP(
            D => D,
            En => decoder_output(6),
            Clk => Clk,
            Q => Q
        );
    Reg_7: Reg
        PORT MAP(
            D => D,
            En => decoder_output(7),
            Clk => Clk,
            Q => Q
        ); 
                
end Behavioral;
