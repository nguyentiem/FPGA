----------------------------------------------------------------------
-- Created by Actel SmartDesign Mon Oct 21 09:53:55 2013
-- Testbench Template
-- This is a basic testbench that instantiates your design with basic 
-- clock and reset pins connected.  If your design has special
-- clock/reset or testbench driver requirements then you should 
-- copy this file and modify it. 
----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end testbench;

architecture behavioral of testbench is

    constant SYSCLK_PERIOD : time := 100 ns;

    signal SYSCLK : std_logic := '0';
    signal NSYSRESET : std_logic := '0';

    component simple_dip_to_switch
        -- ports
        port( 
            -- Inputs
            SW1 : in std_logic_vector(0 downto 7);
            SW2 : in std_logic_vector(0 downto 7);
            SW3 : in std_logic_vector(0 downto 7);

            -- Outputs
            LED1 : out std_logic_vector(0 downto 7);
            LED3 : out std_logic_vector(0 downto 7);
            LED2 : out std_logic_vector(0 downto 7)

            -- Inouts

        );
    end component;

begin

    process
        variable vhdl_initial : BOOLEAN := TRUE;

    begin
        if ( vhdl_initial ) then
            -- Assert Reset
            NSYSRESET <= '0';
            wait for ( SYSCLK_PERIOD * 10 );
            
            NSYSRESET <= '1';
            wait;
        end if;
    end process;

    -- 10MHz Clock Driver
    SYSCLK <= not SYSCLK after (SYSCLK_PERIOD / 2.0 );

    -- Instantiate Unit Under Test:  simple_dip_to_switch
    simple_dip_to_switch_0 : simple_dip_to_switch
        -- port map
        port map( 
            -- Inputs
            SW1 => (others=> '0'),
            SW2 => (others=> '0'),
            SW3 => (others=> '0'),

            -- Outputs
            LED1 => open,
            LED3 => open,
            LED2 => open

            -- Inouts

        );

end behavioral;

