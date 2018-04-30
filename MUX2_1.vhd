----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/21/2018 01:21:34 PM
-- Design Name: 
-- Module Name: MUX2_1 - Behavioral
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

entity MUX2_1 is
    Port (selector : in STD_LOGIC;
    input0 : in STD_LOGIC;
    input1 : in STD_LOGIC;
    output_MUX : out STD_LOGIC);
end MUX2_1;

architecture Behavioral of MUX2_1 is

begin
    process (selector, input0, input1)  begin
    case selector is
        when '0' => output_MUX <= input0;
        when '1' => output_MUX <= input1;
        when others => output_MUX <='0';
    end case;
    end process;
end Behavioral;
