----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2025 10:10:01 AM
-- Design Name: 
-- Module Name: Snake_Control - Behavioral
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


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use ieee.numeric_std.all;
--use work.pkg_PrASIC.all;


---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
----use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx leaf cells in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

--entity Snake_Control is
--  Port (clk25:      in  std_logic;
--        AR:       in  boolean;
--        btn_up,btn_down,btn_right,btn_left: in std_logic);
--        --direction: out std_logic_vector(1 downto 0));

        
--end Snake_Control;

--architecture Behavioral of Snake_Control is

--signal direction : std_logic_vector (1 downto 0);
--signal snake_x: integer range 1 to HRes;
--signal snake_y: integer range 1 to HRes;


------signal snake_x_temp, snake_y_temp: integer range 0 to 79;
----signal current_direction: std_logic_vector (1 downto 0):= "11";

--begin
--    process(clk25, AR)
--   begin
--    if AR then
--      snake_x <= 20;
--      snake_y <= 30;
--      direction <= "00";
--    ELSif rising_edge(clk25) then
        
--           if btn_up = '1' and direction /="10" then
--            direction <= "00";
--           elsif btn_down = '1' and direction /="00" then
--            direction <= "10";
--           elsif btn_left = '1' and direction /="01" then
--            direction <= "11";
--           elsif btn_right = '1' and direction /="11" then
--            direction <= "01";
--           end if;
--            IF fEND
--           case direction is
--            when "00"=> 
--             snake_y<= snake_y-1;
            
--            when "01"=> snake_x<= snake_x+1;
--            when "10"=> snake_y<= snake_y+1;
--            when "11"=> snake_x<= snake_x-1;
--            when others => NULL;
--            end case;
           
--           end if;
--end process;

----direction<=current_direction;



--end Behavioral;
