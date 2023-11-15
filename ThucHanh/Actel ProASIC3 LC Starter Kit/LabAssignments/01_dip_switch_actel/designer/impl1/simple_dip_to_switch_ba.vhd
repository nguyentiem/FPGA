-- Version: 9.1 9.1.0.18
-- File used only for Simulation

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity simple_dip_to_switch is

    port( SW2  : in    std_logic_vector(0 to 7);
          LED1 : out   std_logic_vector(0 to 7);
          PIN  : out   std_logic_vector(0 to 7)
        );

end simple_dip_to_switch;

architecture DEF_ARCH of simple_dip_to_switch is 

  component IOIN_IB
    port( YIN : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;

  component IOPAD_TRI
    port( D   : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          PAD : out   std_logic
        );
  end component;

  component IOTRI_OB_EB
    port( D    : in    std_logic := 'U';
          E    : in    std_logic := 'U';
          DOUT : out   std_logic;
          EOUT : out   std_logic
        );
  end component;

  component IOPAD_IN
    port( PAD : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;

  component GND
    port(Y : out std_logic); 
  end component;

  component VCC
    port(Y : out std_logic); 
  end component;

    signal \GND\, \PIN_c_c[7]\, \PIN_c_c[6]\, \PIN_c_c[5]\, 
        \PIN_c_c[4]\, \PIN_c_c[3]\, \PIN_c_c[2]\, \PIN_c_c[1]\, 
        \PIN_c_c[0]\, \LED1_pad[1]/U0/NET1\, 
        \LED1_pad[1]/U0/NET2\, \PIN_pad[2]/U0/NET1\, 
        \PIN_pad[2]/U0/NET2\, \LED1_pad[0]/U0/NET1\, 
        \LED1_pad[0]/U0/NET2\, \PIN_pad[4]/U0/NET1\, 
        \PIN_pad[4]/U0/NET2\, \PIN_pad[3]/U0/NET1\, 
        \PIN_pad[3]/U0/NET2\, \LED1_pad[7]/U0/NET1\, 
        \LED1_pad[7]/U0/NET2\, \SW2_pad[2]/U0/NET1\, 
        \SW2_pad[3]/U0/NET1\, \PIN_pad[7]/U0/NET1\, 
        \PIN_pad[7]/U0/NET2\, \LED1_pad[5]/U0/NET1\, 
        \LED1_pad[5]/U0/NET2\, \SW2_pad[1]/U0/NET1\, 
        \SW2_pad[6]/U0/NET1\, \PIN_pad[5]/U0/NET1\, 
        \PIN_pad[5]/U0/NET2\, \SW2_pad[5]/U0/NET1\, 
        \PIN_pad[6]/U0/NET1\, \PIN_pad[6]/U0/NET2\, 
        \SW2_pad[4]/U0/NET1\, \PIN_pad[1]/U0/NET1\, 
        \PIN_pad[1]/U0/NET2\, \SW2_pad[7]/U0/NET1\, 
        \LED1_pad[4]/U0/NET1\, \LED1_pad[4]/U0/NET2\, 
        \LED1_pad[3]/U0/NET1\, \LED1_pad[3]/U0/NET2\, 
        \PIN_pad[0]/U0/NET1\, \PIN_pad[0]/U0/NET2\, 
        \LED1_pad[6]/U0/NET1\, \LED1_pad[6]/U0/NET2\, 
        \SW2_pad[0]/U0/NET1\, \LED1_pad[2]/U0/NET1\, 
        \LED1_pad[2]/U0/NET2\, \VCC\, AFLSDF_VCC, AFLSDF_GND
         : std_logic;
    signal GND_power_net1 : std_logic;
    signal VCC_power_net1 : std_logic;

begin 

    AFLSDF_GND <= GND_power_net1;
    \GND\ <= GND_power_net1;
    \VCC\ <= VCC_power_net1;
    AFLSDF_VCC <= VCC_power_net1;

    \SW2_pad[7]/U0/U1\ : IOIN_IB
      port map(YIN => \SW2_pad[7]/U0/NET1\, Y => \PIN_c_c[7]\);
    
    \LED1_pad[5]/U0/U0\ : IOPAD_TRI
      port map(D => \LED1_pad[5]/U0/NET1\, E => 
        \LED1_pad[5]/U0/NET2\, PAD => LED1(5));
    
    \LED1_pad[5]/U0/U1\ : IOTRI_OB_EB
      port map(D => \VCC\, E => \VCC\, DOUT => 
        \LED1_pad[5]/U0/NET1\, EOUT => \LED1_pad[5]/U0/NET2\);
    
    \SW2_pad[3]/U0/U1\ : IOIN_IB
      port map(YIN => \SW2_pad[3]/U0/NET1\, Y => \PIN_c_c[3]\);
    
    \LED1_pad[6]/U0/U0\ : IOPAD_TRI
      port map(D => \LED1_pad[6]/U0/NET1\, E => 
        \LED1_pad[6]/U0/NET2\, PAD => LED1(6));
    
    \LED1_pad[6]/U0/U1\ : IOTRI_OB_EB
      port map(D => \GND\, E => \VCC\, DOUT => 
        \LED1_pad[6]/U0/NET1\, EOUT => \LED1_pad[6]/U0/NET2\);
    
    \SW2_pad[2]/U0/U1\ : IOIN_IB
      port map(YIN => \SW2_pad[2]/U0/NET1\, Y => \PIN_c_c[2]\);
    
    \PIN_pad[2]/U0/U0\ : IOPAD_TRI
      port map(D => \PIN_pad[2]/U0/NET1\, E => 
        \PIN_pad[2]/U0/NET2\, PAD => PIN(2));
    
    \PIN_pad[6]/U0/U1\ : IOTRI_OB_EB
      port map(D => \PIN_c_c[6]\, E => \VCC\, DOUT => 
        \PIN_pad[6]/U0/NET1\, EOUT => \PIN_pad[6]/U0/NET2\);
    
    \SW2_pad[0]/U0/U1\ : IOIN_IB
      port map(YIN => \SW2_pad[0]/U0/NET1\, Y => \PIN_c_c[0]\);
    
    \SW2_pad[6]/U0/U1\ : IOIN_IB
      port map(YIN => \SW2_pad[6]/U0/NET1\, Y => \PIN_c_c[6]\);
    
    \PIN_pad[1]/U0/U1\ : IOTRI_OB_EB
      port map(D => \PIN_c_c[1]\, E => \VCC\, DOUT => 
        \PIN_pad[1]/U0/NET1\, EOUT => \PIN_pad[1]/U0/NET2\);
    
    \LED1_pad[3]/U0/U0\ : IOPAD_TRI
      port map(D => \LED1_pad[3]/U0/NET1\, E => 
        \LED1_pad[3]/U0/NET2\, PAD => LED1(3));
    
    \LED1_pad[3]/U0/U1\ : IOTRI_OB_EB
      port map(D => \VCC\, E => \VCC\, DOUT => 
        \LED1_pad[3]/U0/NET1\, EOUT => \LED1_pad[3]/U0/NET2\);
    
    \PIN_pad[0]/U0/U0\ : IOPAD_TRI
      port map(D => \PIN_pad[0]/U0/NET1\, E => 
        \PIN_pad[0]/U0/NET2\, PAD => PIN(0));
    
    \SW2_pad[5]/U0/U0\ : IOPAD_IN
      port map(PAD => SW2(5), Y => \SW2_pad[5]/U0/NET1\);
    
    \PIN_pad[3]/U0/U1\ : IOTRI_OB_EB
      port map(D => \PIN_c_c[3]\, E => \VCC\, DOUT => 
        \PIN_pad[3]/U0/NET1\, EOUT => \PIN_pad[3]/U0/NET2\);
    
    \PIN_pad[7]/U0/U0\ : IOPAD_TRI
      port map(D => \PIN_pad[7]/U0/NET1\, E => 
        \PIN_pad[7]/U0/NET2\, PAD => PIN(7));
    
    \SW2_pad[1]/U0/U1\ : IOIN_IB
      port map(YIN => \SW2_pad[1]/U0/NET1\, Y => \PIN_c_c[1]\);
    
    \PIN_pad[4]/U0/U0\ : IOPAD_TRI
      port map(D => \PIN_pad[4]/U0/NET1\, E => 
        \PIN_pad[4]/U0/NET2\, PAD => PIN(4));
    
    \SW2_pad[4]/U0/U1\ : IOIN_IB
      port map(YIN => \SW2_pad[4]/U0/NET1\, Y => \PIN_c_c[4]\);
    
    \PIN_pad[5]/U0/U1\ : IOTRI_OB_EB
      port map(D => \PIN_c_c[5]\, E => \VCC\, DOUT => 
        \PIN_pad[5]/U0/NET1\, EOUT => \PIN_pad[5]/U0/NET2\);
    
    \SW2_pad[7]/U0/U0\ : IOPAD_IN
      port map(PAD => SW2(7), Y => \SW2_pad[7]/U0/NET1\);
    
    \SW2_pad[3]/U0/U0\ : IOPAD_IN
      port map(PAD => SW2(3), Y => \SW2_pad[3]/U0/NET1\);
    
    \LED1_pad[0]/U0/U0\ : IOPAD_TRI
      port map(D => \LED1_pad[0]/U0/NET1\, E => 
        \LED1_pad[0]/U0/NET2\, PAD => LED1(0));
    
    \LED1_pad[0]/U0/U1\ : IOTRI_OB_EB
      port map(D => \GND\, E => \VCC\, DOUT => 
        \LED1_pad[0]/U0/NET1\, EOUT => \LED1_pad[0]/U0/NET2\);
    
    \LED1_pad[2]/U0/U0\ : IOPAD_TRI
      port map(D => \LED1_pad[2]/U0/NET1\, E => 
        \LED1_pad[2]/U0/NET2\, PAD => LED1(2));
    
    \LED1_pad[2]/U0/U1\ : IOTRI_OB_EB
      port map(D => \GND\, E => \VCC\, DOUT => 
        \LED1_pad[2]/U0/NET1\, EOUT => \LED1_pad[2]/U0/NET2\);
    
    \PIN_pad[2]/U0/U1\ : IOTRI_OB_EB
      port map(D => \PIN_c_c[2]\, E => \VCC\, DOUT => 
        \PIN_pad[2]/U0/NET1\, EOUT => \PIN_pad[2]/U0/NET2\);
    
    \LED1_pad[4]/U0/U0\ : IOPAD_TRI
      port map(D => \LED1_pad[4]/U0/NET1\, E => 
        \LED1_pad[4]/U0/NET2\, PAD => LED1(4));
    
    \LED1_pad[4]/U0/U1\ : IOTRI_OB_EB
      port map(D => \GND\, E => \VCC\, DOUT => 
        \LED1_pad[4]/U0/NET1\, EOUT => \LED1_pad[4]/U0/NET2\);
    
    \PIN_pad[6]/U0/U0\ : IOPAD_TRI
      port map(D => \PIN_pad[6]/U0/NET1\, E => 
        \PIN_pad[6]/U0/NET2\, PAD => PIN(6));
    
    \SW2_pad[2]/U0/U0\ : IOPAD_IN
      port map(PAD => SW2(2), Y => \SW2_pad[2]/U0/NET1\);
    
    \LED1_pad[1]/U0/U0\ : IOPAD_TRI
      port map(D => \LED1_pad[1]/U0/NET1\, E => 
        \LED1_pad[1]/U0/NET2\, PAD => LED1(1));
    
    \SW2_pad[0]/U0/U0\ : IOPAD_IN
      port map(PAD => SW2(0), Y => \SW2_pad[0]/U0/NET1\);
    
    \LED1_pad[1]/U0/U1\ : IOTRI_OB_EB
      port map(D => \VCC\, E => \VCC\, DOUT => 
        \LED1_pad[1]/U0/NET1\, EOUT => \LED1_pad[1]/U0/NET2\);
    
    \PIN_pad[1]/U0/U0\ : IOPAD_TRI
      port map(D => \PIN_pad[1]/U0/NET1\, E => 
        \PIN_pad[1]/U0/NET2\, PAD => PIN(1));
    
    \SW2_pad[6]/U0/U0\ : IOPAD_IN
      port map(PAD => SW2(6), Y => \SW2_pad[6]/U0/NET1\);
    
    \PIN_pad[0]/U0/U1\ : IOTRI_OB_EB
      port map(D => \PIN_c_c[0]\, E => \VCC\, DOUT => 
        \PIN_pad[0]/U0/NET1\, EOUT => \PIN_pad[0]/U0/NET2\);
    
    \SW2_pad[5]/U0/U1\ : IOIN_IB
      port map(YIN => \SW2_pad[5]/U0/NET1\, Y => \PIN_c_c[5]\);
    
    \PIN_pad[3]/U0/U0\ : IOPAD_TRI
      port map(D => \PIN_pad[3]/U0/NET1\, E => 
        \PIN_pad[3]/U0/NET2\, PAD => PIN(3));
    
    \PIN_pad[7]/U0/U1\ : IOTRI_OB_EB
      port map(D => \PIN_c_c[7]\, E => \VCC\, DOUT => 
        \PIN_pad[7]/U0/NET1\, EOUT => \PIN_pad[7]/U0/NET2\);
    
    \PIN_pad[4]/U0/U1\ : IOTRI_OB_EB
      port map(D => \PIN_c_c[4]\, E => \VCC\, DOUT => 
        \PIN_pad[4]/U0/NET1\, EOUT => \PIN_pad[4]/U0/NET2\);
    
    \LED1_pad[7]/U0/U0\ : IOPAD_TRI
      port map(D => \LED1_pad[7]/U0/NET1\, E => 
        \LED1_pad[7]/U0/NET2\, PAD => LED1(7));
    
    \LED1_pad[7]/U0/U1\ : IOTRI_OB_EB
      port map(D => \VCC\, E => \VCC\, DOUT => 
        \LED1_pad[7]/U0/NET1\, EOUT => \LED1_pad[7]/U0/NET2\);
    
    \SW2_pad[1]/U0/U0\ : IOPAD_IN
      port map(PAD => SW2(1), Y => \SW2_pad[1]/U0/NET1\);
    
    \PIN_pad[5]/U0/U0\ : IOPAD_TRI
      port map(D => \PIN_pad[5]/U0/NET1\, E => 
        \PIN_pad[5]/U0/NET2\, PAD => PIN(5));
    
    \SW2_pad[4]/U0/U0\ : IOPAD_IN
      port map(PAD => SW2(4), Y => \SW2_pad[4]/U0/NET1\);
    
    GND_power_inst1 : GND
      port map( Y => GND_power_net1);

    VCC_power_inst1 : VCC
      port map( Y => VCC_power_net1);


end DEF_ARCH; 
