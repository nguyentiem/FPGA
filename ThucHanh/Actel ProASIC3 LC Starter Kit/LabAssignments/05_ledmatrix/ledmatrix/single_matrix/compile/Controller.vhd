-------------------------------------------------------------------------------
--
-- Tieu de     : No Title
-- Ten thiet ke: single_matrix
-- Tac gia     : Nguyen Duc Tien
-- Don vi      : DCE, SOICT, HUST
--
-------------------------------------------------------------------------------
--
-- File        : E:\workspaces\activehdl\05_ledmatrix\ledmatrix\single_matrix\compile\Controller.vhd
-- Ngay tao    : Sun Nov 17 16:03:56 2013
-- Tu file     : E:\workspaces\activehdl\05_ledmatrix\ledmatrix\single_matrix\SRC\Controller.bde
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


entity Controller is
  generic(
       ADDR_WIDTH : integer := 3
  );
  port(
       CLK : in STD_LOGIC;
       aCLR : in STD_LOGIC;
       ADDR : out STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0)
  );
end Controller;

architecture Controller of Controller is

---- Component declarations -----

component Counter
  generic(
       BIT_WIDTH : INTEGER := 8
  );
  port (
       A : in STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0);
       B : out STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0)
  );
end component;
component GRegister
  generic(
       BIT_WIDTH : INTEGER := 8
  );
  port (
       CLK : in STD_LOGIC;
       D : in STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0);
       WE : in STD_LOGIC;
       aCLR : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0)
  );
end component;

----     Constants     -----
constant VCC_CONSTANT   : STD_LOGIC := '1';

---- Signal declarations used on the diagram ----

signal VCC : STD_LOGIC;
signal BUS223 : STD_LOGIC_VECTOR (ADDR_WIDTH-1 downto 0);
signal NET : STD_LOGIC_VECTOR (ADDR_WIDTH-1 downto 0);

begin

----  Component instantiations  ----

U1 : GRegister
  generic map (
       BIT_WIDTH => ADDR_WIDTH
  )
  port map(
       CLK => CLK,
       D => BUS223( ADDR_WIDTH-1 downto 0 ),
       Q => NET( ADDR_WIDTH-1 downto 0 ),
       WE => VCC,
       aCLR => aCLR
  );

U2 : Counter
  generic map (
       BIT_WIDTH => ADDR_WIDTH
  )
  port map(
       A => NET( ADDR_WIDTH-1 downto 0 ),
       B => BUS223( ADDR_WIDTH-1 downto 0 )
  );


---- Power , ground assignment ----

VCC <= VCC_CONSTANT;

---- Terminal assignment ----

    -- Output\buffer terminals
	ADDR <= NET( ADDR_WIDTH-1 downto 0 );


end Controller;
