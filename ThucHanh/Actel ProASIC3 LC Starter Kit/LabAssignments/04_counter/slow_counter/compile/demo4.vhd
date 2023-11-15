-------------------------------------------------------------------------------
--
-- Title       : demo4
-- Design      : slow_counter
-- Author      : Unknown
-- Company     : Unknown
--
-------------------------------------------------------------------------------
--
-- File        : W:\workspaces\activehdl\04_counter\slow_counter\compile\demo4.vhd
-- Generated   : Fri Sep 11 14:33:43 2015
-- From        : W:\workspaces\activehdl\04_counter\slow_counter\src\demo4.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;


entity demo4 is
  port(
       A : in STD_LOGIC;
       B : in STD_LOGIC;
       C : in STD_LOGIC;
       D : in STD_LOGIC;
       Y : out STD_LOGIC
  );
end demo4;

architecture demo4 of demo4 is

begin

----  Component instantiations  ----

Y <= B and A;

Y <= C or D;


end demo4;
