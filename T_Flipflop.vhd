----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2018 11:36:02 AM
-- Design Name: 
-- Module Name: T_Flipflop - Behavioral
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

entity T_Flipflop is
    Port ( Ck : in STD_LOGIC;
           T : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC);
end T_Flipflop;

architecture Behavioral of T_Flipflop is
    signal temp : STD_LOGIC;
begin
    process (Ck, Reset) begin
	if Reset = '0' then
		temp <= '0';
	elsif rising_edge(Ck) then
		temp <= T xor temp;
	end if;
end process;
Q <= temp;

end Behavioral;
