-------------------------------------------------------------------------------
--
-- Title       : Column_Register
-- Design      : single_matrix
-- Author      : Nguyen Duc Tien
-- Company     : DCE, SOICT, HUST
--
-------------------------------------------------------------------------------
--
-- File        : Column_Register.vhd
-- Generated   : Fri Nov 15 21:08:08 2013
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
--{entity {Column_Register} architecture {behavior}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Step_Register is
    generic ( 
        STEP_WIDTH : integer :=8   --! So luong dong ma IC dieu khien. Trong 1 thoi diem, chi co 1 dong co den sang
    );  
	port(
        CLK    : in STD_LOGIC;      --! Tin hieu dong ho, tich cuc duong.
		aReset : in STD_LOGIC;      --! Tin hieu khoi tao gia tri ve 10000000. 
		Q : buffer STD_LOGIC_VECTOR(STEP_WIDTH-1 downto 0)
	);
end Step_Register;

--}} End of automatically maintained section

architecture behavior of Step_Register is
begin
    process (CLK, aReset)
    begin                       
        if aReset = '1' then       
            Q(STEP_WIDTH-1) <= '1';
            Q(STEP_WIDTH-2 downto 0) <= (others => '0');
        elsif rising_edge(CLK) then                                        
            --- Quay bit sang trai.
            Q <= Q(STEP_WIDTH-2 downto 0) & Q(STEP_WIDTH-1) ;
		 end if; 
    end process;
end behavior;
