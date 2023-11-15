-------------------------------------------------------------------------------
--
-- Tieu de     : Single_Key_Controller
-- Ten thiet ke: keymatrix
-- Tac gia     : Nguyen Duc Tien
-- Don vi      : DCE, SOICT, HUST
--
-------------------------------------------------------------------------------
--
-- File        : E:\workspaces\activehdl\06_keymatrix\keymatrix\keymatrix\compile\Single_Key_Controller.vhd
-- Ngay tao    : Thu Nov 28 01:25:42 2013
-- Tu file     : E:\workspaces\activehdl\06_keymatrix\keymatrix\keymatrix\SRC\Single_Key_Controller.bde
-- Boi         : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Mo ta       : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;


entity Single_Key_Controller is
  port(
       CE : in STD_LOGIC;--	 CE duoc dieu khien boi tin hieu  dieu khien quet dong
       CLK : in STD_LOGIC;
       Key : in STD_LOGIC;
       Press : out STD_LOGIC;
       Q : out STD_LOGIC;
       Release : out STD_LOGIC
  );
end Single_Key_Controller;

architecture Single_Key_Controller of Single_Key_Controller is

---- Component declarations -----

component DFF
  port (
       CE : in STD_LOGIC;
       CLK : in STD_LOGIC;
       CLR : in STD_LOGIC;
       D : in STD_LOGIC;
       PR : in STD_LOGIC;
       Q : out STD_LOGIC
  );
end component;

----     Constants     -----
constant GND_CONSTANT   : STD_LOGIC := '0';

---- Signal declarations used on the diagram ----

signal GND : STD_LOGIC;
signal netq : STD_LOGIC;

begin

----  Component instantiations  ----

OneBit : DFF
  port map(
       CE => CE,
       CLK => CLK,
       CLR => GND,
       D => Key,
       PR => GND,
       Q => netq
  );

Release <= not(Key) and netq;

Press <= not(netq) and Key;


---- Power , ground assignment ----

GND <= GND_CONSTANT;

---- Terminal assignment ----

    -- Output\buffer terminals
	Q <= netq;


end Single_Key_Controller;
