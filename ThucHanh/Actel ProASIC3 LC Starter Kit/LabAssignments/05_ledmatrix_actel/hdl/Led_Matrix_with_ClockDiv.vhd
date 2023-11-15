-- Led_Matrix_with_ClockDiv.vhd

library IEEE; 
use ieee.std_logic_1164.all;

entity led_matrix_with_clockdiv is
   port  (
       CLK : in STD_LOGIC;
       aReset : in STD_LOGIC;
       RowIndex : out STD_LOGIC_VECTOR(STEP_WIDTH-1 downto 0);
       nRow : out STD_LOGIC_VECTOR(ROW_WIDTH-1 downto 0)
   )
end entity led_matrix_with_clockdiv

architecture behavior of led_matrix_with_clockdiv is

--- khai bao su dung IC Led_Matrix_Controller_With_Rom
component Led_Matrix_Controller_With_Rom is
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
------------------------------------------------------

begin


end architecture;

