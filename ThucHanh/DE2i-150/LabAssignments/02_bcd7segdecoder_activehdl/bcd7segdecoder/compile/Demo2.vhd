-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : bcd7segdecoder
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : E:\workspaces\ws_actel\02_bcd7segdecoder_activehdl\bcd7segdecoder\compile\Demo2.vhd
-- Generated   : Fri Nov  8 14:52:06 2013
-- From        : E:/workspaces/ws_actel/02_bcd7segdecoder_activehdl/bcd7segdecoder/src/Demo2.bde
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


entity Demo2 is
  port(
       Input0 : in STD_LOGIC;
       Input1 : in STD_LOGIC;
       Output0 : out STD_LOGIC
  );
end Demo2;

architecture Demo2 of Demo2 is

---- Component declarations -----

component Demo
  port (
       In1 : in STD_LOGIC;
       In2 : in STD_LOGIC;
       In3 : in STD_LOGIC;
       S : in STD_LOGIC;
       Output : out STD_LOGIC
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Signal declarations used on the diagram ----

signal NET112 : STD_LOGIC;
signal NET121 : STD_LOGIC;

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : Demo
  port map(
       In1 => Input0,
       In2 => Input1,
       In3 => Dangling_Input_Signal,
       Output => NET112,
       S => Input1
  );

U2 : Demo
  port map(
       In1 => Input0,
       In2 => Input1,
       In3 => Dangling_Input_Signal,
       Output => NET121,
       S => Input0
  );

Output0 <= not(NET121 or NET112);


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end Demo2;
