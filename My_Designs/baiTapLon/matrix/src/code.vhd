		 	   
-----------------------------------------------------------------------
-----------------------------------------------------------------------
--------------------- Dflip flop 8bit ---------------------------------	
------------ mach day cho cac thanh ghi -------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_signed.all; 
use IEEE.std_logic_arith.all;

entity Dff is 
	port(
	da : in std_logic_vector(7 downto 0);
	dout : out std_logic_vector(7 downto 0);
	clk :in std_logic
	);

end entity Dff;   

architecture arDff of Dff is
begin
	process(clk)
	   begin
		if(rising_edge(clk)) then
		   dout <= da;
		end if;
	   end process;
  end architecture arDff;	   
  
 
----------------------thanh ghi dich 9byte------------------------------
-----------------------------input----------------------------------------------
-----------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_signed.all; 
use IEEE.std_logic_arith.all;


entity dich_9byte is
	port(
	--
	in8: in std_logic; 
	in7: in std_logic;
	in6: in std_logic; 
	in5: in std_logic;
	in4: in std_logic; 
	in3: in std_logic;
	in2: in std_logic; 
	in1: in std_logic;
	
	a11 :out std_logic_vector(7 downto 0);
	a12 :out std_logic_vector(7 downto 0);
	a13 :out std_logic_vector(7 downto 0);
	a21 :out std_logic_vector(7 downto 0);
	a22 :out std_logic_vector(7 downto 0);
	a23 :out std_logic_vector(7 downto 0);
	a31 :out std_logic_vector(7 downto 0);
	a32 :out std_logic_vector(7 downto 0);
    a33 :out std_logic_vector(7 downto 0);
	
	clk : in std_logic 
	);	
end entity dich_9byte;	
 
architecture arDich of dich_9byte is
    
    signal dt0: std_logic_vector(7 downto 0); 
	signal dt1: std_logic_vector(7 downto 0);
	signal dt2: std_logic_vector(7 downto 0);
	signal dt3: std_logic_vector(7 downto 0);
	signal dt4: std_logic_vector(7 downto 0);
	signal dt5: std_logic_vector(7 downto 0);
	signal dt6: std_logic_vector(7 downto 0);
	signal dt7: std_logic_vector(7 downto 0);
	signal dt8: std_logic_vector(7 downto 0);
	signal din: std_logic_vector(7 downto 0);
	component Dff 
		port (
       
	    da : in std_logic_vector(7 downto 0);
	    dout : out std_logic_vector(7 downto 0);
		 clk :in std_logic
		);
         end component Dff;
 begin 
	din <= in8&in7&in6&in5&in4&in3&in2&in1; 
	
	U0: Dff PORT MAP ( din, dt0,clk);
	U1: Dff PORT MAP ( dt0, dt1,clk);
	U2: Dff PORT MAP ( dt1, dt2,clk);
	U3: Dff PORT MAP ( dt2, dt3,clk);
	U4: Dff PORT MAP ( dt3, dt4,clk);
	U5: Dff PORT MAP ( dt4, dt5,clk);
	U6: Dff PORT MAP ( dt5, dt6,clk);
	U7: Dff PORT MAP ( dt6, dt7,clk);
	U8: Dff PORT MAP ( dt7, dt8,clk); 
	a11 <= dt0;
	a12 <= dt1;
	a13 <= dt2;
	a21 <= dt3;
	a22 <= dt4;
	a23 <= dt5;
	a31 <= dt6;
	a32 <= dt7;
	a33 <= dt8;

end architecture arDich;
-----------------------------------------------------------------------
-----------------demux SlA/B-------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_signed.all; 
use IEEE.std_logic_arith.all;
entity demux is
	port(
	in1 :in std_logic_vector(7 downto 0); 
	in2 :in std_logic_vector(7 downto 0);
	in3 :in std_logic_vector(7 downto 0);
	in4 :in std_logic_vector(7 downto 0);
	in5 :in std_logic_vector(7 downto 0);
	in6 :in std_logic_vector(7 downto 0);
	in7 :in std_logic_vector(7 downto 0);
	in8 :in std_logic_vector(7 downto 0);
	in9 :in std_logic_vector(7 downto 0);
	
	outA1 :out std_logic_vector(7 downto 0); 
	outA2 :out std_logic_vector(7 downto 0);
	outA3 :out std_logic_vector(7 downto 0);
	outA4 :out std_logic_vector(7 downto 0);
	outA5 :out std_logic_vector(7 downto 0);
	outA6 :out std_logic_vector(7 downto 0);
	outA7 :out std_logic_vector(7 downto 0);
	outA8 :out std_logic_vector(7 downto 0);
	outA9 :out std_logic_vector(7 downto 0); 
	
	outB1 :out std_logic_vector(7 downto 0); 
	outB2 :out std_logic_vector(7 downto 0);
	outB3 :out std_logic_vector(7 downto 0);
	outB4 :out std_logic_vector(7 downto 0);
	outB5 :out std_logic_vector(7 downto 0);
	outB6 :out std_logic_vector(7 downto 0);
	outB7 :out std_logic_vector(7 downto 0);
	outB8 :out std_logic_vector(7 downto 0);
	outB9 :out std_logic_vector(7 downto 0);
	Sl:in std_logic
	);
end entity demux;  

architecture arDemux of demux is 

begin
	process(Sl)
	begin
	if(Sl='1')then 
		outA1<=in1;
		outA2<=in2;
		outA3<=in3;
		outA4<=in4;
		outA5<=in5;
		outA6<=in6;
		outA7<=in7;
		outA8<=in8;
		outA9<=in9;
	else 
		outB1<=in1;
		outB2<=in2;
		outB3<=in3;
		outB4<=in4;
		outB5<=in5;
		outB6<=in6;
		outB7<=in7;
		outB8<=in8;
		outB9<=in9;
	end if;	
	end process;
end architecture arDemux;

------------------------------------------------------------------------
------------------------------------------------------------------------
-----------------mux de thuc hien voi mang B----------------------------
------------------------------------------------------------------------
  
library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_signed.all; 
use IEEE.std_logic_arith.all;

entity mux_8bit is 
	port (
	B_in00 :	in std_logic_vector(7 downto 0);
	B_in01 : in std_logic_vector(7 downto 0); 
	B_in10 : in std_logic_vector(7 downto 0); 
	B_out : out std_logic_vector(7 downto 0);
	Sl1 : in std_logic;
	Sl2	: in std_logic
	);
end entity mux_8bit;
architecture mux of mux_8bit is
begin
	process(Sl1,Sl2)
	begin
		if(Sl1='0')then
	          if(Sl2='0')then
			     B_out<=B_in00;
		       else
			      B_out<=B_in01;
		      end if;
		else  
			if(Sl2='0')then
			   B_out<=B_in10;
			end if;
		end if;	
	end process;
end architecture mux;

-------------------------mux mang 3 mang 9 byte------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_signed.all; 
use IEEE.std_logic_arith.all;

entity mux_9byte is 
	port (
	B_in001 :	in std_logic_vector(7 downto 0);
	B_in002 :	in std_logic_vector(7 downto 0);
	B_in003 : in std_logic_vector(7 downto 0);
	B_in004 :	in std_logic_vector(7 downto 0);
	B_in005 : in std_logic_vector(7 downto 0);
	B_in006 :	in std_logic_vector(7 downto 0);
	B_in007 : in std_logic_vector(7 downto 0);
	B_in008 :	in std_logic_vector(7 downto 0);
	B_in009 : in std_logic_vector(7 downto 0);
	
	B_in011 :	in std_logic_vector(7 downto 0);
	B_in012 : in std_logic_vector(7 downto 0);
	B_in013 :	in std_logic_vector(7 downto 0);
	B_in014 : in std_logic_vector(7 downto 0);
	B_in015 :	in std_logic_vector(7 downto 0);
	B_in016 : in std_logic_vector(7 downto 0);
	B_in017 :	in std_logic_vector(7 downto 0);
	B_in018 : in std_logic_vector(7 downto 0);
	B_in019 :	in std_logic_vector(7 downto 0);
	
	B_in101 :	in std_logic_vector(7 downto 0);
	B_in102 : in std_logic_vector(7 downto 0);
	B_in103 :	in std_logic_vector(7 downto 0);
	B_in104 : in std_logic_vector(7 downto 0);
	B_in105 :	in std_logic_vector(7 downto 0);
	B_in106 : in std_logic_vector(7 downto 0);
	B_in107 :	in std_logic_vector(7 downto 0);
	B_in108 : in std_logic_vector(7 downto 0);
	B_in109 :	in std_logic_vector(7 downto 0);
	
	
	B_out1 : out std_logic_vector(7 downto 0); 
	B_out2 : out std_logic_vector(7 downto 0);
	B_out3 : out std_logic_vector(7 downto 0);
	B_out4 : out std_logic_vector(7 downto 0);
	B_out5 : out std_logic_vector(7 downto 0);
	B_out6 : out std_logic_vector(7 downto 0);
	B_out7 : out std_logic_vector(7 downto 0);
	B_out8 : out std_logic_vector(7 downto 0);
	B_out9 : out std_logic_vector(7 downto 0);
	
	Sl1:in std_logic;
	Sl2:in std_logic
	);
end entity mux_9byte;

architecture armux_9byte of mux_9byte is 
component mux_8bit
	port(
	B_in00 :	in std_logic_vector(7 downto 0);
	B_in01 : in std_logic_vector(7 downto 0); 
	B_in10 : in std_logic_vector(7 downto 0); 
	B_out : out std_logic_vector(7 downto 0);
	Sl1 : in std_logic;
	Sl2	: in std_logic
	);
end component;

begin
	U1: mux_8bit port map(B_in001,B_in011,B_in101,B_out1,Sl1,Sl2); 
	U2: mux_8bit port map(B_in002,B_in012,B_in102,B_out2,Sl1,Sl2); 
	U3: mux_8bit port map(B_in003,B_in013,B_in103,B_out3,Sl1,Sl2); 
	U4: mux_8bit port map(B_in004,B_in014,B_in104,B_out4,Sl1,Sl2); 
	U5: mux_8bit port map(B_in005,B_in015,B_in105,B_out5,Sl1,Sl2); 
	U6: mux_8bit port map(B_in006,B_in016,B_in106,B_out6,Sl1,Sl2); 
	U7: mux_8bit port map(B_in007,B_in017,B_in107,B_out7,Sl1,Sl2); 
	U8: mux_8bit port map(B_in008,B_in018,B_in108,B_out8,Sl1,Sl2); 
	U9: mux_8bit port map(B_in009,B_in019,B_in109,B_out9,Sl1,Sl2); 
	
end architecture armux_9byte;



---------------------------------------------
------------------thanh luu tru--mux --------------------------
----------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_signed.all; 
use IEEE.std_logic_arith.all;

entity latch is 
	port( 
	 
	in1: in std_logic_vector(7 downto 0);
	in2: in std_logic_vector(7 downto 0);
	in3: in std_logic_vector(7 downto 0);
	in4: in std_logic_vector(7 downto 0);
	in5: in std_logic_vector(7 downto 0);
	in6: in std_logic_vector(7 downto 0);
	in7: in std_logic_vector(7 downto 0);
	in8: in std_logic_vector(7 downto 0);
	in9: in std_logic_vector(7 downto 0); 
	
	out11: out std_logic_vector(7 downto 0);
	out12: out std_logic_vector(7 downto 0);
	out13: out std_logic_vector(7 downto 0);
	out14: out std_logic_vector(7 downto 0);
	out15: out std_logic_vector(7 downto 0);
	out16: out std_logic_vector(7 downto 0);
	out17: out std_logic_vector(7 downto 0);
	out18: out std_logic_vector(7 downto 0);
	out19: out std_logic_vector(7 downto 0);
	
	out21: out std_logic_vector(7 downto 0);
	out22: out std_logic_vector(7 downto 0);
	out23: out std_logic_vector(7 downto 0);
	out24: out std_logic_vector(7 downto 0);
	out25: out std_logic_vector(7 downto 0);
	out26: out std_logic_vector(7 downto 0);
	out27: out std_logic_vector(7 downto 0);
	out28: out std_logic_vector(7 downto 0);
	out29: out std_logic_vector(7 downto 0);
	Sl_A :in std_logic;
	Sl1 :in std_logic;
	Sl2 :in std_logic;
	Clk :in std_logic
	);
end entity latch;	 

architecture arrLatch of latch is 

signal A1: std_logic_vector(7 downto 0); 
signal A2: std_logic_vector(7 downto 0);
signal A3: std_logic_vector(7 downto 0); 
signal A4: std_logic_vector(7 downto 0); 
signal A5: std_logic_vector(7 downto 0); 
signal A6: std_logic_vector(7 downto 0);
signal A7: std_logic_vector(7 downto 0); 
signal A8: std_logic_vector(7 downto 0);
signal A9: std_logic_vector(7 downto 0); 

signal B001: std_logic_vector(7 downto 0); 
signal B002: std_logic_vector(7 downto 0);
signal B003: std_logic_vector(7 downto 0); 
signal B004: std_logic_vector(7 downto 0); 
signal B005: std_logic_vector(7 downto 0); 
signal B006: std_logic_vector(7 downto 0);
signal B007: std_logic_vector(7 downto 0); 
signal B008: std_logic_vector(7 downto 0);
signal B009: std_logic_vector(7 downto 0); 

signal B011: std_logic_vector(7 downto 0); 
signal B012: std_logic_vector(7 downto 0);
signal B013: std_logic_vector(7 downto 0); 
signal B014: std_logic_vector(7 downto 0); 
signal B015: std_logic_vector(7 downto 0); 
signal B016: std_logic_vector(7 downto 0);
signal B017: std_logic_vector(7 downto 0); 
signal B018: std_logic_vector(7 downto 0);
signal B019: std_logic_vector(7 downto 0);

signal B101: std_logic_vector(7 downto 0); 
signal B102: std_logic_vector(7 downto 0);
signal B103: std_logic_vector(7 downto 0); 
signal B104: std_logic_vector(7 downto 0); 
signal B105: std_logic_vector(7 downto 0); 
signal B106: std_logic_vector(7 downto 0);
signal B107: std_logic_vector(7 downto 0); 
signal B108: std_logic_vector(7 downto 0);
signal B109: std_logic_vector(7 downto 0);

signal  B_out001 :	 std_logic_vector(7 downto 0);
signal	B_out002 : std_logic_vector(7 downto 0);
signal	B_out003 :  std_logic_vector(7 downto 0);
signal	B_out004 : std_logic_vector(7 downto 0);
signal	B_out005 :  std_logic_vector(7 downto 0);
signal	B_out006 :	 std_logic_vector(7 downto 0);
signal	B_out007 : std_logic_vector(7 downto 0);
signal	B_out008 :	 std_logic_vector(7 downto 0);
signal	B_out009 :  std_logic_vector(7 downto 0);
	
signal	B_out011 :	 std_logic_vector(7 downto 0);
signal	B_out012 : std_logic_vector(7 downto 0);
signal	B_out013 :	std_logic_vector(7 downto 0);
signal	B_out014 : std_logic_vector(7 downto 0);
signal	B_out015 : std_logic_vector(7 downto 0);
signal	B_out016 : std_logic_vector(7 downto 0);
signal	B_out017 :	std_logic_vector(7 downto 0);
signal	B_out018 : std_logic_vector(7 downto 0);
signal	B_out019 : std_logic_vector(7 downto 0);
	
signal	B_out101 :	 std_logic_vector(7 downto 0);
signal	B_out102 :  std_logic_vector(7 downto 0);
signal	B_out103 :	 std_logic_vector(7 downto 0);
signal	B_out104 :  std_logic_vector(7 downto 0);
signal	B_out105 :	 std_logic_vector(7 downto 0);
signal	B_out106 :  std_logic_vector(7 downto 0);
signal	B_out107 :	 std_logic_vector(7 downto 0);
signal	B_out108 :  std_logic_vector(7 downto 0);
signal	B_out109 :	 std_logic_vector(7 downto 0);


--------- thanh ghi --------------------
component Dff	  -- tao 18 Dff 8bit; 
		port(
	 
	da : in std_logic_vector(7 downto 0);
	dout : out std_logic_vector(7 downto 0);
	clk :in std_logic
	);
end component Dff;	

 ----------select A/B----------------------
component demux 
	port(
	in1 :in std_logic_vector(7 downto 0); 
	in2 :in std_logic_vector(7 downto 0);
	in3 :in std_logic_vector(7 downto 0);
	in4 :in std_logic_vector(7 downto 0);
	in5 :in std_logic_vector(7 downto 0);
	in6 :in std_logic_vector(7 downto 0);
	in7 :in std_logic_vector(7 downto 0);
	in8 :in std_logic_vector(7 downto 0);
	in9 :in std_logic_vector(7 downto 0);
	
	outA1 :out std_logic_vector(7 downto 0); 
	outA2 :out std_logic_vector(7 downto 0);
	outA3 :out std_logic_vector(7 downto 0);
	outA4 :out std_logic_vector(7 downto 0);
	outA5 :out std_logic_vector(7 downto 0);
	outA6 :out std_logic_vector(7 downto 0);
	outA7 :out std_logic_vector(7 downto 0);
	outA8 :out std_logic_vector(7 downto 0);
	outA9 :out std_logic_vector(7 downto 0); 
	
	outB1 :out std_logic_vector(7 downto 0); 
	outB2 :out std_logic_vector(7 downto 0);
	outB3 :out std_logic_vector(7 downto 0);
	outB4 :out std_logic_vector(7 downto 0);
	outB5 :out std_logic_vector(7 downto 0);
	outB6 :out std_logic_vector(7 downto 0);
	outB7 :out std_logic_vector(7 downto 0);
	outB8 :out std_logic_vector(7 downto 0);
	outB9 :out std_logic_vector(7 downto 0);
	Sl:in std_logic
	);
end component demux;  

------------mux 3 thanh B ------------------
component mux_9byte  
	port ( 
	
	
	B_in001 :	in std_logic_vector(7 downto 0);
	B_in002 :	in std_logic_vector(7 downto 0);
	B_in003 : in std_logic_vector(7 downto 0);
	B_in004 :	in std_logic_vector(7 downto 0);
	B_in005 : in std_logic_vector(7 downto 0);
	B_in006 :	in std_logic_vector(7 downto 0);
	B_in007 : in std_logic_vector(7 downto 0);
	B_in008 :	in std_logic_vector(7 downto 0);
	B_in009 : in std_logic_vector(7 downto 0);
	
	B_in011 :	in std_logic_vector(7 downto 0);
	B_in012 : in std_logic_vector(7 downto 0);
	B_in013 :	in std_logic_vector(7 downto 0);
	B_in014 : in std_logic_vector(7 downto 0);
	B_in015 :	in std_logic_vector(7 downto 0);
	B_in016 : in std_logic_vector(7 downto 0);
	B_in017 :	in std_logic_vector(7 downto 0);
	B_in018 : in std_logic_vector(7 downto 0);
	B_in019 :	in std_logic_vector(7 downto 0);
	
	B_in101 :	in std_logic_vector(7 downto 0);
	B_in102 : in std_logic_vector(7 downto 0);
	B_in103 :	in std_logic_vector(7 downto 0);
	B_in104 : in std_logic_vector(7 downto 0);
	B_in105 :	in std_logic_vector(7 downto 0);
	B_in106 : in std_logic_vector(7 downto 0);
	B_in107 :	in std_logic_vector(7 downto 0);
	B_in108 : in std_logic_vector(7 downto 0);
	B_in109 :	in std_logic_vector(7 downto 0);
	
	B_out1 : out std_logic_vector(7 downto 0); 
	B_out2 : out std_logic_vector(7 downto 0);
	B_out3 : out std_logic_vector(7 downto 0);
	B_out4 : out std_logic_vector(7 downto 0);
	B_out5 : out std_logic_vector(7 downto 0);
	B_out6 : out std_logic_vector(7 downto 0);
	B_out7 : out std_logic_vector(7 downto 0);
	B_out8 : out std_logic_vector(7 downto 0);
	B_out9 : out std_logic_vector(7 downto 0);
	
	Sl1:in std_logic;
	Sl2:in std_logic
	);
end component mux_9byte;

begin
-------- demux Select A/B	
 Udemux:demux port map(in1,in2,in3,in4,in5,in6,in7,in8,in9,A1,A2,A3,A4,A5,A6,A7,A8,A9,B001,B002,B003,B004,B005,B006,B007,B008,B009,Sl_A);
-------- mux Select mode B
 Umux: mux_9byte port map(B_out001,B_out002,B_out003,B_out004,B_out005,B_out006,B_out007,B_out008,B_out009,B_out011,B_out012,B_out013,B_out014,B_out015,B_out016,B_out017,B_out018,B_out019,B_out101,B_out102,B_out103,B_out104,B_out105,B_out106,B_out107,B_out108,B_out109,out21,out22,out23,out24,out25,out26,out27,out28,out29,Sl1,Sl2); 
 
	-------B00----------------- 
 U1: Dff port map(B001,B_out001,Clk);
 U2: Dff port map(B002,B_out002,Clk); 
 U3: Dff port map(B003,B_out003,Clk);
 U4: Dff port map(B004,B_out004,Clk);
 U5: Dff port map(B005,B_out005,Clk);
 U6: Dff port map(B006,B_out006,Clk);
 U7: Dff port map(B007,B_out007,Clk);
 U8: Dff port map(B008,B_out008,Clk);
 U9: Dff port map(B009,B_out009,Clk);  
 -------------b01--------------	
 
 U11: Dff port map(B011,B_out011,Clk);
 U12: Dff port map(B012,B_out012,Clk);
 U13: Dff port map(B013,B_out013,Clk);
 U14: Dff port map(B014,B_out014,Clk);
 U15: Dff port map(B015,B_out015,Clk);
 U16: Dff port map(B016,B_out016,Clk);
 U17: Dff port map(B017,B_out017,Clk);
 U18: Dff port map(B018,B_out018,Clk);
 U19: Dff port map(B019,B_out019,Clk);	
 B011<="00000010";
 B012<="00000000";
 B013<="11111110";
 B014<="00000011";
 B015<="00000000";
 B016<="11111101";
 B017<="00000010";
 B018<="00000000";
 B019<="00000010";
 -------------B10----------------  
 
 U21: Dff port map(B101,B_out101,Clk);
 U22: Dff port map(B102,B_out102,Clk);
 U23: Dff port map(B103,B_out103,Clk);
 U24: Dff port map(B104,B_out104,Clk);
 U25: Dff port map(B105,B_out105,Clk);
 U26: Dff port map(B106,B_out106,Clk);
 U27: Dff port map(B107,B_out107,Clk);
 U28: Dff port map(B108,B_out108,Clk);
 U29: Dff port map(B109,B_out109,Clk);
 B101<="00000001";
 B102<="00000001";
 B103<="00000001";
 B104<="00000001";
 B105<="00000001";
 B106<="00000001";
 B107<="00000001";
 B108<="00000001";
 B109<="00000001";
 
---------------A------------------ 
 U41: Dff port map(A1,out11,Clk);
 U42: Dff port map(A2,out12,Clk); 
 U43: Dff port map(A3,out13,Clk);
 U44: Dff port map(A4,out14,Clk);
 U45: Dff port map(A5,out15,Clk);
 U46: Dff port map(A6,out16,Clk);
 U47: Dff port map(A7,out17,Clk);
 U48: Dff port map(A8,out18,Clk);
 U49: Dff port map(A9,out19,Clk);
 
end architecture arrLatch	;	 

-------------------------------------------------------------------
-------------------------------------------------------------------
--------------------thuc hien nhan ma tran-------------------------
library IEEE;			    
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_signed.all; 
use IEEE.std_logic_arith.all;

                                                        
entity xl_byte is
	port(
	a11: in std_logic_vector(7 downto 0);
	a12: in std_logic_vector(7 downto 0);   
	a13: in std_logic_vector(7 downto 0);                                           
	a21: in std_logic_vector(7 downto 0);
	a22: in std_logic_vector(7 downto 0);
	a23: in std_logic_vector (7 downto 0);
	a31: in std_logic_vector (7 downto 0);
	a32: in std_logic_vector (7 downto 0);
	a33: in std_logic_vector (7 downto 0);
	
	b11: in std_logic_vector (7 downto 0);  
    b12: in std_logic_vector (7 downto 0);  
    b13: in std_logic_vector (7 downto 0);  
	b21: in std_logic_vector (7 downto 0);  
	b22: in std_logic_vector (7 downto 0);  
	b23: in std_logic_vector (7 downto 0);  
	b31: in std_logic_vector (7 downto 0);  
	b32: in std_logic_vector (7 downto 0);  
	b33: in std_logic_vector (7 downto 0);
	
	c11: out std_logic_vector (7 downto 0);  
	c12: out std_logic_vector (7 downto 0);  
	c13: out std_logic_vector (7 downto 0);  
	c21: out std_logic_vector (7 downto 0);  
	c22: out std_logic_vector (7 downto 0);  
	c23: out std_logic_vector (7 downto 0);  
	c31: out std_logic_vector (7 downto 0);  
	c32: out std_logic_vector (7 downto 0);  
	c33: out std_logic_vector (7 downto 0)
	);	

end	entity xl_byte; 

architecture config of xl_byte is 

begin 
	
	process(a11,b11,a12,b21,a13,b31)
	  variable var11,var12,var13,var21,var22,var23,varT : integer; 
	begin  
	var11:= CONV_INTEGER(a11);	 
	var12:= CONV_INTEGER(a12);	
	var13:= CONV_INTEGER(a13);	
	var21:= CONV_INTEGER(b11);	
	var22:= CONV_INTEGER(b21);	
	var23:= CONV_INTEGER(b31);	
	varT := var11*var21+var12*var22+var13*var23;	 
	c11<= CONV_STD_LOGIC_VECTOR(varT,8); 
	end process; 
	  --c12---
	process(a11,b12,a12,b22,a13,b32)
	  variable var11,var12,var13,var21,var22,var23,varT : integer; 
	begin  
	var11:= CONV_INTEGER(a11);	 
	var12:= CONV_INTEGER(a12);	
	var13:= CONV_INTEGER(a13);	
	var21:= CONV_INTEGER(b12);	
	var22:= CONV_INTEGER(b22);	
	var23:= CONV_INTEGER(b32);	
	varT := var11*var21+var12*var22+var13*var23;	 
	c12<= CONV_STD_LOGIC_VECTOR(varT,8); 
	end process;
	  ---c13-----
	process(a11,b13,a12,b23,a13,b33)
	  variable var11,var12,var13,var21,var22,var23,varT : integer; 
	begin  
	var11:= CONV_INTEGER(a11);	 
	var12:= CONV_INTEGER(a12);	
	var13:= CONV_INTEGER(a13);	
	var21:= CONV_INTEGER(b13);	
	var22:= CONV_INTEGER(b23);	
	var23:= CONV_INTEGER(b33);	
	varT := var11*var21+var12*var22+var13*var23;	 
	c13<= CONV_STD_LOGIC_VECTOR(varT,8); 
	end process;
	   ----c21-----
	process(a21,b11,a22,b21,a23,b31)
	  variable var11,var12,var13,var21,var22,var23,varT : integer; 
	begin  
	var11:= CONV_INTEGER(a21);	 
	var12:= CONV_INTEGER(a22);	
	var13:= CONV_INTEGER(a23);	
	var21:= CONV_INTEGER(b11);	
	var22:= CONV_INTEGER(b21);	
	var23:= CONV_INTEGER(b31);	
	varT := var11*var21+var12*var22+var13*var23;	 
	c21<= CONV_STD_LOGIC_VECTOR(varT,8); 
	end process; 
	---c22-----
	process(a21,b12,a22,b22,a23,b32)
	  variable var11,var12,var13,var21,var22,var23,varT : integer; 
	begin  
	var11:= CONV_INTEGER(a21);	 
	var12:= CONV_INTEGER(a22);	
	var13:= CONV_INTEGER(a23);	
	var21:= CONV_INTEGER(b12);	
	var22:= CONV_INTEGER(b22);	
	var23:= CONV_INTEGER(b32);	
	varT := var11*var21+var12*var22+var13*var23;	 
	c22<= CONV_STD_LOGIC_VECTOR(varT,8); 
	end process;
	-----c23-------
	process(a21,b13,a22,b23,a23,b33)
	  variable var11,var12,var13,var21,var22,var23,varT : integer; 
	begin  
	var11:= CONV_INTEGER(a21);	 
	var12:= CONV_INTEGER(a22);	
	var13:= CONV_INTEGER(a23);	
	var21:= CONV_INTEGER(b13);	
	var22:= CONV_INTEGER(b23);	
	var23:= CONV_INTEGER(b33);	
	varT := var11*var21+var12*var22+var13*var23;	 
	c23<= CONV_STD_LOGIC_VECTOR(varT,8); 
	end process;
	 -----c31 ---- 
	process(a31,b11,a32,b21,a33,b31)
	  variable var11,var12,var13,var21,var22,var23,varT : integer; 
	begin  
	var11:= CONV_INTEGER(a31);	 
	var12:= CONV_INTEGER(a32);	
	var13:= CONV_INTEGER(a33);	
	var21:= CONV_INTEGER(b11);	
	var22:= CONV_INTEGER(b21);	
	var23:= CONV_INTEGER(b31);	
	varT := var11*var21+var12*var22+var13*var23;	 
	c31<= CONV_STD_LOGIC_VECTOR(varT,8); 
	end process; 
   -------c32---------------
	process(a31,b12,a32,b22,a33,b32)
	  variable var11,var12,var13,var21,var22,var23,varT : integer; 
	begin  
	var11:= CONV_INTEGER(a31);	 
	var12:= CONV_INTEGER(a32);	
	var13:= CONV_INTEGER(a33);	
	var21:= CONV_INTEGER(b12);	
	var22:= CONV_INTEGER(b22);	
	var23:= CONV_INTEGER(b32);	
	varT := var11*var21+var12*var22+var13*var23;	 
	c32<= CONV_STD_LOGIC_VECTOR(varT,8); 
	end process;
	--------c33-----------
	process(a31,b13,a32,b23,a33,b33)
	  variable var11,var12,var13,var21,var22,var23,varT : integer; 
	begin  
	var11:= CONV_INTEGER(a31);	 
	var12:= CONV_INTEGER(a32);	
	var13:= CONV_INTEGER(a33);	
	var21:= CONV_INTEGER(b13);	
	var22:= CONV_INTEGER(b23);	
	var23:= CONV_INTEGER(b33);	
	varT := var11*var21+var12*var22+var13*var23;	 
	c33<= CONV_STD_LOGIC_VECTOR(varT,8); 
	end process;
	
end architecture config; 

--------------------------------------------------------------------
--------------------IC hoan chinh ----------------------------------
 library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_signed.all; 
use IEEE.std_logic_arith.all;
entity mul_matrix is
	port(
	in8:in std_logic;
	in7:in std_logic;
	in6:in std_logic;
	in5:in std_logic;
	in4:in std_logic;
	in3:in std_logic;
	in2:in std_logic;
	in1:in std_logic;
	Sl_A:in std_logic;
	Sl1 :in std_logic;
	Sl2 :in std_logic;
	Clk:in std_logic;
	c11: out std_logic_vector (7 downto 0);  
	c12: out std_logic_vector (7 downto 0);  
	c13: out std_logic_vector (7 downto 0);  
	c21: out std_logic_vector (7 downto 0);  
	c22: out std_logic_vector (7 downto 0);  
	c23: out std_logic_vector (7 downto 0);  
	c31: out std_logic_vector (7 downto 0);  
	c32: out std_logic_vector (7 downto 0);  
	c33: out std_logic_vector (7 downto 0)
	); 
end entity mul_matrix;

architecture arrMul_matrix of mul_matrix is
signal a11:  std_logic_vector(7 downto 0);
signal	a12:  std_logic_vector(7 downto 0);   
signal	a13:  std_logic_vector(7 downto 0);                                           
signal	a21:  std_logic_vector(7 downto 0);
signal	a22:  std_logic_vector(7 downto 0);
signal	a23:  std_logic_vector (7 downto 0);
signal	a31:  std_logic_vector (7 downto 0);
signal	a32:  std_logic_vector (7 downto 0);
signal	a33:  std_logic_vector (7 downto 0);
	
signal	  b11:  std_logic_vector (7 downto 0);  
signal    b12:  std_logic_vector (7 downto 0);  
signal    b13:  std_logic_vector (7 downto 0);  
signal	b21:  std_logic_vector (7 downto 0);  
signal	b22:  std_logic_vector (7 downto 0);  
signal	b23:  std_logic_vector (7 downto 0);  
signal	b31:  std_logic_vector (7 downto 0);  
signal	b32:  std_logic_vector (7 downto 0);  
signal	b33:  std_logic_vector (7 downto 0); 

signal    out1:  std_logic_vector(7 downto 0);
signal	out2:  std_logic_vector(7 downto 0);
signal	out3:  std_logic_vector(7 downto 0);
signal	out4:  std_logic_vector(7 downto 0);
signal	out5 : std_logic_vector(7 downto 0);
signal	out6:  std_logic_vector(7 downto 0);
signal	out7:  std_logic_vector(7 downto 0);
signal	out8:  std_logic_vector(7 downto 0);
signal	out9:  std_logic_vector(7 downto 0); 

------nhan ma tran --------------------
component xl_byte 
	port(
	a11: in std_logic_vector(7 downto 0);
	a12: in std_logic_vector(7 downto 0);   
	a13: in std_logic_vector(7 downto 0);                                           
	a21: in std_logic_vector(7 downto 0);
	a22: in std_logic_vector(7 downto 0);
	a23: in std_logic_vector (7 downto 0);
	a31: in std_logic_vector (7 downto 0);
	a32: in std_logic_vector (7 downto 0);
	a33: in std_logic_vector (7 downto 0);
	
	b11: in std_logic_vector (7 downto 0);  
    b12: in std_logic_vector (7 downto 0);  
    b13: in std_logic_vector (7 downto 0);  
	b21: in std_logic_vector (7 downto 0);  
	b22: in std_logic_vector (7 downto 0);  
	b23: in std_logic_vector (7 downto 0);  
	b31: in std_logic_vector (7 downto 0);  
	b32: in std_logic_vector (7 downto 0);  
	b33: in std_logic_vector (7 downto 0);
	
	c11: out std_logic_vector (7 downto 0);  
	c12: out std_logic_vector (7 downto 0);  
	c13: out std_logic_vector (7 downto 0);  
	c21: out std_logic_vector (7 downto 0);  
	c22: out std_logic_vector (7 downto 0);  
	c23: out std_logic_vector (7 downto 0);  
	c31: out std_logic_vector (7 downto 0);  
	c32: out std_logic_vector (7 downto 0);  
	c33: out std_logic_vector (7 downto 0)
	);	
end	component xl_byte;
-------component latch---------------
component latch  
	port( 
	 
	in1: in std_logic_vector(7 downto 0);
	in2: in std_logic_vector(7 downto 0);
	in3: in std_logic_vector(7 downto 0);
	in4: in std_logic_vector(7 downto 0);
	in5: in std_logic_vector(7 downto 0);
	in6: in std_logic_vector(7 downto 0);
	in7: in std_logic_vector(7 downto 0);
	in8: in std_logic_vector(7 downto 0);
	in9: in std_logic_vector(7 downto 0); 
	
	out11: out std_logic_vector(7 downto 0);
	out12: out std_logic_vector(7 downto 0);
	out13: out std_logic_vector(7 downto 0);
	out14: out std_logic_vector(7 downto 0);
	out15: out std_logic_vector(7 downto 0);
	out16: out std_logic_vector(7 downto 0);
	out17: out std_logic_vector(7 downto 0);
	out18: out std_logic_vector(7 downto 0);
	out19: out std_logic_vector(7 downto 0);
	
	out21: out std_logic_vector(7 downto 0);
	out22: out std_logic_vector(7 downto 0);
	out23: out std_logic_vector(7 downto 0);
	out24: out std_logic_vector(7 downto 0);
	out25: out std_logic_vector(7 downto 0);
	out26: out std_logic_vector(7 downto 0);
	out27: out std_logic_vector(7 downto 0);
	out28: out std_logic_vector(7 downto 0);
	out29: out std_logic_vector(7 downto 0);
	Sl_A :in std_logic;
	Sl1 :in std_logic;
	Sl2 :in std_logic;
	Clk :in std_logic
	);
end component latch; 

-------------component dich-------
	component dich_9byte 
	port(
	--
	in8: in std_logic; 
	in7: in std_logic;
	in6: in std_logic; 
	in5: in std_logic;
	in4: in std_logic; 
	in3: in std_logic;
	in2: in std_logic; 
	in1: in std_logic;
	
	a11 :out std_logic_vector(7 downto 0);
	a12 :out std_logic_vector(7 downto 0);
	a13 :out std_logic_vector(7 downto 0);
	a21 :out std_logic_vector(7 downto 0);
	a22 :out std_logic_vector(7 downto 0);
	a23 :out std_logic_vector(7 downto 0);
	a31 :out std_logic_vector(7 downto 0);
	a32 :out std_logic_vector(7 downto 0);
    a33 :out std_logic_vector(7 downto 0);
	
	clk : in std_logic 
	);
 end component dich_9byte;
begin
	U0: dich_9byte port map(in8,in7,in6,in5,in4,in3,in2,in1,out1,out2,out3,out4,out5,out6,out7,out8,out9,Clk);
	U1:  latch port map(out1,out2,out3,out4,out5,out6,out7,out8,out9,a11,a12,a13,a21,a22,a23,a31,a32,a33,b11,b12,b13,b21,b22,b23,b31,b32,b33,Sl_A,Sl1,Sl2,Clk);
	U2: xl_byte port map(a11,a12,a13,a21,a22,a23,a31,a32,a33,b11,b12,b13,b21,b22,b23,b31,b32,b33,c11,c12,c13,c21,c22,c23,c31,c32,c33);
end architecture arrMul_matrix;

