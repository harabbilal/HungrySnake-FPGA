----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2025 12:23:27 PM
-- Design Name: 
-- Module Name: Block disign - Behavioral
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
-- use ieee.numeric_std.all;
use work.pkg_PrASIC.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Block_design is
  Port(clk25:      in  std_logic;
      HC:       in integer range 1 to HMax;
      VC:       in integer range 1 to VMax;
        Col_Block1 :  out vga12;
        Col_Block2 :  out vga12;
        Ex_Block1 :  out boolean;
        Ex_Block2 :  out boolean);
end Block_design;

architecture Behavioral of Block_design is
constant Block1_x : integer := 275;
constant Block1_y : integer := 100;
constant Block1_width : integer := 20;
constant Block1_height : integer := 20;

constant Block2_x : integer := 275;
constant Block2_y : integer := 350;
constant Block2_width : integer := 20;
constant Block2_height : integer := 20;


begin

process(HC, VC)
   begin
   if (HC >= Block1_x and HC < Block1_x + Block1_width) and
      (VC >= Block1_y and VC < Block1_y + Block1_height) then
      Ex_Block1 <= true;
      end if;
      if (HC >= Block2_x and HC < Block2_x + Block2_width) and
      (VC >= Block2_y and VC < Block2_y + Block2_height) then
      Ex_Block2 <= true;
      end if;
      end process;
     
Col_Block1<= cyan;
Col_Block2<= cyan;     

end Behavioral;


