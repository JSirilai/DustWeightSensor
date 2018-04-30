----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2018 11:36:02 AM
-- Design Name:  
-- Module Name: DustWS - Behavioral
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

entity DustWS is
  Port (inputFreq : in STD_LOGIC;
        controlGate : in STD_LOGIC;
        resetCounter : in STD_LOGIC;
        Ck_MUX : in STD_LOGIC;
        outSignal : out STD_LOGIC);
end DustWS;

architecture Behavioral of DustWS is

component MUXController is
    Port (Ck : in STD_LOGIC;
    output : out STD_LOGIC;
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
    input10111 : in STD_LOGIC);
end component;

component freqCounter is
    Port ( freq_in : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR (23 downto 0);
       R : in STD_LOGIC);
end component;

signal temp : STD_LOGIC_VECTOR(23 downto 0);
signal CANDS : STD_LOGIC;

begin

CANDS <= inputFreq AND controlGate;

C : freqCounter
port map(freq_in => CANDS, Q =>temp, R =>resetCounter);
M : MUXcontroller
port map(Ck => Ck_MUX, output => outSignal,input00000 => temp(0), input00001 => temp(1), input00010 => temp(2), input00011 => temp(3), input00100 => temp(4), input00101 => temp(5), input00110 => temp(6), input00111 => temp(7), input01000 => temp(8), input01001 => temp(9), input01010 => temp(10), input01011 => temp(11), input01100 => temp(12), input01101 => temp(13), input01110 => temp(14), input01111 => temp(15), input10000 => temp(16), input10001 => temp(17), input10010 =>temp(18), input10011 => temp(19),input10100 => temp(20), input10101 => temp(21), input10110 => temp(22), input10111 => temp(23));

end Behavioral;
