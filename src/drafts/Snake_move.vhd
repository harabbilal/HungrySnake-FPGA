----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2025 11:11:04 AM
-- Design Name: 
-- Module Name: VGA - Behavioral
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

entity snake is
Port (clk25:      in  std_logic;
        AR:       in  boolean;
        HC:       in integer range 1 to HMax;
        VC:       in integer range 1 to VMax;
        direction: in std_logic_vector(1 downto 0);
        size_h:  in integer range 0 to 79;
        size_v:  in integer range 0 to 59;
        Col_Snk:  out vga12;
        Ex_Snk:   out boolean;
        snake_x: out integer range 0 to 79;
        snake_y: out integer range 0 to 59;
        collision: in boolean
        );
end snake;

architecture Behavioral of snake is

signal head_x: integer range 0 to 79;
signal head_y: integer range 0 to 59;
signal HCG: integer := HC/8;
signal VCG: integer := VC/8;
begin
process(clk25, AR)
    begin
    if AR then
    head_x <= 20;
    head_y <= 30;
    Col_Snk <= red;
    else
        case direction is
            when "00"=> head_y<= head_y-1;
            when "01"=> head_y<= head_y+1;
            when "10"=> head_x<= head_x-1;
            when "11"=> head_x<= head_x+1;
            when others => NULL;
            end case;
            
     end if;
     
    end process;
    
      
      
      process (HCG, VCG, size_h, size_v, head_x, head_y)
        begin
      if (HCG > head_x) and (HCG < head_x + size_h) and (VCG > Head_y) and (VCG < head_y + size_v) then
           Ex_Snk <= true;
       else
           Ex_Snk <= false;
       end if;

     end process;
           
snake_x<= head_x;
snake_y<= head_y;


end Behavioral;

