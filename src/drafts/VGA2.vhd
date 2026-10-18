----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2025 01:10:36 PM
-- Design Name: 
-- Module Name: VGA2 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VGA2 is
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
        --btn_up : in std_logic;
        --btn_down : in std_logic;
        --btn_left : in std_logic;
        --btn_right : in std_logic;
        
--  Port ( );
end VGA2;

architecture Behavioral of VGA2 is
constant HRes:    integer := 640;
constant VRes:    integer := 480;
constant HMax:    integer := 800;
constant VMax:    integer := 525;
signal HCT: integer range  1 to HMax;
signal VCT: integer range  1 to VMax;
signal FCT: integer range  0 to FMax;
signal snake_x: integer range 0 to 79 := 40;
signal snake_y: integer range 0 to 59 := 30;
signal food_x: integer range 0 to 79 := 20;
signal food_y: integer range 0 to 59 := 20;
signal direction: std_logic_vector  ( 1 downto 0) := "00";
signal snake_size: integer range 1 to 100 := 1;
type body_array is array (0 to 99) of integer range 0 to 79;
signal_body_x : body_array := (others => 0);
signal_body_y : body_array := (others => 0);
--signal game_over : std_logic := "0";
signal score : integer range 0 to 255 :=0;


begin
process(clk25,AR)
    begin
      if AR then
        HCT <= 1;
        VCT <= 1;
        FCT <= 0;
        FEnd <= false;
        snake_x <= 40;
        snake_y <= 30;
        direction <= "00";
        score <= 0;
        snake_size <= 1;
        snake_body_x <= (others => 0);
        snake_body_y <= (others => 0);
        elsif rising_edge(clk25) then
           
         --FEnd <= false;
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
--                        If not freeze then
--                            FEnd <= true;
--                            if FCT < FMax then
--                               FCT <= FCT + 1;
--                            else
--                               FCT <= 0;
--                            end if;
--                       end if;
                    end if;
            end if;
       end if;
    end process;
    -- Generate Sync Pulses
     Hsync <= '0' when (HCT >= HS1 and HCT <= HS2) else '1';
     Vsync <= '0' when (VCT >= VS1 and VCT <= VS2) else '1';
    -- Generate Color Output (Simple Colored Screen)
--    process(HCT, VCT, VGAin)
--    begin
--        if HCT <= HRes and VCT <= VRes then
--           VGAOut <= green;
--        else
--           VGAOut <= blank;
--        end if;
--    end process;
HC <= hcT;
vc <= vct;
fc <= Fct;


end Behavioral;

