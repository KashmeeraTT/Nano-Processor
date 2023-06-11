----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 05:23:08 PM
-- Design Name: 
-- Module Name: Register_4bit - Behavioral
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

entity Register_4bit is
    Port ( D : in STD_LOGIC_VECTOR(3 downto 0);
           Res : in STD_LOGIC;
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Register_4bit;

architecture Behavioral of Register_4bit is

    component D_FF is
        Port ( D : in STD_LOGIC;
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;

    signal Q_internal : STD_LOGIC_VECTOR(3 downto 0);
    signal Qbar_internal : STD_LOGIC_VECTOR(3 downto 0);
    signal D_internal : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Instantiate the D flip-flops for each bit of the register
    FF_0: D_FF
        port map (
            D => D_internal(0),  -- Connect D_internal instead of D
            Res => Res,
            Clk => Clk,
            Q => Q_internal(0)
        );
    FF_1: D_FF
        port map (
            D => D_internal(1),  -- Connect D_internal instead of D
            Res => Res,
            Clk => Clk,
            Q => Q_internal(1)
        );
    FF_2: D_FF
        port map (
            D => D_internal(2),  -- Connect D_internal instead of D
            Res => Res,
            Clk => Clk,
            Q => Q_internal(2)
        );
    FF_3: D_FF
        port map (
            D => D_internal(3),  -- Connect D_internal instead of D
            Res => Res,
            Clk => Clk,
            Q => Q_internal(3)
        );

    -- Assign the internal signals to the output ports
    Q <= Q_internal;

    process (D, En, Q_internal)
    begin
        if En = '1' then
            D_internal <= D;  -- Update D_internal only when En is high
        else
            D_internal <= Q_internal;
        end if;
    end process;

end Behavioral;

