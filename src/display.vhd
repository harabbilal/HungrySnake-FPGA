----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2025 12:32:52 PM
-- Design Name: 
-- Module Name: display - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity score_display is
    Port (
        clk25 : in std_logic;  -- Input clock
        score : in integer range 0 to 99;  -- Input score (0-99)
        an : out std_logic_vector(3 downto 0);  -- Anode signals for 7-seg
        seg : out std_logic_vector(6 downto 0)  -- Segment outputs
    );
end score_display;

architecture Behavioral of score_display is
    signal digit1, digit2 : integer range 0 to 9;  
    signal refresh_counter : integer range 0 to 50000 := 0;  
    signal digit_select : std_logic := '0';  

begin
    -- Extract two digits from the score
    digit1 <= score mod 10;  
    digit2 <= score / 10;    

    -- Refresh rate for multiplexing
    process (clk25)
    begin
        if rising_edge(clk25) then
            refresh_counter <= refresh_counter + 1;
            if refresh_counter = 50000 then  
                refresh_counter <= 0;
                digit_select <= not digit_select;
            end if;
        end if;
    end process;

    -- Select which digit to display
    process (digit_select, digit1, digit2)
    begin
        if digit_select = '0' then
            an <= "1110";  -- Enable rightmost segment
            case digit1 is
                when 0 => seg <= "1000000";
                when 1 => seg <= "1111001";
                when 2 => seg <= "0100100";
                when 3 => seg <= "0110000";
                when 4 => seg <= "0011001";
                when 5 => seg <= "0010010";
                when 6 => seg <= "0000010";
                when 7 => seg <= "1111000";
                when 8 => seg <= "0000000";
                when 9 => seg <= "0010000";
                when others => seg <= "1000000";
            end case;
        else
            an <= "1101";  -- Enable second rightmost segment
            case digit2 is
                when 0 => seg <= "1000000";
                when 1 => seg <= "1111001";
                when 2 => seg <= "0100100";
                when 3 => seg <= "0110000";
                when 4 => seg <= "0011001";
                when 5 => seg <= "0010010";
                when 6 => seg <= "0000010";
                when 7 => seg <= "1111000";
                when 8 => seg <= "0000000";
                when 9 => seg <= "0010000";
                when others => seg <= "1000000";
            end case;
        
        end if;
    end process;
    
end Behavioral;
