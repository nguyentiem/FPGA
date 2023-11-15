-------------------------------------------------------------------------------
--
-- Tieu de     : No Title
-- Ten thiet ke: slow_counter
-- Tac gia     : Nguyen Duc Tien
-- Don vi      : DCE, SOICT, HUST
--
-------------------------------------------------------------------------------
--
-- File        : E:\workspaces\activehdl\03_counter\slow_counter\compile\top.vhd
-- Ngay tao    : Wed Nov 27 09:37:02 2013
-- Tu file     : E:\workspaces\activehdl\03_counter\slow_counter\SRC\top.bde
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


entity top is
  port(
       CLK : in STD_LOGIC;--	 Tan so 40MHz,  lay tu CLK co  san tren Kit
       Key : in STD_LOGIC;
       aReset : in STD_LOGIC;
       G1024Hz : out STD_LOGIC;
       G128Hz : out STD_LOGIC;
       G1Hz : out STD_LOGIC;
       G2Hz : out STD_LOGIC;
       G32Hz : out STD_LOGIC;
       G4Hz : out STD_LOGIC;
       G8Hz : out STD_LOGIC;
       L7seg_a : out STD_LOGIC;
       L7seg_b : out STD_LOGIC;
       L7seg_c : out STD_LOGIC;
       L7seg_d : out STD_LOGIC;
       L7seg_e : out STD_LOGIC;
       L7seg_f : out STD_LOGIC;
       L7seg_g : out STD_LOGIC;
       Led : out STD_LOGIC_VECTOR(3 downto 0)
  );
end top;

architecture top of top is

---- Component declarations -----

component counter
  port (
       CLK : in STD_LOGIC;
       aReset : in STD_LOGIC;
       Q : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
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
component DM74LS47
  port (
       Ain : in STD_LOGIC;
       Bin : in STD_LOGIC;
       Cin : in STD_LOGIC;
       Din : in STD_LOGIC;
       a : out STD_LOGIC;
       b : out STD_LOGIC;
       c : out STD_LOGIC;
       d : out STD_LOGIC;
       e : out STD_LOGIC;
       f : out STD_LOGIC;
       g : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal NET93 : STD_LOGIC;
signal Cv : STD_LOGIC_VECTOR (3 downto 0);

begin

----  Component instantiations  ----

--Bo chia tan so
--tu 1MHz ve cac
--tan so 1Hz, 2Hz
ClockDiv_1M : counter1M
  port map(
       CLK => NET93,
       G1024Hz => G1024Hz,
       G128Hz => G128Hz,
       G1Hz => G1Hz,
       G2Hz => G2Hz,
       G32Hz => G32Hz,
       G4Hz => G4Hz,
       G8Hz => G8Hz,
       aReset => aReset
  );

--Bo chia tan so
--tu 40MHz ve
--1MHz
ClockDiv_40x : counter40
  port map(
       CLK => CLK,
       G => NET93,
       aReset => aReset
  );

--Bo dem so lan
--bam phim 
--tren Kit
KeyPressCounter : counter
  port map(
       CLK => Key,
       Q => Cv,
       aReset => aReset
  );

--Bo giai ma
--den led 7 doan
Led7Seg_Decoder : DM74LS47
  port map(
       Ain => Cv(0),
       Bin => Cv(1),
       Cin => Cv(2),
       Din => Cv(3),
       a => L7seg_a,
       b => L7seg_b,
       c => L7seg_c,
       d => L7seg_d,
       e => L7seg_e,
       f => L7seg_f,
       g => L7seg_g
  );


---- Terminal assignment ----

    -- Output\buffer terminals
	Led <= Cv;


end top;
