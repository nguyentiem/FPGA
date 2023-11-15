-------------------------------------------------------------------------------
--
-- Title       : Counter
-- Design      : single_matrix
-- Author      : Nguyen Duc Tien
-- Company     : DCE, SOICT, HUST
--
-------------------------------------------------------------------------------
--
-- File        : Counter.vhd
-- Generated   : Fri Nov 15 23:42:38 2013
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Counter} architecture {Counter}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity Counter is
    generic (
        BIT_WIDTH : integer := 8
     );
    port(
        A : in STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0);
        B : out STD_LOGIC_VECTOR(BIT_WIDTH-1 downto 0)
    );
end Counter;

architecture Counter of Counter is
begin
     B <= A + 1;
end Counter;
