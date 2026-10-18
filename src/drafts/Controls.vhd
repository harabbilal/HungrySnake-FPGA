----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2025 04:53:44 PM
-- Design Name: 
-- Module Name: Controls - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
use work.pkg_PrASIC.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Controls is
  Port (clk25:      in  std_logic;
        AR:       in  boolean;
        btn_up,btn_down,btn_right,btn_left: in std_logic;
        direction_up,direction_down,direction_right,direction_left: out std_logic
        
         );
end Controls;

architecture Behavioral of Controls is

--signal btn_up_reg,btn_down_reg,btn_right_reg,btn_left_reg : std_logic:='1';

begin
--process(clk25)
--begin
---- Assigning button press value in registers
--    if rising_edge(clk25)then
--        btn_up_reg <= btn_up;
--        btn_down_reg <= btn_down;
--        btn_right_reg <= btn_right;
--        btn_left_reg <= btn_left;
--        end if;
--end process;

direction_up<=btn_up;
direction_down<=btn_down;
direction_right<=btn_right;
direction_left<=btn_left;


end Behavioral;
