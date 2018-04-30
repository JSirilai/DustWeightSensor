----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2018 11:52:28 PM
-- Design Name: 
-- Module Name: MUX4_1 - Behavioral
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

entity MUX4_1 is
    Port ( selector : in STD_LOGIC_VECTOR (1 downto 0);
           input00 : in STD_LOGIC;
           input01 : in STD_LOGIC;
           input10 : in STD_LOGIC;
           input11 : in STD_LOGIC;
           outputMUX : out STD_LOGIC);
end MUX4_1;

architecture Behavioral of MUX4_1 is

begin

process (selector, input00, input01, input10, input11) begin
	case selector is
		when "00" => outputMUX <= input00;		
		when "01" => outputMUX <= input01;		
		when "10" => outputMUX <= input10;		
		when "11" => outputMUX <= input11;				
		when others => outputMUX <= '0';
	end case;
end process;
end Behavioral;
