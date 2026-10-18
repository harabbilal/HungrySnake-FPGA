----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2025 09:14:50 AM
-- Design Name: 
-- Module Name: Game Logic - Behavioral
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
use ieee.numeric_std.all;
use work.pkg_PrASIC.all;
use IEEE.std_logic_arith

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Game_Logic is
Port (clk25:    in  std_logic;
        AR:       in  boolean;
        VGAin:    in  vga12;
        Freeze:   in  boolean;      
        HC:       out integer range 1 to HMax;
        VC:       out integer range 1 to VMax;
        --FC:       out integer range 0 to FMax;
        --FEnd:     in boolean;
        Hsync:    out std_logic;
        Vsync:    out std_logic;
        VGAout:   out vga12;
        --video_on : in std_logic;
        snake_body_x : in integer_array(0 to 99);
        snake_body_y : in integer_array(0 to 99);
        snake_length : in integer range 1 to 100);
        
end Game_Logic;

architecture Behavioral of Game_Logic is
signal HCT: integer range  1 to HMax;
signal VCT: integer range  1 to VMax;
signal FCT: integer range  0 to FMax;
--constant HRes:    integer := 640;
--constant VRes:    integer := 480;
--type body_array is array (0 to 99) of integer range 0 to 79;
--snake_x :  out integer range 0 to 79 := 40;
--snake_y :  out integer range 0 to 59 := 30;

begin
 if AR then
        HCT <= 1;
        VCT <= 1;
        FCT <= 0;
        FEnd <= false;
      elsif rising_edge(clk25) then
           
         FEnd <= false;
            -- Horizontal Counter
                if HCT < HMax then
                    HCT <= HCT + 1;
                else
                    HCT <= 1;
                -- Vertical Counter
                    if VCT < VMax then
                        VCT <= VCT + 1;
                    else
                        VCT <= 1;
                        If not freeze then
                            FEnd <= true;
                            if FCT < FMax then
                               FCT <= FCT + 1;
                            else
                               FCT <= 0;
                            end if;
                        end if;
                    end if;
            end if;
       end if;
    end process;
    Hsync <= '0' when (HCT >= HS1 and HCT <= HS2) else '1';
    Vsync <= '0' when (VCT >= VS1 and VCT <= VS2) else '1';
    process(HCT, VCT, VGAin)
    begin
        if HCT <= HRes and VCT <= VRes then
           VGAOut <= green;
        else
           VGAOut <= blank;
        end if;
    end process;
   if rising_edge(clk25) then
   if video_on = 1 then
   VGaout <= "blue";
   
   for i in 0 snake_length-1 loop
       if hc >= snake_body_x(i)*8 and hc < (snake_body_x(i)+1)*8 and
          vc >= snake_body_y(i)*8 and vc < (snake_body_y(i)+1)*8 then
           VGaout <= "red";
           end if;
         end loop;
      else
      VGaout <= "blue";
         end if;
     end if;
     end process:
     HC <= hcT;
     vc <= vct;
     fc <= Fct;
     VGAout;
  end behaviral:    
      
      
   
   



end Behavioral;
