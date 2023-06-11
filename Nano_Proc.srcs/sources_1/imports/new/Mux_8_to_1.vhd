----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2023 03:13:39 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is
COMPONENT Decoder_3_to_8 PORT(

           I : in STD_LOGIC_VECTOR;
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR);
           
END COMPONENT;

signal y0 : STD_LOGIC_VECTOR (7 downto 0);
begin

Decode_3_to_8_0 : Decoder_3_to_8
 port map(
 I => S,
 EN => EN ,
 Y => y0 );
 
Y <= (D(0) AND y0(0))OR(D(1) AND y0(1))OR(D(2) AND y0(2))OR(D(3) AND y0(3))OR(D(4) AND y0(4))OR(D(5) AND y0(5))OR(D(6) AND y0(6))OR(D(7) AND y0(7));





end Behavioral;
