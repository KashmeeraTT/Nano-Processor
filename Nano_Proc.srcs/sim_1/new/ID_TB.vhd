----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 08:31:30 AM
-- Design Name: 
-- Module Name: ID_TB - Behavioral
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

entity Instruction_Decorder_TB is
--  Port ( );   
end Instruction_Decorder_TB;

architecture Behavioral of Instruction_Decorder_TB is

    component Instruction_Decoder is
        Port (
            instruction        : in  STD_LOGIC_VECTOR(11 downto 0);
            jump_check         : in  STD_LOGIC;
            Clk                : in  STD_LOGIC;
            Reg_sel_A          : out STD_LOGIC_VECTOR(2 downto 0);
            Reg_sel_B          : out STD_LOGIC_VECTOR(2 downto 0);
            jump_flag          : out STD_LOGIC;
            jump_Addr          : out STD_LOGIC_VECTOR(2 downto 0);
            add_sub_sel        : out STD_LOGIC;
            im_val             : out STD_LOGIC_VECTOR(3 downto 0);
            load_sel           : out STD_LOGIC;
            En_R7              : out STD_LOGIC;
            Reg_En             : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;


    signal instruction        : STD_LOGIC_VECTOR(11 downto 0);
    signal jump_check         : STD_LOGIC;
    signal Clk                : STD_LOGIC;
    signal Reg_sel_A          : STD_LOGIC_VECTOR(2 downto 0);
    signal Reg_sel_B          : STD_LOGIC_VECTOR(2 downto 0);
    signal jump_flag          : STD_LOGIC;
    signal jump_Addr          : STD_LOGIC_VECTOR(2 downto 0);
    signal add_sub_sel        : STD_LOGIC;
    signal im_val             : STD_LOGIC_VECTOR(3 downto 0);
    signal load_sel           : STD_LOGIC;
    signal En_R7              : STD_LOGIC;
    signal Reg_En             : STD_LOGIC_VECTOR(2 downto 0);

begin

    uut: Instruction_Decoder
        port map (
            instruction        => instruction,
            jump_check         => jump_check,
            Clk                => Clk,
            Reg_sel_A          => Reg_sel_A,
            Reg_sel_B          => Reg_sel_B,
            jump_flag          => jump_flag,
            jump_Addr          => jump_Addr,
            add_sub_sel        => add_sub_sel,
            im_val             => im_val,
            load_sel           => load_sel,
            En_R7              => En_R7,
            Reg_En             => Reg_En
        );

    process
    begin
        Clk <= '0';
        wait for 10 ns;
        Clk <= '1';
        wait for 10 ns;
    end process;
   
  process
  begin
    instruction <= "100010001010";
    wait for 50 ns;
    instruction <= "100100000001";
    wait for 50 ns;
    instruction <= "010100000000";
    wait for 50 ns;
    instruction <= "000010100000";
    wait for 50 ns;
    jump_check <= '1';
    instruction <= "110010000111";
    wait for 50 ns;
    instruction <= "110000000011";
    wait for 50 ns;
  wait;
end process;

end Behavioral;
