----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2025 04:46:18 PM
-- Design Name: 
-- Module Name: VGA1 - Behavioral
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
entity VGA1 is
Port (clk25:      in  std_logic;
        AR:       in  boolean;
        HC:       in integer range 1 to HMax;
        VC:       in integer range 1 to VMax;
        size_h:  in integer range 0 to 79;
        size_v:  in integer range 0 to 59;
        Col_Snk:  out vga12;
        Ex_Snk:   out boolean;
        snake_x, snake_y: out integer range 0 to 79 );
end entity snake is
Port (clk25:      in  std_logic;
        AR:       in  boolean;
        HC:       in integer range 1 to HMax;
        VC:       in integer range 1 to VMax;
        size_h:  in integer range 0 to 79;
        size_v:  in integer range 0 to 59;
        Col_Snk:  out vga12;
        Ex_Snk:   out boolean );
end vga1;

architecture Behavioral of vga1 is

signal koord_h: integer range 1 to HRes;
signal koord_V: integer range 1 to VRes;

begin

koord_h <= 200;
koord_v <= 300;
Col_Snk <= red;

--     if video_on = '1' then
      --VGAOut <= blank;
      --for i in 0 to snake_size-1 loop
      
      process (HC, VC, size_h, size_v, koord_h, koord_v)
        begin
      if (HC > koord_h) and (HC < koord_h + size_h) and (VC > koord_v) and (VC < koord_v + size_v) then
           Ex_Snk <= true;
       else
           Ex_Snk <= false;
       end if;

     end process;
           
--    if HC >= snake_x*8 and HC < (snake_x+1)*8 and VC >= snake_Y*8 and VC < (snake_Y+1)*8 then    

--end process;

end Behavioral;;

architecture Behavioral of snake is

signal koord_h: integer range 1 to HRes;
signal koord_V: integer range 1 to VRes;

begin

koord_h <= 200;
koord_v <= 300;
Col_Snk <= red;

--     if video_on = '1' then
      --VGAOut <= blank;
      --for i in 0 to snake_size-1 loop
      
      process (HC, VC, size_h, size_v, koord_h, koord_v)
        begin
      if (HC > koord_h) and (HC < koord_h + size_h) and (VC > koord_v) and (VC < koord_v + size_v) then
           Ex_Snk <= true;
       else
           Ex_Snk <= false;
       end if;

     end process;
           
--    if HC >= snake_x*8 and HC < (snake_x+1)*8 and VC >= snake_Y*8 and VC < (snake_Y+1)*8 then    

--end process;

end Behavioral;