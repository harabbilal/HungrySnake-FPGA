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
        FEnd:     in boolean;
        game_over: out boolean;
        btn_up,btn_down,btn_right,btn_left, btn_stop: in std_logic;
        Col_Snk:  out vga12;
        Ex_Snk:   out boolean;
        collision_food, collision_block: in boolean);
end snake;

architecture Behavioral of snake is

signal snake_h: integer range 1 to HRes:= 250;
signal snake_v: integer range 1 to VRes:= 200;
signal snake_size_h: integer range 1 to Hres:= 20;
signal snake_size_v: integer range 1 to Hres:=20;
signal direction : std_logic_vector (1 downto 0);
--type Snake_Array_h is array (0 to 100) of integer range 0 to 639;
--type Snake_Array_v is array (0 to 100) of integer range 0 to 639;
--signal snake_hp, snake_vp: Snake_array_h;
--signal snake_length: integer :=10;
begin

    process(clk25, AR)
   begin
    if AR then
      snake_h <= 250;
      snake_v <= 200;
      direction <= "11";
      snake_size_h<= 20;
      snake_size_v<= 20;
      game_over <= false;
    ELSif rising_edge(clk25) then
       if btn_up = '1' and direction /= "10" then
        direction <= "00";
       elsif btn_down = '1' and direction /= "00" then
        direction <= "10";
       elsif btn_left = '1' and direction /= "01" then
        direction <= "11";
       elsif btn_right = '1' and direction /= "11" then
        direction <= "01";
       elsif btn_stop = '1' then
          game_over <= false; 
          snake_h <= 250;
          snake_v <= 200;
          snake_size_h<= 20;
          snake_size_v<= 20;
          direction <= "01";                      
       end if;
       
       if FEnd then
          if direction = "00" then
             if snake_v > 1 then
                snake_v<= snake_v-2;
             else
                game_over <= true;
             end if;
          elsif direction = "01" then
             if snake_h + snake_size_h < HRes then
                snake_h<= snake_h+2;
             else
                game_over <= true;
             end if;
          elsif direction = "10" then
             if snake_v+ snake_size_v < VRes then
                snake_v<= snake_v+2; 
             else
                game_over <= true;
             end if;
           else
              if snake_h > 1 then
                snake_h<= snake_h-2;
              else
                game_over <= true;
              end if;
           end if;
      end if;
      
      
      if Fend and collision_block then
       game_over<= true;
       elsif Fend and collision_food then
       snake_size_h<= snake_size_h+10;
       snake_size_v<= snake_size_v+10;
       end if;
        
  end if;
end process;

    
    
    
      
      process (HC, VC,snake_size_h, snake_size_v, snake_h, snake_v)
        begin
      if (HC > snake_h) and (HC < snake_h + snake_size_h) and (VC > snake_v) and (VC < snake_v + snake_size_v) then
           Ex_Snk <= true;
       else
           Ex_Snk <= false;
       end if;

     end process;
           
Col_Snk <= grey when collision_food else green;


end Behavioral;

