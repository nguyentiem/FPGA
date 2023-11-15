		 	   
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
  
 
------------------------------------
------------------------------------
-----------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
USE ieee.std_logic_signed.all; 
use IEEE.std_logic_arith.all;

entity latch is 
	port( 
	in8: in std_logic; 
	in7: in std_logic;
	in6: in std_logic; 
	in5: in std_logic;
	in4: in std_logic; 
	in3: in std_logic;
	in2: in std_logic; 
	in1: in std_logic;
	
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
signal cum1 : std_logic_vector(7downto 0);
signal cum2 : std_logic_vector(7downto 0);
signal A1:    std_logic_vector(7downto 0);
signal A2:    std_logic_vector(7downto 0);
signal A3:    std_logic_vector(7downto 0);
signal A4:    std_logic_vector(7downto 0);
signal A5:    std_logic_vector(7downto 0);
signal A6:    std_logic_vector(7downto 0);
signal A7:    std_logic_vector(7downto 0);
signal A8:    std_logic_vector(7downto 0);
signal A9:    std_logic_vector(7downto 0);


signal	in18:  std_logic; 
signal	in17:  std_logic;
signal	in16:  std_logic; 
signal	in15:  std_logic;
signal	in14:  std_logic; 
signal	in13:  std_logic;
signal	in12:  std_logic; 
signal	in11:  std_logic; 
signal	in28:  std_logic; 

signal	in27:  std_logic;
signal	in26:  std_logic; 
signal	in25:  std_logic;
signal	in24:  std_logic; 
signal	in23:  std_logic;
signal	in22:  std_logic; 
signal	in21:  std_logic;

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

begin
	process(Sl_A,Clk,Sl1,Sl2)
	begin
	  if(Sl1='0')then
		  if(Sl2='1')then
			  out21<=B_out011;
			  out22<=B_out012;
			  out23<=B_out013;
			  out24<=B_out014;
			  out25<=B_out015;
			  out26<=B_out016;
			  out27<=B_out017;
			  out28<=B_out018;
			  out29<=B_out019;
		  end if;
	 end if;
	 
	 if(Sl2='0')then
		  if(Sl1='1')then
			  out21<=B_out101;
			  out22<=B_out102;
			  out23<=B_out103;
			  out24<=B_out104;
			  out25<=B_out105;
			  out26<=B_out106;
			  out27<=B_out107;
			  out28<=B_out108;
			  out29<=B_out109;
		  end if;
	 end if;
	 if(Sl2='0')then
		  if(Sl1='0')then
			  out21<=B_out001;
			  out22<=B_out002;
			  out23<=B_out003;
			  out24<=B_out004;
			  out25<=B_out005;
			  out26<=B_out006;
			  out27<=B_out007;
			  out28<=B_out008;
			  out29<=B_out009;
		  end if;
	 end if;
	 if(Sl_A='1')then
		cum1<=cum2;
	else 
		B001<=cum2;
	end if;
	end process;
	
cum2 <= in8&in7&in6&in5&in4&in3&in2&in1;
-------B00----------------- 
 U1: Dff port map(B001,B002,Clk);
 U2: Dff port map(B002,B003,Clk); 
 U3: Dff port map(B003,B004,Clk);
 U4: Dff port map(B004,B005,Clk);
 U5: Dff port map(B005,B006,Clk);
 U6: Dff port map(B006,B007,Clk);
 U7: Dff port map(B007,B008,Clk);
 U8: Dff port map(B008,B009,Clk);
 U9: Dff port map(B009,B_out009,Clk); 
 B_out001<= B002; 
 B_out002<= B003; 
 B_out003<= B004; 
 B_out004<= B005;
 B_out005<= B006; 
 B_out006<= B007;
 B_out007<= B008; 
 B_out008<= B009;
 
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
 U41: Dff port map(cum1,A1,Clk);
 U42: Dff port map(A1,A2,Clk); 
 U43: Dff port map(A2,A3,Clk);
 U44: Dff port map(A3,A4,Clk);
 U45: Dff port map(A4,A5,Clk);
 U46: Dff port map(A5,A6,Clk);
 U47: Dff port map(A6,A7,Clk);
 U48: Dff port map(A7,A8,Clk);
 U49: Dff port map(A8,A9,Clk);
 out11<=A1; 
 out12<=A2;
 out13<=A3; 
 out14<=A4;
 out15<=A5; 
 out16<=A6;
 out17<=A7; 
 out18<=A8;
 out19<=A9; 

 
 
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
	
	c11: out std_logic_vector (7 downto 0);  
	c12: out std_logic_vector (7 downto 0);  
	c13: out std_logic_vector (7 downto 0);  
	c21: out std_logic_vector (7 downto 0);  
	c22: out std_logic_vector (7 downto 0);  
	c23: out std_logic_vector (7 downto 0);  
	c31: out std_logic_vector (7 downto 0);  
	c32: out std_logic_vector (7 downto 0);  
	c33: out std_logic_vector (7 downto 0);	
	
	Sl_A:in std_logic;
	Sl1 :in std_logic;
	Sl2 :in std_logic;
	Clk:in std_logic
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
		
	signal	b11:  std_logic_vector (7 downto 0);  
	signal  b12:  std_logic_vector (7 downto 0);  
	signal  b13:  std_logic_vector (7 downto 0);  
	signal	b21:  std_logic_vector (7 downto 0);  
	signal	b22:  std_logic_vector (7 downto 0);  
	signal	b23:  std_logic_vector (7 downto 0);  
	signal	b31:  std_logic_vector (7 downto 0);  
	signal	b32:  std_logic_vector (7 downto 0);  
	signal	b33:  std_logic_vector (7 downto 0); 
	
	
	
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
		in8: in std_logic; 
		in7: in std_logic;
		in6: in std_logic; 
		in5: in std_logic;
		in4: in std_logic; 
		in3: in std_logic;
		in2: in std_logic; 
		in1: in std_logic;
		
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

begin
	
	U1:  latch port map(in8,in7,in6,in5,in4,in3,in2,in1,a11,a12,a13,a21,a22,a23,a31,a32,a33,b11,b12,b13,b21,b22,b23,b31,b32,b33,Sl_A,Sl1,Sl2,Clk);
	U2: xl_byte port map(a11,a12,a13,a21,a22,a23,a31,a32,a33,b11,b12,b13,b21,b22,b23,b31,b32,b33,c11,c12,c13,c21,c22,c23,c31,c32,c33);
end architecture arrMul_matrix;

