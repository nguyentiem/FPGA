-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : single_matrix
-- Author      : Nguyen Duc Tien
-- Company     : DCE, SOICT, HUST
--
-------------------------------------------------------------------------------
--
-- File        : E:\workspaces\activehdl\05_ledmatrix\ledmatrix\single_matrix\compile\nRow_Register.vhd
-- Generated   : Fri Nov 15 21:25:11 2013
-- From        : E:\workspaces\activehdl\05_ledmatrix\ledmatrix\single_matrix\SRC\nRow_Register.bde
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


entity nRow_Register is
  generic(
       ROW_WIDTH : integer := 8
  );
  port(
       CLK : in STD_LOGIC;
       CLR : in STD_LOGIC;
       WE : in STD_LOGIC;
       D : in STD_LOGIC_VECTOR(ROW_WIDTH downto 0);
       nRow : out STD_LOGIC_VECTOR(ROW_WIDTH downto 0)
  );
end nRow_Register;

architecture nRow_Register of nRow_Register is

---- Component declarations -----

component DFF
  port (
       CE : in STD_LOGIC;
       CLK : in STD_LOGIC;
       CLR : in STD_LOGIC;
       D : in STD_LOGIC;
       Q : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal BUS80 : STD_LOGIC_VECTOR (7 downto 0);

begin

----  Component instantiations  ----


----  Component array-instantiations  ----

Bit_array: for Bit_array_index in 0 to (ROW_WIDTH - 1) generate
	Bit_array : DFF
		port map(
		CLK => CLK,
		D => D(ROW_WIDTH - Bit_array_index),
		CLR => CLR,
		Q => BUS80(0 - Bit_array_index),
		CE => WE
		);
end generate;

U1_array: for U1_array_index in 0 to (ROW_WIDTH - 1) generate
	U1_array :
		nRow(U1_array_index+nRow'Low) <= not(BUS80(U1_array_index+BUS80'Low));
end generate;



end nRow_Register;
