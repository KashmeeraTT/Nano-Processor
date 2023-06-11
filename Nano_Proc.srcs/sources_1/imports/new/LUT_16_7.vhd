----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/03/2023 08:02:34 PM
-- Design Name: 
-- Module Name: LUT_16_7 - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (11 downto 0));
end ROM;

architecture Behavioral of ROM is
type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

 signal processor_ROM : rom_type := (
 "100010001010", -- movi R1,10  ; R1 ? 10
 "100100000001", -- movi R2,1   ; R2 ? 1
 "010100000000", -- neg R2      ; R2 ? -R2
 "000010100000", -- add R1,R2   ; R1 ? R1 + R2
 "110010000111", -- jzr R1,7    ; If R1 = 0 jump to line 7
 "110000000011", -- jzr R0,3    ; If R0 = 0 jump to line 3
 "000000000000", -- add R0,R0   ; R0 ? R0 + R0
 "110000000111" -- jzr R0,7     ; If R0 = 0 jump to line 7
 );
begin

data <= processor_ROM(to_integer(unsigned(address)));

end Behavioral;
