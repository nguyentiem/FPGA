-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : matrix
-- Author      : nguyenTiem
-- Company     : HUST
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\baiTapLon\matrix\compile\test.vhd
-- Generated   : Mon Nov 25 20:30:49 2019
-- From        : c:/My_Designs/baiTapLon/matrix/src/test.bde
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;

entity test is
  port(
       Clk : in STD_LOGIC;
       Sl1 : in STD_LOGIC;
       Sl2 : in STD_LOGIC;
       Sl_A : in STD_LOGIC;
       in1 : in STD_LOGIC_VECTOR(7 downto 0);
       in2 : in STD_LOGIC_VECTOR(7 downto 0);
       in3 : in STD_LOGIC_VECTOR(7 downto 0);
       in4 : in STD_LOGIC_VECTOR(7 downto 0);
       in5 : in STD_LOGIC_VECTOR(7 downto 0);
       in6 : in STD_LOGIC_VECTOR(7 downto 0);
       in7 : in STD_LOGIC_VECTOR(7 downto 0);
       in8 : in STD_LOGIC_VECTOR(7 downto 0);
       in9 : in STD_LOGIC_VECTOR(7 downto 0);
       c11 : out STD_LOGIC_VECTOR(7 downto 0);
       c12 : out STD_LOGIC_VECTOR(7 downto 0);
       c13 : out STD_LOGIC_VECTOR(7 downto 0);
       c21 : out STD_LOGIC_VECTOR(7 downto 0);
       c22 : out STD_LOGIC_VECTOR(7 downto 0);
       c23 : out STD_LOGIC_VECTOR(7 downto 0);
       c31 : out STD_LOGIC_VECTOR(7 downto 0);
       c32 : out STD_LOGIC_VECTOR(7 downto 0);
       c33 : out STD_LOGIC_VECTOR(7 downto 0)
  );
end test;

architecture test of test is

---- Component declarations -----

component latch
  port (
       Clk : in STD_LOGIC;
       Sl1 : in STD_LOGIC;
       Sl2 : in STD_LOGIC;
       Sl_A : in STD_LOGIC;
       in1 : in STD_LOGIC_VECTOR(7 downto 0);
       in2 : in STD_LOGIC_VECTOR(7 downto 0);
       in3 : in STD_LOGIC_VECTOR(7 downto 0);
       in4 : in STD_LOGIC_VECTOR(7 downto 0);
       in5 : in STD_LOGIC_VECTOR(7 downto 0);
       in6 : in STD_LOGIC_VECTOR(7 downto 0);
       in7 : in STD_LOGIC_VECTOR(7 downto 0);
       in8 : in STD_LOGIC_VECTOR(7 downto 0);
       in9 : in STD_LOGIC_VECTOR(7 downto 0);
       out11 : out STD_LOGIC_VECTOR(7 downto 0);
       out12 : out STD_LOGIC_VECTOR(7 downto 0);
       out13 : out STD_LOGIC_VECTOR(7 downto 0);
       out14 : out STD_LOGIC_VECTOR(7 downto 0);
       out15 : out STD_LOGIC_VECTOR(7 downto 0);
       out16 : out STD_LOGIC_VECTOR(7 downto 0);
       out17 : out STD_LOGIC_VECTOR(7 downto 0);
       out18 : out STD_LOGIC_VECTOR(7 downto 0);
       out19 : out STD_LOGIC_VECTOR(7 downto 0);
       out21 : out STD_LOGIC_VECTOR(7 downto 0);
       out22 : out STD_LOGIC_VECTOR(7 downto 0);
       out23 : out STD_LOGIC_VECTOR(7 downto 0);
       out24 : out STD_LOGIC_VECTOR(7 downto 0);
       out25 : out STD_LOGIC_VECTOR(7 downto 0);
       out26 : out STD_LOGIC_VECTOR(7 downto 0);
       out27 : out STD_LOGIC_VECTOR(7 downto 0);
       out28 : out STD_LOGIC_VECTOR(7 downto 0);
       out29 : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component xl_byte
  port (
       a11 : in STD_LOGIC_VECTOR(7 downto 0);
       a12 : in STD_LOGIC_VECTOR(7 downto 0);
       a13 : in STD_LOGIC_VECTOR(7 downto 0);
       a21 : in STD_LOGIC_VECTOR(7 downto 0);
       a22 : in STD_LOGIC_VECTOR(7 downto 0);
       a23 : in STD_LOGIC_VECTOR(7 downto 0);
       a31 : in STD_LOGIC_VECTOR(7 downto 0);
       a32 : in STD_LOGIC_VECTOR(7 downto 0);
       a33 : in STD_LOGIC_VECTOR(7 downto 0);
       b11 : in STD_LOGIC_VECTOR(7 downto 0);
       b12 : in STD_LOGIC_VECTOR(7 downto 0);
       b13 : in STD_LOGIC_VECTOR(7 downto 0);
       b21 : in STD_LOGIC_VECTOR(7 downto 0);
       b22 : in STD_LOGIC_VECTOR(7 downto 0);
       b23 : in STD_LOGIC_VECTOR(7 downto 0);
       b31 : in STD_LOGIC_VECTOR(7 downto 0);
       b32 : in STD_LOGIC_VECTOR(7 downto 0);
       b33 : in STD_LOGIC_VECTOR(7 downto 0);
       c11 : out STD_LOGIC_VECTOR(7 downto 0);
       c12 : out STD_LOGIC_VECTOR(7 downto 0);
       c13 : out STD_LOGIC_VECTOR(7 downto 0);
       c21 : out STD_LOGIC_VECTOR(7 downto 0);
       c22 : out STD_LOGIC_VECTOR(7 downto 0);
       c23 : out STD_LOGIC_VECTOR(7 downto 0);
       c31 : out STD_LOGIC_VECTOR(7 downto 0);
       c32 : out STD_LOGIC_VECTOR(7 downto 0);
       c33 : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal BUS302103 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS302107 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS302111 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS302115 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS30229 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS30233 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS30237 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS30241 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS30245 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS30249 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS30253 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS30269 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS30273 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS30277 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS30281 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS30285 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS30289 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS30293 : STD_LOGIC_VECTOR(7 downto 0);

begin

----  Component instantiations  ----

U1 : xl_byte
  port map(
       a11 => BUS30229,
       a12 => BUS30233,
       a13 => BUS30237,
       a21 => BUS30241,
       a22 => BUS30245,
       a23 => BUS30249,
       a31 => BUS30253,
       a32 => BUS30269,
       a33 => BUS30273,
       b11 => BUS30277,
       b12 => BUS30281,
       b13 => BUS30285,
       b21 => BUS30289,
       b22 => BUS30293,
       b23 => BUS302103,
       b31 => BUS302107,
       b32 => BUS302111,
       b33 => BUS302115,
       c11 => c11,
       c12 => c12,
       c13 => c13,
       c21 => c21,
       c22 => c22,
       c23 => c23,
       c31 => c31,
       c32 => c32,
       c33 => c33
  );

U3 : latch
  port map(
       Clk => Clk,
       Sl1 => Sl1,
       Sl2 => Sl2,
       Sl_A => Sl_A,
       in1 => in1,
       in2 => in2,
       in3 => in3,
       in4 => in4,
       in5 => in5,
       in6 => in6,
       in7 => in7,
       in8 => in8,
       in9 => in9,
       out11 => BUS30229,
       out12 => BUS30233,
       out13 => BUS30237,
       out14 => BUS30241,
       out15 => BUS30245,
       out16 => BUS30249,
       out17 => BUS30253,
       out18 => BUS30269,
       out19 => BUS30273,
       out21 => BUS30277,
       out22 => BUS30281,
       out23 => BUS30285,
       out24 => BUS30289,
       out25 => BUS30293,
       out26 => BUS302103,
       out27 => BUS302107,
       out28 => BUS302111,
       out29 => BUS302115
  );


end test;
