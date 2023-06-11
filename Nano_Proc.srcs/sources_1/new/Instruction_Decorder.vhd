----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2023 05:02:26 PM
-- Design Name: 
-- Module Name: Slow_Clk - Behavioral
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

entity Instruction_Decoder is
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
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is
begin
    process (Clk)
    begin
        if rising_edge(Clk) then

            -- Decode instruction
            if instruction(11) = '1' and instruction(10) = '0' then
                -- Load operation
                Reg_sel_B          <= (others => '0');
                jump_flag          <= '0';
                jump_Addr          <= (others => '0');
                add_sub_sel        <= '0';
                load_sel <= '1';
                Reg_sel_A <= instruction(9 downto 7);
                im_val    <= instruction(3 downto 0);
                Reg_En    <= instruction(9 downto 7);
            elsif instruction(11) = '0' and instruction(10) = '0' then
                -- Addition or subtraction operation
                jump_flag          <= '0';
                jump_Addr          <= (others => '0');
                im_val             <= (others => '0');
                load_sel           <= '0';
                add_sub_sel <= '0';
                Reg_sel_A   <= instruction(9 downto 7);
                Reg_sel_B   <= instruction(6 downto 4);
                Reg_En      <= instruction(9 downto 7);
            elsif instruction(11) = '0' and instruction(10) = '1' then
                -- Subtraction operation
                jump_flag          <= '0';
                jump_Addr          <= (others => '0');
                Reg_sel_A          <= (others => '0');
                im_val             <= (others => '0');
                load_sel           <= '0';
                add_sub_sel <= '1';
                Reg_sel_B   <= instruction(9 downto 7);
                Reg_En      <= instruction(9 downto 7);
            elsif instruction(11) = '1' and instruction(10) = '1' then
                -- Jump operation
                add_sub_sel        <= '0';
                im_val             <= (others => '0');
                load_sel           <= '0';
                Reg_En             <= (others => '0');
                Reg_sel_B          <= (others => '0');
                Reg_sel_A <= instruction(9 downto 7);
                if jump_check = '1' then
                    jump_flag <= '1';
                    jump_Addr <= instruction(2 downto 0);
                else
                    jump_flag <= '0';
                    jump_Addr <= (others => '0');
                end if;
            end if;

            -- Additional operations
            if instruction(11) = '1' and instruction(10) = '1' then
                En_R7              <= '0';
            else
                En_R7              <= '1';
            end if;
        end if;
    end process;
end Behavioral;
