----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/25/2023 09:00:18 PM
-- Design Name: 
-- Module Name: NANO_PROC - Behavioral
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

entity NANO_PROC is
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Clk_LED : out STD_LOGIC;
           LEDs : out STD_LOGIC_VECTOR(3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC );
end NANO_PROC;

architecture Behavioral of NANO_PROC is

component RegisterBank_4bit
    Port (
        D : in STD_LOGIC_VECTOR(3 downto 0);
        Data : in STD_LOGIC_VECTOR(3 downto 0);
        Addr : in STD_LOGIC_VECTOR(2 downto 0);
        Reset, En_R7 : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 : out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

    component D_FF is
        Port ( D : in STD_LOGIC;
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;
    
    signal D_internal : STD_LOGIC_VECTOR(1 downto 0);
    signal Q_internal : STD_LOGIC_VECTOR(1 downto 0);

component ADD_SUB_unit
    Port ( 
           Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7 : in STD_LOGIC_VECTOR(3 downto 0);
           RegA_sel, RegB_sel : in STD_LOGIC_VECTOR(2 downto 0);
           AddSub_sel : in STD_LOGIC;
           overflow : out STD_LOGIC;
           Data : out STD_LOGIC_VECTOR(3 downto 0);
           zero : out STD_LOGIC;
           jump : out STD_LOGIC
     );
end component;


component Instruction_Decoder
    Port ( instruction : in STD_LOGIC_VECTOR(11 downto 0);
           jump_check, Clk : in STD_LOGIC;
           Reg_sel_A : out STD_LOGIC_VECTOR(2 downto 0);
           Reg_sel_B : out STD_LOGIC_VECTOR(2 downto 0);
           jump_flag : out STD_LOGIC;
           jump_Addr : out STD_LOGIC_VECTOR(2 downto 0);
           add_sub_sel : out STD_LOGIC;
           im_val : out STD_LOGIC_VECTOR(3 downto 0);
           load_sel , En_R7: out STD_LOGIC;
           Reg_En : out STD_LOGIC_VECTOR(2 downto 0)
     );
end component;

component ProgramCounter_Unit
    Port ( Jump_flag : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Jump_Addr : in STD_LOGIC_VECTOR (2 downto 0);
           Count_in : in STD_LOGIC_VECTOR (2 downto 0);
           Count_out : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component ROM
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component MUX_2Way_4Bit
    Port ( 
        Sel : in STD_LOGIC;
        D0, D1 : in STD_LOGIC_VECTOR(3 downto 0);
        Y : out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;     


signal jump_flag, add_sub, jump_c, l_sel, d_state, s_clk, en_r7, zero_0, overflow_1 : STD_LOGIC;
signal count_out, jump_addr, reg_en, regA, regB : STD_LOGIC_VECTOR (2 downto 0);
signal rom_data : STD_LOGIC_VECTOR (11 downto 0);
signal q0, q1, q2, q3, q4, q5, q6, q7, d0, d1, y, q_data : STD_LOGIC_VECTOR (3 downto 0);

begin

Slow_Clk_0 : Slow_Clk
    PORT MAP(
        Clk_in => Clk,
        Clk_out => s_clk
        );


    FF_overflow: D_FF
        port map (
            D => D_internal(1),  
            Res => Reset,
            Clk => s_clk,
            Q => Q_internal(1)
        );
    FF_zero: D_FF
        port map (
            D => D_internal(0),  
            Res => Reset,
            Clk => s_clk,
            Q => Q_internal(0)
        );

    
ROM_0 : ROM
    PORT MAP( 
        address => count_out,
        data => rom_data
    );
    
Counter_0 : ProgramCounter_Unit
    PORT MAP(
        Jump_flag => jump_flag,
        Reset => Reset,
        Clk => s_clk,
        Jump_Addr => jump_addr,
        Count_in => count_out,
        Count_out => count_out
    );

RegisterBank_0 : RegisterBank_4bit
    PORT MAP(
        D => y,
        Data => d0,
        Addr => reg_en,
        En_R7 => en_r7,
        Reset => Reset,
        Clk => s_clk,
        Q0 => q0,
        Q1 => q1, 
        Q2 => q2,
        Q3 => q3,
        Q4 => q4,
        Q5 => q5,
        Q6 => q6,
        Q7 => q7
    );
    


MUX_2_0 : MUX_2Way_4Bit
    PORT MAP(
        Sel => l_sel,
        D0 => d0, 
        D1 => d1,
        Y => y
    );

ADD_SUB_unit_0 : ADD_SUB_unit
    PORT MAP( 
        Q0 => q0,
        Q1 => q1, 
        Q2 => q2,
        Q3 => q3,
        Q4 => q4,
        Q5 => q5,
        Q6 => q6,
        Q7 => q7,
        RegA_sel => regA, 
        RegB_sel => regB,
        AddSub_sel => add_sub,
        overflow => overflow_1,
        Data => d0,
        zero => zero_0,
        jump => jump_c
    );


Instruction_Decoder_0 : Instruction_Decoder
    PORT MAP(
        instruction => rom_data,
        jump_check => jump_c,
        Clk => Clk,
        Reg_sel_A => regA,
        Reg_sel_B => regB, 
        jump_flag => jump_flag,
        jump_Addr => jump_addr,
        add_sub_sel => add_sub,
        im_val => d1,
        load_sel => l_sel,
        En_R7 => en_r7,
        Reg_En => reg_en
    );                    

Zero <= Q_internal(0);
Overflow <= Q_internal(1);
LEds <= q7;
Clk_LED <= s_clk;

process (en_r7, Clk, zero_0, overflow_1, Q_internal)
    begin
        if en_r7 = '1' then
            D_internal(0) <= zero_0;
            D_internal(1) <= overflow_1;
              
        else
            D_internal(0) <= Q_internal(0);
            D_internal(1) <= Q_internal(1);
        end if;
    end process;

end Behavioral;
