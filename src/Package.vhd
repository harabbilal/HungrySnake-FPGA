----------------------------------------------------------------------------------
-- Company:     LIKE
-- Engineer:    Juergen Frickel
-- Create Date: 04.08.2024
-- Package for PrASIC
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package pkg_PrASIC is

----------------  640 x 480 60Hz 25,197MHz ------------  
  constant HRes:    integer := 640;   -- visible area horizontal
  constant HS1:     integer := 657;   -- first pixel of Hor. Sync
  constant HS2:     integer := 752;   -- last pixel of Hor. Sync
  constant HMax:    integer := 800;   -- visible area plus blanking zone horizontal

  constant VRes:    integer := 480;   -- visible area vertical
  constant VS1:     integer := 491;   -- first line of Vert. Sync
  constant VS2:     integer := 492;   -- last line of Vert. Sync
  constant VMax:    integer := 525;   -- visible area plus blanking zone vertical
  
------------------  800 x 600 60Hz 40MHz ------------ 
--  constant HRes:    integer := 800;    -- 40/128/88
--  constant HS1:     integer := 840;
--  constant HS2:     integer := 968;
--  constant HMax:    integer := 1056;

--  constant VRes:    integer := 600;    --  1/4/23
--  constant VS1:     integer := 601;
--  constant VS2:     integer := 605;
--  constant VMax:    integer := 628;

----------------  1024 x 768 60Hz 65MHz ------------ 
--  constant HRes:    integer := 1024;    -- 24/136/160
--  constant HS1:     integer := 1048;
--  constant HS2:     integer := 1184;
--  constant HMax:    integer := 1344;

--  constant VRes:    integer := 768;     -- 3/6/29
--  constant VS1:     integer := 771;
--  constant VS2:     integer := 777;
--  constant VMax:    integer := 806;
----------------------------------------------- 
 
  constant FMax:    integer := 2**10-1;  -- for VGA Frame Counter (can be modified)
  
-----------------------------------------------
  subtype VGA12 is std_logic_vector (11 downto 0);
-----------------------------------------------

  constant blank:   VGA12 := x"000";   -- for Blanking
  
  constant black:   VGA12 := x"000";
  constant white:   VGA12 := x"FFF";
  constant red:     VGA12 := x"F00";
  constant green:   VGA12 := x"0F0";    
  constant blue:    VGA12 := x"00F";
  constant purple:  VGA12 := x"F0F";
  constant cyan:    VGA12 := x"0FF";
  constant yellow:  VGA12 := x"FF0";
  constant grey:    VGA12 := x"AAA";
  
  constant Col_O1:  VGA12 := x"5FF";   -- Example: Colour for Object 1
  
  constant bgcolour:  VGA12 := x"080";   -- for Background
  
--  constant redC:     VGA12 := x"C00";
--  constant greenC:   VGA12 := x"0C0";    
--  constant blueC:    VGA12 := x"00C";
--  constant purpleC:  VGA12 := x"C0C";
--  constant cyanC:    VGA12 := x"0CC";
--  constant yellowC:  VGA12 := x"CC0";
--  constant greyC:    VGA12 := x"CCC";
 
--  constant red8:     VGA12 := x"800";
--  constant green8:   VGA12 := x"080";    
--  constant blue8:    VGA12 := x"008";
--  constant purple8:  VGA12 := x"808";
--  constant cyan8:    VGA12 := x"088";
--  constant yellow8:  VGA12 := x"880";
--  constant grey8:    VGA12 := x"888";
    
--  constant red6:     VGA12 := x"600";
--  constant green6:   VGA12 := x"060";    
--  constant blue6:    VGA12 := x"006";
--  constant purple6:  VGA12 := x"606";
--  constant cyan6:    VGA12 := x"066";
--  constant yellow6:  VGA12 := x"660";
--  constant grey6:    VGA12 := x"666";
      
--  constant red4:     VGA12 := x"400";
--  constant green4:   VGA12 := x"040";    
--  constant blue4:    VGA12 := x"004";
--  constant purple4:  VGA12 := x"404";
--  constant cyan4:    VGA12 := x"044";
--  constant yellow4:  VGA12 := x"440";
--  constant grey4:    VGA12 := x"444";
    
--  constant red2:     VGA12 := x"200";
--  constant green2:   VGA12 := x"020";    
--  constant blue2:    VGA12 := x"002";
--  constant purple2:  VGA12 := x"202";
--  constant cyan2:    VGA12 := x"022";
--  constant yellow2:  VGA12 := x"220";
--  constant grey2:    VGA12 := x"222";

end package;