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


---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx leaf cells in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

entity food is
Port (clk25:    in  std_logic;
        AR:       in  boolean; 
        HC:       in integer range 1 to HMax;
        VC:       in integer range 1 to VMax;
        FEnd:     in boolean;
        size_h:  in integer range 0 to 79;
        size_v:  in integer range 0 to 59;
        snake_out_h,snake_out_v: in integer range 1 to HRes;
        food_eaten: out boolean;
        Ex_food : out boolean;
        col_food : out vga12;
        collision_food: in boolean);
end food;

architecture Behavioral of food is

signal food_h: integer range 1 to HRes ;
signal food_v: integer range 1 to VRes;

signal ex_food_temp: boolean;
signal count_i: std_logic_vector(15 downto 0);
signal count_int_h, count_int_v: integer range 0 to 511;
signal feedback_i: std_logic;


begin
feedback_i<= count_i(10) xnor (count_i(12) xnor (count_i(13) xnor count_i(15)));

process(clk25, AR)
    begin 
            if AR then
              count_i<= (others=> '0');
              
         ELSif rising_edge(clk25) then
            if Fend then
            count_i <= count_i(14 downto 0) & feedback_i;
            end if;
            end if;
end process;

count_int_h <= to_integer (unsigned(count_i(15 downto 7)));
count_int_v <= to_integer (unsigned(count_i(8 downto 0)));
    
    process(clk25, AR)
    begin 
            if AR then
              food_h <= 10;
              food_v <= 20;
              
         ELSif rising_edge(clk25) then
         
                if Fend and collision_food then
                    if (food_h = 275 and food_v= 150) or (food_h = 275 and food_v= 350)  then
                        food_h <=  (count_int_h mod (Hres-20)) + 30;
                        food_v <=  count_int_v mod (Vres-20) + 30;
                    else
                        food_h <=  count_int_h mod (Hres-20);
                        food_v <=  count_int_v mod (Vres-20);
                    end if;
                end if;
           end if;
           end process;
           
           

process (HC, VC, size_h, size_v, food_h, food_v)
                 begin
                    if (HC > food_h) and (HC < food_h + size_h) and (VC > food_v) and (VC < food_v + size_v) then
                        Ex_food <= true;
                    else
                        ex_food <= false;
                    end if;
        
           end process;
    
col_food <= yellow;

end Behavioral;

