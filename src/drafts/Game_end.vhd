----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2025 01:54:41 PM
-- Design Name: 
-- Module Name: Game_end - Behavioral
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

entity Game_end is
Port (clk25:    in  std_logic;
        AR:       in  boolean;
        VGAin:    in  vga12;
        game_over: in  boolean;      
        HC:       in integer range 1 to HMax;
        VC:       in integer range 1 to VMax;
        FC:       out integer range 0 to FMax;
        --FEnd:     out boolean;
        VGAout:   out vga12 );
end Game_end;

architecture Behavioral of Game_end is
signal HCT: integer range  1 to HMax;
signal VCT: integer range  1 to VMax;
begin 
process(clk25, AR)
begin
        if AR then
             game_over<= False;
        elsif rising_edge (clk25) then
            if game_over then
                if HC <= HRes and VC <= VRes then
                    VGAOut <= yellow;
            end if;
        
   end if;
   end if;
end process;


end Behavioral;
