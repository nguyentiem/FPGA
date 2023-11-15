-------------------------------------------------------------------------------
--
-- Tieu de     : Led_Matrix_Controller
-- Ten thiet ke: keymatrix
-- Tac gia     : Nguyen Duc Tien
-- Don vi      : DCE, SOICT, HUST
--
-------------------------------------------------------------------------------
--
-- File        : E:\workspaces\activehdl\06_keymatrix\keymatrix\keymatrix\compile\Key_Matrix_Controller.vhd
-- Ngay tao    : Thu Nov 28 01:37:45 2013
-- Tu file     : E:\workspaces\activehdl\06_keymatrix\keymatrix\keymatrix\SRC\TOP\Key_Matrix_Controller.bde
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


entity Key_Matrix_Controller is
  port(
       CLK : in STD_LOGIC;
       aReset : in STD_LOGIC;
       nRow : in STD_LOGIC_VECTOR(2 downto 0);
       K : out STD_LOGIC_VECTOR(5 downto 0)
  );
end Key_Matrix_Controller;

architecture Key_Matrix_Controller of Key_Matrix_Controller is

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
component Single_Key_Controller
  port (
       CE : in STD_LOGIC;--	 CE duoc dieu khien boi tin hieu  dieu khien quet dong
       CLK : in STD_LOGIC;
       Key : in STD_LOGIC;
       Press : out STD_LOGIC;
       Q : out STD_LOGIC;
       Release : out STD_LOGIC
  );
end component;

---- Architecture declarations -----
---  Thiet ke sau chi phu hop voi ban phim 3x2 tren board Actel Starter Kit.
---   Sau khi bam nut aReset, cac bit cua thanh ghi quet dong SL nhan gia tri la 0 1 1 1 1 voi
---   LSB bit bang 0, tuc la ngay lap tuc quet dong 1 tro di


----     Constants     -----
constant VCC_CONSTANT   : STD_LOGIC := '1';
constant GND_CONSTANT   : STD_LOGIC := '0';

---- Signal declarations used on the diagram ----

signal GND : STD_LOGIC;
signal NET7664 : STD_LOGIC;
signal NET8179 : STD_LOGIC;
signal NET8206 : STD_LOGIC;
signal SLq1 : STD_LOGIC;
signal SLq2 : STD_LOGIC;
signal VCC : STD_LOGIC;

begin

----  Component instantiations  ----

Key1 : Single_Key_Controller
  port map(
       CE => NET8179,
       CLK => CLK,
       Key => nRow(0),
       Q => K(0)
  );

Key2 : Single_Key_Controller
  port map(
       CE => NET8179,
       CLK => CLK,
       Key => nRow(1),
       Q => K(1)
  );

Key3 : Single_Key_Controller
  port map(
       CE => NET8179,
       CLK => CLK,
       Key => nRow(2),
       Q => K(2)
  );

Key4 : Single_Key_Controller
  port map(
       CE => NET8206,
       CLK => NET7664,
       Key => nRow(0),
       Q => K(3)
  );

Key5 : Single_Key_Controller
  port map(
       CE => NET8206,
       CLK => CLK,
       Key => nRow(1),
       Q => K(4)
  );

Key6 : Single_Key_Controller
  port map(
       CE => NET8206,
       CLK => CLK,
       Key => nRow(2),
       Q => K(5)
  );

SL1 : DFF
  port map(
       CE => VCC,
       CLK => CLK,
       CLR => aReset,
       D => SLq2,
       PR => GND,
       Q => SLq1
  );

SL2 : DFF
  port map(
       CE => VCC,
       CLK => CLK,
       CLR => GND,
       D => SLq1,
       PR => aReset,
       Q => SLq2
  );

NET8179 <= not(SLq2);

NET8206 <= not(SLq1);


---- Power , ground assignment ----

VCC <= VCC_CONSTANT;
GND <= GND_CONSTANT;

end Key_Matrix_Controller;
