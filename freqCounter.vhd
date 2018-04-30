----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2018 04:36:20 PM
-- Design Name: 
-- Module Name: freqCounter - Behavioral
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

entity freqCounter is
    Port ( freq_in : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (23 downto 0);
           R : in STD_LOGIC);
end freqCounter;

architecture Behavioral of freqCounter is

component T_Flipflop is
    Port ( Ck : in STD_LOGIC;
           T : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

signal temp_Q : STD_LOGIC_VECTOR (23 downto 0);
signal temp_Qn : STD_LOGIC_VECTOR (23 downto 0);

begin
T_00000 : T_Flipflop
port map(Ck => freq_in, T => '1', Reset => R, Q => temp_Q(0));

temp_Qn(0) <= not temp_Q(0);
T_00001 : T_Flipflop
port map(Ck => temp_Qn(0), T => '1', Reset => R, Q => temp_Q(1));

temp_Qn(1) <= not temp_Q(1);
T_00010 : T_Flipflop
port map(Ck => temp_Qn(1), T => '1', Reset => R, Q => temp_Q(2));

temp_Qn(2) <= not temp_Q(2);
T_00011 : T_Flipflop
port map(Ck => temp_Qn(2), T => '1', Reset => R, Q => temp_Q(3));

temp_Qn(3) <= not temp_Q(3);
T_00100 : T_Flipflop
port map(Ck => temp_Qn(3), T => '1', Reset => R, Q => temp_Q(4));

temp_Qn(4) <= not temp_Q(4);
T_00101 : T_Flipflop
port map(Ck => temp_Qn(4), T => '1', Reset => R, Q => temp_Q(5));

temp_Qn(5) <= not temp_Q(5);
T_00110 : T_Flipflop
port map(Ck => temp_Qn(5), T => '1', Reset => R, Q => temp_Q(6));

temp_Qn(6) <= not temp_Q(6);
T_00111 : T_Flipflop
port map(Ck => temp_Qn(6), T => '1', Reset => R, Q => temp_Q(7));

temp_Qn(7) <= not temp_Q(7);
T_01000 : T_Flipflop
port map(Ck => temp_Qn(7), T => '1', Reset => R, Q => temp_Q(8));

temp_Qn(8) <= not temp_Q(8);
T_01001 : T_Flipflop
port map(Ck => temp_Qn(8), T => '1', Reset => R, Q => temp_Q(9));

temp_Qn(9) <= not temp_Q(9);
T_01010 : T_Flipflop
port map(Ck => temp_Qn(9), T => '1', Reset => R, Q => temp_Q(10));

temp_Qn(10) <= not temp_Q(10);
T_01011 : T_Flipflop
port map(Ck => temp_Qn(10), T => '1', Reset => R, Q => temp_Q(11));

temp_Qn(11) <= not temp_Q(11);
T_01100 : T_Flipflop
port map(Ck => temp_Qn(11), T => '1', Reset => R, Q => temp_Q(12));

temp_Qn(12) <= not temp_Q(12);
T_01101 : T_Flipflop
port map(Ck => temp_Qn(12), T => '1', Reset => R, Q => temp_Q(13));

temp_Qn(13) <= not temp_Q(13);
T_01110 : T_Flipflop
port map(Ck => temp_Qn(13), T => '1', Reset => R, Q => temp_Q(14));

temp_Qn(14) <= not temp_Q(14);
T_01111 : T_Flipflop
port map(Ck => temp_Qn(14), T => '1', Reset => R, Q => temp_Q(15));

temp_Qn(15) <= not temp_Q(15);
T_10000 : T_Flipflop
port map(Ck => temp_Qn(15), T => '1', Reset => R, Q => temp_Q(16));

temp_Qn(16) <= not temp_Q(16);
T_10001 : T_Flipflop
port map(Ck => temp_Qn(16), T => '1', Reset => R, Q => temp_Q(17));

temp_Qn(17) <= not temp_Q(17);
T_10010 : T_Flipflop
port map(Ck => temp_Qn(17), T => '1', Reset => R, Q => temp_Q(18));

temp_Qn(18) <= not temp_Q(18);
T_10011 : T_Flipflop
port map(Ck => temp_Qn(18), T => '1', Reset => R, Q => temp_Q(19));

temp_Qn(19) <= not temp_Q(19);
T_10100 : T_Flipflop
port map(Ck => temp_Qn(19), T => '1', Reset => R, Q => temp_Q(20));

temp_Qn(20) <= not temp_Q(20);
T_10101 : T_Flipflop
port map(Ck => temp_Qn(20), T => '1', Reset => R, Q => temp_Q(21));

temp_Qn(21) <= not temp_Q(21);
T_10110 : T_Flipflop
port map(Ck => temp_Qn(21), T => '1', Reset => R, Q => temp_Q(22));

temp_Qn(22) <= not temp_Q(22);
T_10111 : T_Flipflop
port map(Ck => temp_Qn(22), T => '1', Reset => R, Q => temp_Q(23));

Q <= temp_Q;
end Behavioral;
