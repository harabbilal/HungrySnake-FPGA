----------------------------------------------------------------------------------
-- Company:     LIKE
-- Engineer:    Juergen Frickel
-- Create Date: 04.08.2024
-- TopModule for PrASIC
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.pkg_PrASIC.all;

entity HungrySnake is
  Port (clk:   in std_logic;
        btnCpuReset:  in std_logic;
        sw:     in std_logic_vector (15 downto 0);
        Hsync, Vsync: out std_logic;
        btnU: in std_logic;
        btnD: in std_logic;
        btnR: in std_logic;
        btnL: in std_logic;
        btnC: in std_logic;
        vgaRed, vgaGreen, vgaBlue: out std_logic_vector(3 downto 0);
        seg: out std_logic_vector (6 downto 0);
        an: out std_logic_vector(3 downto 0));
end entity;

architecture Start of HungrySnake is
   
  component clk_wiz_0
    Port (clk_out1: out std_logic;
          reset:  in  std_logic;
          clk_in1:  in  std_logic);    
  end component;

  component VGA
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
  end component VGA;
  
  component snake
Port (clk25:      in  std_logic;
        AR:       in  boolean;
        HC:       in integer range 1 to HMax;
        VC:       in integer range 1 to VMax;
        FEnd:     in boolean;
        game_over: out boolean;
        btn_up,btn_down,btn_right,btn_left, btn_stop: in std_logic;
--        size_h:  in integer range 0 to 79;
--        size_v:  in integer range 0 to 59;
        Col_Snk:  out vga12;
        Ex_Snk:   out boolean;
        collision_food, collision_Block: in boolean);
  end component snake;
  
  component food
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
  end component food;
  
 component Block_design
    Port(clk25:      in  std_logic;
         HC:     in integer range 1 to HMax;
         VC:     in integer range 1 to VMax;
         Col_Block1:  out vga12;
         Col_Block2:  out vga12;
         Ex_Block1:  out boolean;
         Ex_Block2:  out boolean); 
               
  end component Block_design;
  
    component score_display
   Port (
        clk25 : in std_logic;  -- Input clock
        score : in integer range 0 to 99;  -- Input score (0-99)
        an : out std_logic_vector(3 downto 0);  -- Anode signals for 7-seg
        seg : out std_logic_vector(6 downto 0)  -- Segment outputs
    );
 end component score_display;
    
  signal t_VGAin:   VGA12;
  signal t_VGAout:  VGA12;
  signal t_Col_Snk1: VGA12;
  signal t_col_food: VGA12;
  signal t_Col_Block1: VGA12;
  signal t_Col_Block2: VGA12;

  signal clk25:    std_logic;
  signal t_reset:  std_logic;
  signal t_HC:     integer range 1 to HMax;
  signal t_VC:     integer range 1 to VMax;
  signal t_FC:     integer range 0 to FMax;
  signal t_FEnd, t_AR, t_Freeze:  boolean;
--  signal SLV_Tmp: std_logic_vector(19 downto 0);

  signal t_Ex_Snk1:  boolean;
  signal t_Ex_food: boolean;
  signal t_Ex_Block1: boolean;
  signal t_Ex_Block2: boolean;
  
  signal snake_out_h:  integer range 1 to Hmax;
  signal snake_out_v:  integer range 1 to vmax;
  signal food_eaten:   boolean;
 
  signal coll_f_s, coll_b_s:  boolean;
  signal t_game_over: boolean;
  signal t_score: integer range 0 to 99 :=0;


  
  
begin

   Clk_IP : clk_wiz_0
      port map (clk_in1  => clk,
                reset  => t_reset,
                clk_out1 => clk25);

   Inst_VGA : VGA
      port map (
         clk25  => clk25,
         AR     => t_AR,
         VGAin  => t_VGAin,
         Freeze => t_Freeze,
         HC     => t_HC,
         VC     => t_VC,
         FC     => t_FC,
         FEnd   => t_FEnd,
         Hsync  => HSync,
         Vsync  => VSync,
         VGAout => t_VGAout );
         
         
         
   Inst_Snake1 : Snake
       port map (
         clk25  => clk25,
         AR     => t_AR,
         HC     => t_HC,
         VC     => t_VC,
         Col_Snk => t_Col_Snk1,
         FEnd   => t_FEnd,
         btn_up => btnU,
         btn_down => btnD,
         btn_right=> btnR,
         btn_left => btnL,
         btn_stop => btnC,
         Ex_Snk => t_Ex_Snk1,
         game_over => t_game_over,
         collision_block => coll_b_s,
         collision_food => coll_f_s
         );
         

   Inst_food : food
       port map (
         clk25  => clk25,
         AR     => t_AR,
         HC     => t_HC,
         VC     => t_VC,
         size_h => 20,
         size_v => 20,
         FEnd   => t_FEnd,
         snake_out_h=> snake_out_h, 
         snake_out_v=> snake_out_v,
         food_eaten=> food_eaten,
         Col_food => t_Col_food,
         Ex_food => t_Ex_food,
         collision_food => coll_f_s);
         
   Inst_Block_design : Block_design
      port map (
         clk25  => clk25,
         HC => t_HC,
         VC     => t_VC,
         Col_Block1 => t_Col_Block1,
         Col_Block2 => t_Col_Block2,
         Ex_Block1 => t_Ex_Block1,
         Ex_Block2 => t_Ex_Block2);
  
     Inst_display : score_display
      port map (
         clk25  => clk25,
         score=> t_score,
         an=> an,
         seg=> seg);

   
 -------------------------------------------------
   t_reset  <= not btnCpuReset;     -- high active reset for clock IP
   t_AR     <= (btnCPUReset='0');   -- async. reset (converting to boolean)
   t_Freeze <= (sw(15)='1');        -- freeze (converting to boolean)

   vgaRed   <=  t_VGAout (11 downto 8);
   vgaGreen <=  t_VGAout (7 downto 4);
   vgaBlue  <=  t_VGAout (3 downto 0);
-------------------------------------------------

--   SLV_Tmp <= std_logic_vector(to_unsigned((t_HC-HRes/2)*(t_HC-HRes/2) + (t_VC-VRes/2)*(t_VC-VRes/2) + (t_FC-FMax/2)*(t_FC-FMax/2),20));
--   t_VGAin <= SLV_tmp(13 downto 2);

Drawer: process (t_Ex_Snk1, t_Col_Snk1, t_Ex_food, t_Col_food, t_game_over,t_Ex_Block1, t_Ex_Block2, t_Col_Block1, t_Col_Block2 )
begin 

   if t_game_over and (sw(14)='1')  then
      t_VGAIn <= red;
      
   elsif t_Ex_Snk1 then
      t_VGAIn <= t_Col_Snk1;
   elsif t_Ex_food then
      t_VGAIn <= t_Col_food;
   elsif t_Ex_Block1 then
      t_VGAIn <= t_Col_Block1;
   elsif t_Ex_Block2 then
      t_VGAIn <= t_Col_Block2;
   else
      t_VGAIN <= bgcolour;
   end if;
     
end process;    
           

Collision: process(clk25, t_AR)
    begin
      if t_AR then
        coll_f_s <= false;
        coll_b_s<= false;
        t_score<=0;
      elsif rising_edge(clk25) then
         
         if t_Ex_Snk1 and t_Ex_food then
            coll_f_s <= true;    
         elsif t_Ex_Snk1 and t_Ex_Block1 then
             coll_b_s<= true;
         elsif t_Ex_Snk1 and t_Ex_Block2 then
             coll_b_s<= true;
         end if;
         
         
         if t_FEnd then
            coll_f_s <= false;
            coll_b_s<= false;
            if coll_f_s then
                if t_score < 99 then
                    t_score<=t_score+1;
                 else
                    t_score<= 0;
            end if;
            
       
                 
         end if;
            
         end if;
            
    end if;
 end process;

end architecture;