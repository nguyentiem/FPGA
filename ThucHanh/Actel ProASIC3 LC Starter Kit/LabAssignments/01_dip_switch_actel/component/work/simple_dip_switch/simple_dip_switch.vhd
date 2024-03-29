----------------------------------------------------------------------
-- Created by SmartDesign Tue Nov 27 12:28:15 2018
-- Version: v11.8 11.8.0.26
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library proasic3;
use proasic3.all;
----------------------------------------------------------------------
-- simple_dip_switch entity declaration
----------------------------------------------------------------------
entity simple_dip_switch is
    -- Port list
    port(
        -- Inputs
        SW2  : in  std_logic_vector(0 to 7);
        -- Outputs
        LED1 : out std_logic_vector(0 to 7);
        LED3 : out std_logic_vector(0 to 7)
        );
end simple_dip_switch;
----------------------------------------------------------------------
-- simple_dip_switch architecture body
----------------------------------------------------------------------
architecture RTL of simple_dip_switch is
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal LED2_net_0 : std_logic_vector(0 to 7);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net    : std_logic;
signal VCC_net    : std_logic;

begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net    <= '0';
 VCC_net    <= '1';
----------------------------------------------------------------------
-- TieOff assignments
----------------------------------------------------------------------
 LED1(0)      <= '0';
 LED1(1)      <= '1';
 LED1(2)      <= '0';
 LED1(3)      <= '1';
 LED1(4)      <= '0';
 LED1(5)      <= '1';
 LED1(6)      <= '0';
 LED1(7)      <= '1';
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 LED2_net_0   <= SW2;
 LED3(0 to 7) <= LED2_net_0;

end RTL;
