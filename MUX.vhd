----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2018 06:10:47 PM
-- Design Name: 
-- Module Name: MUX - Behavioral
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

entity MUX is
    Port ( selector : in STD_LOGIC_VECTOR (4 downto 0);
           input00000 : in STD_LOGIC;
           input00001 : in STD_LOGIC;
           input00010 : in STD_LOGIC;
           input00011 : in STD_LOGIC;
           input00100 : in STD_LOGIC;
           input00101 : in STD_LOGIC;
           input00110 : in STD_LOGIC;
           input00111 : in STD_LOGIC;
           input01000 : in STD_LOGIC;
           input01001 : in STD_LOGIC;
           input01010 : in STD_LOGIC;
           input01011 : in STD_LOGIC;
           input01100 : in STD_LOGIC;
           input01101 : in STD_LOGIC;
           input01110 : in STD_LOGIC;
           input01111 : in STD_LOGIC;
           input10000 : in STD_LOGIC;
           input10001 : in STD_LOGIC;
           input10010 : in STD_LOGIC;
           input10011 : in STD_LOGIC;
           input10100 : in STD_LOGIC;
           input10101 : in STD_LOGIC;
           input10110 : in STD_LOGIC;
           input10111 : in STD_LOGIC;
           outputMUX : out STD_LOGIC);
end MUX;

architecture Behavioral of MUX is

component MUX2_1 is
    Port (selector : in STD_LOGIC;
          input0 : in STD_LOGIC;
          input1 : in STD_LOGIC;
          output_MUX : out STD_LOGIC);
end component;

component MUX4_1 is
    Port ( selector : in STD_LOGIC_VECTOR (1 downto 0);
       input00 : in STD_LOGIC;
       input01 : in STD_LOGIC;
       input10 : in STD_LOGIC;
       input11 : in STD_LOGIC;
       outputMUX : out STD_LOGIC);
end component;

signal temp1 : STD_LOGIC_VECTOR (1 downto 0);
signal temp2 : STD_LOGIC_VECTOR (1 downto 0);
signal temp3 : STD_LOGIC;
signal output1 ,output2, output3, output4, output5, output6, output7, output8 : STD_LOGIC;

begin

temp1(0) <= selector(0);
temp1(1) <= selector(1);

thirdLevel1 : MUX4_1    --000
port map(selector => temp1, input00 => input00000, input01 => input00001, input10 => input00010, input11 => input00011, outputMUX => output1);
thirdLevel2 : MUX4_1    --001
port map(selector => temp1, input00 => input00100, input01 => input00101, input10 => input00110, input11 => input00111, outputMUX => output2);
thirdLevel3 : MUX4_1    --010
port map(selector => temp1, input00 => input01000, input01 => input01001, input10 => input01010, input11 => input01011, outputMUX => output3);
thirdLevel4 : MUX4_1    --011
port map(selector => temp1, input00 => input01100, input01 => input01101, input10 => input01110, input11 => input01111, outputMUX => output4);
thirdLevel5 : MUX4_1    --100
port map(selector => temp1, input00 => input10000, input01 => input10001, input10 => input10010, input11 => input10011, outputMUX => output5);
thirdLevel6 : MUX4_1    --101
port map(selector => temp1, input00 => input10100, input01 => input10101, input10 => input10110, input11 => input10111, outputMUX => output6);

temp2(0) <= selector(2);
temp2(1) <= selector(3);

secondLevel1 : MUX4_1
port map(selector => temp2, input00 => output1, input01 => output2, input10 => output3, input11 => output4, outputMUX => output7);
secondLevel2 : MUX4_1
port map(selector => temp2, input00 => output5, input01 => output6, input10 => '0', input11 => '0', outputMUX => output8);

temp3 <= selector(4);

firstLevel: MUX2_1
port map(selector => temp3, input0 => output7, input1 => output8, output_MUX => outputMUX);

end Behavioral;
