-- Version: 9.1 9.1.0.18
-- File used only for Simulation

library ieee;
use ieee.std_logic_1164.all;
library proasic3;
use proasic3.all;

entity DM74LS47 is

    port( Ain : in    std_logic;
          Bin : in    std_logic;
          Cin : in    std_logic;
          Din : in    std_logic;
          a   : out   std_logic;
          b   : out   std_logic;
          c   : out   std_logic;
          d   : out   std_logic;
          e   : out   std_logic;
          f   : out   std_logic;
          g   : out   std_logic
        );

end DM74LS47;

architecture DEF_ARCH of DM74LS47 is 

  component IOPAD_IN
    port( PAD : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;

  component NOR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component IOTRI_OB_EB
    port( D    : in    std_logic := 'U';
          E    : in    std_logic := 'U';
          DOUT : out   std_logic;
          EOUT : out   std_logic
        );
  end component;

  component NOR3
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component IOPAD_TRI
    port( D   : in    std_logic := 'U';
          E   : in    std_logic := 'U';
          PAD : out   std_logic
        );
  end component;

  component OR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2A
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XA1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XNOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component AO1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component XOR2
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component IOIN_IB
    port( YIN : in    std_logic := 'U';
          Y   : out   std_logic
        );
  end component;

  component OAI1
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component NOR3C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR3C
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OA1B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          C : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component OR2B
    port( A : in    std_logic := 'U';
          B : in    std_logic := 'U';
          Y : out   std_logic
        );
  end component;

  component GND
    port(Y : out std_logic); 
  end component;

  component VCC
    port(Y : out std_logic); 
  end component;

    signal \mergedbits_out_1_i_0[6]_net_1\, 
        \mergedbits_out_1_i_0[5]_net_1\, 
        \mergedbits_out_1_i_0[3]_net_1\, N_6, Ain_c, Bin_c, Cin_c, 
        Din_c, N_12_c, \mergedbits_out_1_c[1]\, N_9_c, N_50, N_27, 
        N_52, N_22, N_54, N_57, N_28, N_20, N_60, N_55, N_51, 
        N_59, N_67, N_63, N_19_i, N_15, N_61, 
        \mergedbits_out_1_0_i_a3_0_0[4]\, \Cin_pad/U0/NET1\, 
        \c_pad/U0/NET1\, \c_pad/U0/NET2\, \Ain_pad/U0/NET1\, 
        \e_pad/U0/NET1\, \e_pad/U0/NET2\, \Bin_pad/U0/NET1\, 
        \d_pad/U0/NET1\, \d_pad/U0/NET2\, \f_pad/U0/NET1\, 
        \f_pad/U0/NET2\, \g_pad/U0/NET1\, \g_pad/U0/NET2\, 
        \a_pad/U0/NET1\, \a_pad/U0/NET2\, \b_pad/U0/NET1\, 
        \b_pad/U0/NET2\, \VCC\, \Din_pad/U0/NET1\, \GND\, 
        AFLSDF_VCC, AFLSDF_GND : std_logic;
    signal GND_power_net1 : std_logic;
    signal VCC_power_net1 : std_logic;

begin 

    AFLSDF_GND <= GND_power_net1;
    \GND\ <= GND_power_net1;
    \VCC\ <= VCC_power_net1;
    AFLSDF_VCC <= VCC_power_net1;

    \Ain_pad/U0/U0\ : IOPAD_IN
      port map(PAD => Ain, Y => \Ain_pad/U0/NET1\);
    
    \mergedbits_out_1_i_i_o2[2]\ : NOR2A
      port map(A => Bin_c, B => Cin_c, Y => N_15);
    
    \a_pad/U0/U1\ : IOTRI_OB_EB
      port map(D => N_12_c, E => \VCC\, DOUT => \a_pad/U0/NET1\, 
        EOUT => \a_pad/U0/NET2\);
    
    \mergedbits_out_1_i_0[3]\ : NOR3
      port map(A => N_59, B => N_51, C => N_60, Y => 
        \mergedbits_out_1_i_0[3]_net_1\);
    
    \f_pad/U0/U0\ : IOPAD_TRI
      port map(D => \f_pad/U0/NET1\, E => \f_pad/U0/NET2\, PAD
         => f);
    
    \mergedbits_out_1_0_i_a3_0_1[4]\ : OR2
      port map(A => Ain_c, B => Din_c, Y => 
        \mergedbits_out_1_0_i_a3_0_0[4]\);
    
    \mergedbits_out_1_i_0_a3[5]\ : NOR3A
      port map(A => Bin_c, B => Din_c, C => N_22, Y => N_52);
    
    \a_pad/U0/U0\ : IOPAD_TRI
      port map(D => \a_pad/U0/NET1\, E => \a_pad/U0/NET2\, PAD
         => a);
    
    \mergedbits_out_1_i_0_a3_1[5]\ : NOR2
      port map(A => N_67, B => Ain_c, Y => N_55);
    
    \mergedbits_out_1_0_i_o2[4]\ : OR2A
      port map(A => Din_c, B => Cin_c, Y => N_28);
    
    \mergedbits_out_1_i_0_a3_0[6]\ : XA1
      port map(A => Bin_c, B => Din_c, C => N_22, Y => N_51);
    
    \mergedbits_out_1_0_0[1]\ : AO1C
      port map(A => Din_c, B => N_20, C => N_19_i, Y => 
        \mergedbits_out_1_c[1]\);
    
    \g_pad/U0/U1\ : IOTRI_OB_EB
      port map(D => \mergedbits_out_1_i_0[6]_net_1\, E => \VCC\, 
        DOUT => \g_pad/U0/NET1\, EOUT => \g_pad/U0/NET2\);
    
    \f_pad/U0/U1\ : IOTRI_OB_EB
      port map(D => \mergedbits_out_1_i_0[5]_net_1\, E => \VCC\, 
        DOUT => \f_pad/U0/NET1\, EOUT => \f_pad/U0/NET2\);
    
    \mergedbits_out_1_0_0_o2[1]\ : OR2A
      port map(A => Cin_c, B => Bin_c, Y => N_20);
    
    \Bin_pad/U0/U0\ : IOPAD_IN
      port map(PAD => Bin, Y => \Bin_pad/U0/NET1\);
    
    \g_pad/U0/U0\ : IOPAD_TRI
      port map(D => \g_pad/U0/NET1\, E => \g_pad/U0/NET2\, PAD
         => g);
    
    \mergedbits_out_1_i_i_x2[0]\ : XNOR2
      port map(A => N_15, B => Ain_c, Y => N_19_i);
    
    \mergedbits_out_1_i_i_a3[0]\ : AO1B
      port map(A => Din_c, B => Bin_c, C => Cin_c, Y => N_63);
    
    \Cin_pad/U0/U0\ : IOPAD_IN
      port map(PAD => Cin, Y => \Cin_pad/U0/NET1\);
    
    \mergedbits_out_1_i_0_a3_0[3]\ : NOR3A
      port map(A => Ain_c, B => Din_c, C => N_20, Y => N_60);
    
    \mergedbits_out_1_i_0_o2[6]\ : XOR2
      port map(A => Bin_c, B => Cin_c, Y => N_27);
    
    \Din_pad/U0/U1\ : IOIN_IB
      port map(YIN => \Din_pad/U0/NET1\, Y => Din_c);
    
    \mergedbits_out_1_i_i[2]\ : OAI1
      port map(A => Din_c, B => N_15, C => N_61, Y => N_9_c);
    
    \mergedbits_out_1_i_0[6]\ : NOR2
      port map(A => N_51, B => N_50, Y => 
        \mergedbits_out_1_i_0[6]_net_1\);
    
    \mergedbits_out_1_i_0_a3_0[5]\ : NOR3C
      port map(A => Ain_c, B => Din_c, C => Cin_c, Y => N_54);
    
    \mergedbits_out_1_i_0_a3[6]\ : NOR3C
      port map(A => Ain_c, B => Din_c, C => N_27, Y => N_50);
    
    \Cin_pad/U0/U1\ : IOIN_IB
      port map(YIN => \Cin_pad/U0/NET1\, Y => Cin_c);
    
    \mergedbits_out_1_i_i[0]\ : OR3C
      port map(A => N_63, B => N_19_i, C => N_67, Y => N_12_c);
    
    \c_pad/U0/U1\ : IOTRI_OB_EB
      port map(D => N_9_c, E => \VCC\, DOUT => \c_pad/U0/NET1\, 
        EOUT => \c_pad/U0/NET2\);
    
    \c_pad/U0/U0\ : IOPAD_TRI
      port map(D => \c_pad/U0/NET1\, E => \c_pad/U0/NET2\, PAD
         => c);
    
    \mergedbits_out_1_0_i[4]\ : OA1B
      port map(A => N_20, B => \mergedbits_out_1_0_i_a3_0_0[4]\, 
        C => N_57, Y => N_6);
    
    \mergedbits_out_1_i_0_o2[5]\ : NOR2
      port map(A => Cin_c, B => Ain_c, Y => N_22);
    
    \mergedbits_out_1_0_i_a3[4]\ : NOR3C
      port map(A => Bin_c, B => Ain_c, C => N_28, Y => N_57);
    
    \e_pad/U0/U0\ : IOPAD_TRI
      port map(D => \e_pad/U0/NET1\, E => \e_pad/U0/NET2\, PAD
         => e);
    
    \Ain_pad/U0/U1\ : IOIN_IB
      port map(YIN => \Ain_pad/U0/NET1\, Y => Ain_c);
    
    \e_pad/U0/U1\ : IOTRI_OB_EB
      port map(D => N_6, E => \VCC\, DOUT => \e_pad/U0/NET1\, 
        EOUT => \e_pad/U0/NET2\);
    
    \mergedbits_out_1_i_i_a3[2]\ : OAI1
      port map(A => Bin_c, B => Cin_c, C => Ain_c, Y => N_61);
    
    \b_pad/U0/U0\ : IOPAD_TRI
      port map(D => \b_pad/U0/NET1\, E => \b_pad/U0/NET2\, PAD
         => b);
    
    \mergedbits_out_1_i_0_a3[3]\ : NOR3C
      port map(A => Bin_c, B => Din_c, C => Cin_c, Y => N_59);
    
    \mergedbits_out_1_i_0[5]\ : NOR3
      port map(A => N_54, B => N_52, C => N_55, Y => 
        \mergedbits_out_1_i_0[5]_net_1\);
    
    \mergedbits_out_1_i_i_a2[0]\ : OR2B
      port map(A => N_15, B => Din_c, Y => N_67);
    
    \Bin_pad/U0/U1\ : IOIN_IB
      port map(YIN => \Bin_pad/U0/NET1\, Y => Bin_c);
    
    \b_pad/U0/U1\ : IOTRI_OB_EB
      port map(D => \mergedbits_out_1_c[1]\, E => \VCC\, DOUT => 
        \b_pad/U0/NET1\, EOUT => \b_pad/U0/NET2\);
    
    \Din_pad/U0/U0\ : IOPAD_IN
      port map(PAD => Din, Y => \Din_pad/U0/NET1\);
    
    \d_pad/U0/U0\ : IOPAD_TRI
      port map(D => \d_pad/U0/NET1\, E => \d_pad/U0/NET2\, PAD
         => d);
    
    \d_pad/U0/U1\ : IOTRI_OB_EB
      port map(D => \mergedbits_out_1_i_0[3]_net_1\, E => \VCC\, 
        DOUT => \d_pad/U0/NET1\, EOUT => \d_pad/U0/NET2\);
    
    GND_power_inst1 : GND
      port map( Y => GND_power_net1);

    VCC_power_inst1 : VCC
      port map( Y => VCC_power_net1);


end DEF_ARCH; 
