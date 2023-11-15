-------------------------------------------------------------------------------
--
-- Tieu de     : Led_Matrix_Controller_ClockDiv
-- Ten thiet ke: single_matrix
-- Tac gia     : Nguyen Duc Tien
-- Don vi      : DCE, SOICT, HUST
--
-------------------------------------------------------------------------------
--
-- File        : E:\workspaces\activehdl\05_ledmatrix\ledmatrix\single_matrix\compile\Led_Matrix_Controller_ClockDiv.vhd
-- Ngay tao    : Tue Nov 26 11:26:02 2013
-- Tu file     : E:\workspaces\activehdl\05_ledmatrix\ledmatrix\single_matrix\SRC\TOP\Led_Matrix_Controller_ClockDiv.bde
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


entity Led_Matrix_Controller_ClockDiv is
  generic(
       ROW_WIDTH : integer := 8;
       ADDR_WIDTH : integer := 3;
       STEP_WIDTH : integer := 8
  );
  port(
       CLK : in STD_LOGIC;
       aReset : in STD_LOGIC;
       G1Hz : out STD_LOGIC;
       RowIndex : out STD_LOGIC_VECTOR(STEP_WIDTH-1 downto 0);
       nRow : out STD_LOGIC_VECTOR(ROW_WIDTH-1 downto 0)
  );
end Led_Matrix_Controller_ClockDiv;

architecture Led_Matrix_Controller_ClockDiv of Led_Matrix_Controller_ClockDiv is

---- Component declarations -----

component counter1M
  port (
       CLK : in STD_LOGIC;
       aReset : in STD_LOGIC;
       G1024Hz : out STD_LOGIC;
       G128Hz : out STD_LOGIC;
       G1Hz : out STD_LOGIC;
       G2Hz : out STD_LOGIC;
       G32Hz : out STD_LOGIC;
       G4Hz : out STD_LOGIC;
       G8Hz : out STD_LOGIC
  );
end component;
component counter40
  port (
       CLK : in STD_LOGIC;
       aReset : in STD_LOGIC;
       G : buffer STD_LOGIC
  );
end component;
component Led_Matrix_Controller_With_Rom
  generic(
       ADDR_WIDTH : INTEGER := 3;
       ROW_WIDTH : INTEGER := 8;
       STEP_WIDTH : INTEGER := 8
  );
  port (
       CLK : in STD_LOGIC;
       aReset : in STD_LOGIC;
       RowIndex : out STD_LOGIC_VECTOR(STEP_WIDTH-1 downto 0);
       nRow : out STD_LOGIC_VECTOR(ROW_WIDTH-1 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal NET199 : STD_LOGIC;
signal NET230 : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : Led_Matrix_Controller_With_Rom
  port map(
       CLK => NET230,
       RowIndex => RowIndex( STEP_WIDTH-1 downto 0 ),
       aReset => aReset,
       nRow => nRow( ROW_WIDTH-1 downto 0 )
  );

U2 : counter40
  port map(
       CLK => CLK,
       G => NET199,
       aReset => aReset
  );

U3 : counter1M
  port map(
       CLK => NET199,
       G1Hz => G1Hz,
       G32Hz => NET230,
       aReset => aReset
  );


end Led_Matrix_Controller_ClockDiv;
