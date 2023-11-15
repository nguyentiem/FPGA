-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : sua
-- Author      : nguyenTiem
-- Company     : HUST
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\matran\sua\compile\test.vhd
-- Generated   : Tue Nov 26 13:17:28 2019
-- From        : c:/My_Designs/matran/sua/src/test.bde
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
       in1 : in STD_LOGIC;
       in2 : in STD_LOGIC;
       in3 : in STD_LOGIC;
       in4 : in STD_LOGIC;
       in5 : in STD_LOGIC;
       in6 : in STD_LOGIC;
       in7 : in STD_LOGIC;
       in8 : in STD_LOGIC;
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

component mul_matrix
  port (
       Clk : in STD_LOGIC;
       Sl1 : in STD_LOGIC;
       Sl2 : in STD_LOGIC;
       Sl_A : in STD_LOGIC;
       in1 : in STD_LOGIC;
       in2 : in STD_LOGIC;
       in3 : in STD_LOGIC;
       in4 : in STD_LOGIC;
       in5 : in STD_LOGIC;
       in6 : in STD_LOGIC;
       in7 : in STD_LOGIC;
       in8 : in STD_LOGIC;
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

begin

----  Component instantiations  ----

U1 : mul_matrix
  port map(
       Clk => Clk,
       Sl1 => Sl1,
       Sl2 => Sl2,
       Sl_A => Sl_A,
       c11 => c11,
       c12 => c12,
       c13 => c13,
       c21 => c21,
       c22 => c22,
       c23 => c23,
       c31 => c31,
       c32 => c32,
       c33 => c33,
       in1 => in1,
       in2 => in2,
       in3 => in3,
       in4 => in4,
       in5 => in5,
       in6 => in6,
       in7 => in7,
       in8 => in8
  );


end test;
