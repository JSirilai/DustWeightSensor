----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2018 01:21:34 PM
-- Design Name: 
-- Module Name: MUX8_1 - Behavioral
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

entity MUX8_1 is
    Port ( selector : in STD_LOGIC_VECTOR(2 downto 0);
          input000 : in STD_LOGIC;
          input001 : in STD_LOGIC;
          input010 : in STD_LOGIC;
          input011 : in STD_LOGIC;
          input100 : in STD_LOGIC;
          input101 : in STD_LOGIC;
          input110 : in STD_LOGIC;
          input111 : in STD_LOGIC;
          output_MUX : out STD_LOGIC);
end MUX8_1;

architecture Behavioral of MUX8_1 is

begin
    process (selector, input000, input001, input010, input011, input100, input101, input110, input111) begin
	case selector is
		when "000" => output_MUX <= input000;		
		when "001" => output_MUX <= input001;		
		when "010" => output_MUX <= input010;		
		when "011" => output_MUX <= input011;
		when "100" => output_MUX <= input100;
		when "101" => output_MUX <= input101;
		when "110" => output_MUX <= input110;
		when "111" => output_MUX <= input111;					
		when others => output_MUX <= '0';
	end case;
end process;

end Behavioral;
