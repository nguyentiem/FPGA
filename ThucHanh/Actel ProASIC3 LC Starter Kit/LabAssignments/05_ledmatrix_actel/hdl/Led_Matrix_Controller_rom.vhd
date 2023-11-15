-------------------------------------------------------------------------------
--
-- Tieu de     : Led_Matrix_Controller
-- Ten thiet ke: single_matrix
-- Tac gia     : Nguyen Duc Tien
-- Don vi      : DCE, SOICT, HUST
--
-------------------------------------------------------------------------------
--
-- File        : E:\workspaces\activehdl\05_ledmatrix\ledmatrix\single_matrix\compile\Led_Matrix_Controller_rom.vhd
-- Ngay tao    : Wed Nov 20 22:04:30 2013
-- Tu file     : E:\workspaces\activehdl\05_ledmatrix\ledmatrix\single_matrix\SRC\Led_Matrix_Controller_rom.bde
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


entity Led_Matrix_Controller_With_Rom is
  generic(
       ROW_WIDTH : integer := 8;
       ADDR_WIDTH : integer := 3;
       STEP_WIDTH : integer := 8
  );
  port(
       CLK : in STD_LOGIC;
       aReset : in STD_LOGIC;
       RowIndex : out STD_LOGIC_VECTOR(STEP_WIDTH-1 downto 0);
       nRow : out STD_LOGIC_VECTOR(ROW_WIDTH-1 downto 0)
  );
end Led_Matrix_Controller_With_Rom;

architecture Led_Matrix_Controller_With_Rom of Led_Matrix_Controller_With_Rom is

---- Component declarations -----

component Controller
  generic(
       ADDR_WIDTH : integer := 3
  );
  port (
       CLK : in STD_LOGIC;
       aCLR : in STD_LOGIC;
       ADDR : out STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0)
  );
end component;
component rom
  generic(
       ADDR_WIDTH : INTEGER := 3;
       ROW_WIDTH : INTEGER := 8
  );
  port (
       ADDR : in STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);
       CLK : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR(ROW_WIDTH-1 downto 0)
  );
end component;
component Step_Register
  generic(
       STEP_WIDTH : INTEGER := 8
  );
  port (
       CLK : in STD_LOGIC;
       aReset : in STD_LOGIC;
       Q : buffer STD_LOGIC_VECTOR(STEP_WIDTH-1 downto 0)
  );
end component;

---- Architecture declarations -----
--- Tin hieu aReset noi voi bo dieu khien thanh ghi dich quet dong ROW_SCAN_REG,
--- va  bo dieu khien dia chi Ram chua gia tri dong ADDR_AUTOINC, se bao dam,
--- row index phu hop voi row's value.

--- De tao ra gia tri quet dong COLUM,N  chi can 1 chu ki CLK o  component
---  la ROW_SCAN_REG
--- De tao ra gia tri dong ROW, phai co 2 chu ki CLK o  component ADDR_AUTOINC va
--- ROW_VALUE_RAM

--- Viec khoi tao thanh ghi ROW_SCAN_REG = "1000000" la boi vi, tin hieu aReset la
--- khong dong do, lam thay doi ngay lap tuc toi gia tri dau ra Column cua thanh ghi quet
--- dong ROW_SCAN_REG, va thay doi ngay dia chi ADDR cua ROW_VALUE_RAM. 
--- Nhung ROW_VALUE_RAM mat them 1 chu ki CLK nua thi moi chot duoc 
--- gia tri ROW tuong ung voi ADDR do.  


---- Signal declarations used on the diagram ----

signal BUS2202 : STD_LOGIC_VECTOR (ADDR_WIDTH-1 downto 0);
signal ROW : STD_LOGIC_VECTOR (ROW_WIDTH-1 downto 0);

begin

----  Component instantiations  ----

ADDR_AUTOINC : Controller
  generic map (
       ADDR_WIDTH => ADDR_WIDTH
  )
  port map(
       ADDR => BUS2202( ADDR_WIDTH-1 downto 0 ),
       CLK => CLK,
       aCLR => aReset
  );

ROW_SCAN_REG : Step_Register
  generic map (
       STEP_WIDTH => STEP_WIDTH
  )
  port map(
       CLK => CLK,
       Q => RowIndex( STEP_WIDTH-1 downto 0 ),
       aReset => aReset
  );

ROW_VALUE_ROM : rom
  port map(
       ADDR => BUS2202( ADDR_WIDTH-1 downto 0 ),
       CLK => CLK,
       Q => ROW( ROW_WIDTH-1 downto 0 )
  );


----  Component array-instantiations  ----

U2_array: for U2_array_index in 0 to (ROW_WIDTH - 1) generate
	U2_array :
		nRow(U2_array_index+nRow'Low) <= not(ROW(U2_array_index+ROW'Low));
end generate;



end Led_Matrix_Controller_With_Rom;
