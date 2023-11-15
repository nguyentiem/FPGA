-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : single_matrix
-- Author      : Nguyen Duc Tien
-- Company     : DCE, SOICT, HUST
--
-------------------------------------------------------------------------------
--
-- File        : E:\workspaces\activehdl\05_ledmatrix\ledmatrix\single_matrix\compile\Register.vhd
-- Generated   : Fri Nov 15 21:25:11 2013
-- From        : E:\workspaces\activehdl\05_ledmatrix\ledmatrix\single_matrix\SRC\Register.bde
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

entity GRegister is
  generic(
       BIT_WIDTH : integer := 8
  );
  port(
       CLK  : in STD_LOGIC;
       aCLR : in STD_LOGIC;
       WE   : in STD_LOGIC;
       D    : in STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0);
       Q    : out STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0)
  );
end GRegister;

architecture behavior of GRegister is
begin
    process (CLK, aCLR)
    begin
        if aCLR = '1' then
            Q <= (others => '0');
        elsif rising_edge(CLK) then
            if WE = '1' then
                Q <= D;
            end if;    
		end if; 
    end process;
end behavior;
