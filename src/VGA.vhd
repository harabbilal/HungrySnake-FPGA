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

entity VGA is
Port (clk25:    in  std_logic;
        AR:       in  boolean;
        VGAin:    in  vga12;
        Freeze:   in  boolean;      
        HC:       out integer range 1 to HMax;
        VC:       out integer range 1 to VMax;
        FC:       out integer range 0 to FMax;
        FEnd:     out boolean;
        Hsync:    out std_logic;
        Vsync:    out std_logic;
        VGAout:   out vga12 );
end VGA;

architecture Behavioral of VGA is

signal HCT: integer range  1 to HMax;
signal VCT: integer range  1 to VMax;
signal FCT: integer range  0 to FMax;



begin

  process(clk25,AR)
    begin
      if AR then
        HCT <= 1;
        VCT <= 1;
        FCT <= 0;
        FEnd <= false;
      elsif rising_edge(clk25) then     
         FEnd <= false;
                if HCT < HMax then
                    HCT <= HCT + 1;
                else
                    HCT <= 1;
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
           VGAOut <= VGAin;
       else
           VGAOut <= blank;
        end if;
    end process;


HC <= hcT;
vc <= vct;
fc <= Fct;

end Behavioral;
