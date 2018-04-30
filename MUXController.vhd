----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2018 07:17:12 PM
-- Design Name: 
-- Module Name: MUXController - Behavioral
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

entity MUXController is
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
end MUXController;

architecture Behavioral of MUXController is

type STATE is (S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S18, S19, S20, S21, S22, S23);
signal Present_state, Next_state : STATE;
signal select_digit : STD_LOGIC_VECTOR(4 downto 0);

component MUX is
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
end component;

begin

ToMUX : MUX
port map(selector => select_digit, outputMUX => output, input00000 => input00000, input00001 => input00001, input00010 => input00010, input00011 => input00011, input00100 => input00100, input00101 => input00101, input00110 => input00110, input00111 => input00111, input01000 => input01000, input01001 => input01001, input01010 => input01010, input01011 => input01011, input01100 => input01100, input01101 => input01101, input01110 => input01110, input01111 => input01111, input10000 => input10000, input10001 => input10001, input10010 => input10010, input10011 => input10011, input10100 => input10100, input10101 => input10101, input10110 => input10110, input10111 => input10111);

StateMachine: process(Present_state) begin
    case Present_state is
        when S0 =>
            select_digit <= "00000";
            Next_state <= S1;
        when S1 =>
            select_digit <= "00001";
            Next_state <= S2;
        when S2 =>
            select_digit <= "00010";
            Next_state <= S3;
        when S3 =>
            select_digit <= "00011";
            Next_state <= S4;
        when S4 =>
            select_digit <= "00100";
            Next_state <= S5;
        when S5 =>
            select_digit <= "00101";
            Next_state <= S6;
        when S6 =>
            select_digit <= "00110";
            Next_state <= S7;
        when S7 =>
            select_digit <= "00111";
            Next_state <= S8;
        when S8 =>
            select_digit <= "01000";
            Next_state <= S9;
        when S9 =>
            select_digit <= "01001";
            Next_state <= S10;
        when S10 =>
            select_digit <= "01010";
            Next_state <= S11;
        when S11 =>
            select_digit <= "01011";
            Next_state <= S12;
        when S12 =>
            select_digit <= "01100";
            Next_state <= S13;
        when S13 =>
            select_digit <= "01101";
            Next_state <= S14;
        when S14 =>
            select_digit <= "01110";
            Next_state <= S15;
        when S15 =>
            select_digit <= "01111";
            Next_state <= S16;
        when S16 =>
            select_digit <= "10000";
            Next_state <= S17;
        when S17 =>
            select_digit <= "10001";
            Next_state <= S18;
        when S18 =>
            select_digit <= "10010";
            Next_state <= S19;
        when S19 =>
            select_digit <= "10011";
            Next_state <= S20;
        when S20 =>
            select_digit <= "10100";
            Next_state <= S21;
        when S21 =>
            select_digit <= "10101";
            Next_state <= S22;
        when S22 =>
            select_digit <= "10110";
            Next_state <= S23;
        when S23 =>
            select_digit <= "10111";
            Next_state <= S0;
    end case;
end process StateMachine;
    
SelectDigit : process (ck) begin
    if rising_edge(ck) then
        Present_state <= Next_state;
    end if;
end process SelectDigit;
end Behavioral;
