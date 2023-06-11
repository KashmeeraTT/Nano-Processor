----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 05:56:52 PM
-- Design Name: 
-- Module Name: RegisterBank_4bit - Behavioral
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

entity RegisterBank_4bit is
    Port (
        D : in STD_LOGIC_VECTOR(3 downto 0);
        Data : in STD_LOGIC_VECTOR(3 downto 0);
        Addr : in STD_LOGIC_VECTOR(2 downto 0);
        Reset, En_R7 : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 : out STD_LOGIC_VECTOR(3 downto 0)
    );
end RegisterBank_4bit;

architecture Behavioral of RegisterBank_4bit is


    component Decoder_3_to_8 
        Port (
            I : in STD_LOGIC_VECTOR(2 downto 0);
            EN : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component Register_4bit 
        Port (
            D : in STD_LOGIC_VECTOR(3 downto 0);
            Res : in STD_LOGIC;
            En : in STD_LOGIC;
            Clk : in STD_LOGIC;
            Q : out STD_LOGIC_VECTOR(3 downto 0)
        );
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
        
    -- Instantiate the Register_4bit for each address
    Register_0: Register_4bit
        port map (
            D => "0000",
            Res => '0',
            En => '1',
            Clk => Clk,
            Q => Q0
        );
    Register_1: Register_4bit
        port map (
            D => D,
            Res => Reset,
            En => decoder_output(1),
            Clk => Clk,
            Q => Q1
        );
    Register_2: Register_4bit
        port map (
            D => D,
            Res => Reset,
            En => decoder_output(2),
            Clk => Clk,
            Q => Q2
        );
    Register_3: Register_4bit
        port map (
            D => D,
            Res => Reset,
            En => decoder_output(3),
            Clk => Clk,
            Q => Q3
        );  
    Register_4: Register_4bit
        port map (
            D => D,
            Res => Reset,
            En => decoder_output(4),
            Clk => Clk,
            Q => Q4
        );
    Register_5: Register_4bit
        port map (
            D => D,
            Res => Reset,
            En => decoder_output(5),
            Clk => Clk,
            Q => Q5
        );
    Register_6: Register_4bit
        port map (
            D => D,
            Res => Reset,
            En => decoder_output(6),
            Clk => Clk,
            Q => Q6
        );
    Register_7: Register_4bit
        port map (
            D => Data,
            Res => Reset,
            En => En_R7,
            Clk => Clk,
            Q => Q7
        );                
               
                
end Behavioral;