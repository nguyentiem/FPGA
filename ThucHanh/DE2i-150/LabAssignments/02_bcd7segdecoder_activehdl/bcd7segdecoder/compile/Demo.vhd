-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : bcd7segdecoder
-- Author      : Microsoft
-- Company     : Microsoft
--
-------------------------------------------------------------------------------
--
-- File        : E:\workspaces\ws_actel\02_bcd7segdecoder_activehdl\bcd7segdecoder\compile\Demo.vhd
-- Generated   : Fri Nov  8 14:46:41 2013
-- From        : E:/workspaces/ws_actel/02_bcd7segdecoder_activehdl/bcd7segdecoder/src/Demo.bde
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


entity Demo is
  port(
       In1 : in STD_LOGIC;
       In2 : in STD_LOGIC;
       In3 : in STD_LOGIC;
       S : in STD_LOGIC;
       Output : out STD_LOGIC
  );
end Demo;

architecture Demo of Demo is

---- Signal declarations used on the diagram ----

signal NET_AND : STD_LOGIC;
signal NET_MUX : STD_LOGIC;

begin

----  Component instantiations  ----

NET_AND <= not(In2) and not(In1);

Output <= NET_MUX;

NET_MUX <= (not(NET_AND) and not S) or (not(In3) and S);


end Demo;
