-- TEST.vhd
------------------------------------------------------------------------------------
--library declaration
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.NUMERIC_BIT.all;
use ieee.STD_LOGIC_ARITH.all;
------------------------------------------------------------------------------------
--entity declaration
entity TEST is
    port(
   -- cac tin hieu input 

    CLK     : in std_logic;  --- tin hieu dong ho osc clock (40 MHz, co san tren kit)
    RST     : in std_logic ; --- reset i/p (tich cuc muc cao)    
    UP_DN   : in std_logic;  --- dieu khien bo dem tang/dem giam
    LOAD    : in std_logic;  --- Cho phep +/-1 voi bo cong nhay den led. =0 neu muon nap du lieu tu chan LOAD_COUNT vao bo cong nhay den led, i/p (bam phim 1 hoac 4 tren Kit) RL0
    RX0     : in std_logic;  --- nhan du lieu noi tiep i/p
    RX1     : in std_logic;  --- nhan du lieu noi tiep i/p

    -- cac tin hieu output

    TX0       : out std_logic; -- truyen du lieu noi tiep o/p
    TX1       : out std_logic; -- truyen du lieu noi tiep o/p
    RX0_OUT   : out std_logic; -- serial receive data  o/p on LED29
    RX1_OUT   : out std_logic; -- serial receive data  o/p on LED30

    RS_LCD  : out std_logic; --LCD signals (Register select i/p)
    EN_LCD  : out std_logic; --LCD signals (Enable input)
    RW_LCD  : out std_logic; --LCD signals (Read / write select i/p)


--signal as bus
    LOAD_COUNT  : in std_logic_vector (7 downto 0);--- Gia tri (dip switch s3) se nap vao bo cong nhay den led, khi tin hieu LOAD = 0.
    KEY_IN      : in std_logic_vector (1 downto 0); -- keyboard return line


    KEY_STATUS  : out std_logic_vector ( 2 downto 0); -- key status on LED
    SCAN_LINE   : out std_logic_vector (1 downto 0); -- scan line for keyboard
    FLASH_LED   : out std_logic_vector (7 downto 0); --(flasher led o/p)
    COUNTER_LED : out std_logic_vector (7 downto 0); -- den led hien thi gia tri trong bo dem nhay den led (counter o/p)
    DATA_LCD : out std_logic_vector(7 downto 0) --LCD signals (data i/p 8 bit)

       );  
end TEST;
------------------------------------------------------------------------------------
architecture DEF_ARCH of TEST is 
------------------------------------------------------------------------------------
--Khai bao tin hieu

signal int_clk1 :std_logic;  --- Xung dong ho co toc do = CLK/(2**22)  
signal int_clk2 :std_logic;  --- Xung dong ho co toc do = CLK/(2**23)  

--- Thanh ghi chua gia tri cua bo dem, phuc vu cho viec chia tan so
signal divide_clk : std_logic_vector (23 downto 0);
signal int_count  : std_logic_vector (7 downto 0);
signal int_flash  : std_logic_vector (2 downto 0);

--lcd signal and state declaration

type state_type is (warmup, setfunc, dis_shift, dis_on_off, dis_mode,dis_clear,dis_set_add,dis_write,home); 

signal state : state_type;

attribute syn_state_machine : boolean;
attribute syn_state_machine of state : signal is true;  

signal dis_count : std_logic_vector(3 downto 0); -- to genarate the delay bet. dis. data write
signal dis_complete : std_logic;         -- indicate display write is complete

signal lcd_clk      : std_logic;
signal  sel_char : std_logic_vector(1 downto 0); -- indicate which character set is to select

--define the characters to be display here
 
constant N: integer :=8;
type arr is array (1 to N) of std_logic_vector(7 downto 0);
constant dis_char1 : arr := (X"A0", --blank
							x"41", --A
							x"43", --C
							X"54", --T
							X"45", --E
							X"4C", --L
							X"A0", --blank
							X"50");--P

constant dis_char2 : arr :=	(X"72",--r
							x"6f", --o
							x"41", --A
							X"53", --S
							X"49", --I
							X"43", --C
							X"33", --3
							X"A0"); --blank

constant dis_char3 : arr :=(X"A0", --blank
                            X"53", --S
							x"54", --T
							x"41", --A
							X"52", --R
							X"54", --T
							X"45", --E
							X"52");--R
							

constant dis_char4 : arr :=(X"A0", --blank
							X"A0", --blank
                            x"4B", --K
							x"49", --I
							X"54", --T
							X"A0", --blank
							X"A0", --blank
							X"A0"); --blank

signal dis_char : arr;


------------------------------------------------------------------------------------
begin 
------------------------------------------------------------------------------------
--code start here
------------------------------------------------------------------------------------
-- Bo chia tan so clock (clock dau vao co toc do i/p 40 Mhz)

process (rst,clk,divide_clk)
begin
    if rst = '1' then
       divide_clk <= (others => '0');
    elsif clk ='1' and clk'event then
       divide_clk <= divide_clk + '1' ;
    end if;
end process;
------------------------------------------------------------------------------------
--- Tao xung dong ho co toc do = CLK/(2**22), tuong duong voi 1Hz
int_clk1 <= divide_clk(21);      --(17);
--- Tao xung dong ho co toc do = CLK/(2**23), tuong duong voi 0.5Hz
int_clk2 <= divide_clk(22);      --(17);
------------------------------------------------------------------------------------
--make scan line low
scan_line <= "00";
------------------------------------------------------------------------------------
-- out the keyboard return line status on LED26 to LED28
key_status <= not (key_in & load) ;
------------------------------------------------------------------------------------
-- Bo cong nhay den led co the dem tang/dem giam va nap gia tri khoi dong, voi chu ki 2s
process (rst,int_clk2)
begin
    if rst = '1' then
       int_count <= (others => '0');
    elsif int_clk2 ='1' and int_clk2'event then
        if load = '1' then  
            if up_dn = '1' then
               int_count <= int_count - '1' ;
            else
               int_count <= int_count + '1' ;
            end if;
        else
            int_count <= load_count; 
        end if;  
    end if;
end process;
------------------------------------------------------------------------------------
-- hien thi gia tri bo dem nhay den led ra pin out o/p
counter_led <= int_count;
------------------------------------------------------------------------------------
-- Bo cong nhay trang thai, dung de hien thi den flash, voi chu ki 1s
process (rst,int_clk1)
begin
    if rst = '1' then
       int_flash <= (others => '0');
    elsif int_clk1 ='1' and int_clk1'event then
        int_flash <= int_flash + '1' ;
    end if;
end process;
------------------------------------------------------------------------------------
--flasher
flash_led <=    "00000000" when int_flash = "000" else
                "00011000" when int_flash = "001" else
                "00111100" when int_flash = "010" else
                "01111110" when int_flash = "011" else
                "11111111" when int_flash = "100" else
                "01111110" when int_flash = "101" else
                "00111100" when int_flash = "110" else
                "00011000" ;
------------------------------------------------------------------------------------
-- send the clock1 & 2 on serial output
tx0 <= int_clk1 ;
tx1 <= divide_clk(23);
------------------------------------------------------------------------------------
--get serial data and display on LED29 ,LED30
rx0_out <= rx0 ;
rx1_out <= rx1 ;
------------------------------------------------------------------------------------
--lcd interface

RW_LCD <= '0' ; --make rd/wr signal low to select write mode.

EN_LCD <= lcd_clk ; -- assign the internal clock to enable of lcd

lcd_clk <= divide_clk(22);      --(23);

--int_clk2; -- use internal divide by 2 raise to 22 clock
------------------------------------------------------------------------------------
--character array select

dis_char <= dis_char1 when sel_char ="00" else
            dis_char2 when sel_char ="01" else
            dis_char3 when sel_char ="10" else
            dis_char4 ;
------------------------------------------------------------------------------------
-- lcd intialization and data write procee
-- warmup, setfunc, dis_shift, dis_on_off, dis_mode,dis_clear,dis_set_add,dis_write
process (rst,lcd_clk)
begin
    if rst = '1' then
       dis_count <= (others => '0');
       state <= warmup ;
       sel_char <= (others => '0');
    elsif lcd_clk = '1' and lcd_clk'event then
        case state is 
--state - 1
             when warmup =>
                 RS_LCD <= '0' ;    --select command mode
                 DATA_LCD <= "00000011" ;
                 if dis_count = "0011" then
                    dis_count <= (others => '0');
                    state <= setfunc ;
                 else
                    dis_count <= dis_count + 1 ;
                    state <= warmup;
                 end if;
--state - 2 
             when setfunc =>
                 RS_LCD <= '0' ;                --select command mode
                 DATA_LCD <= "00110000" ;       --0x30 (function set)
                 if dis_count = "0011" then
                    dis_count <= (others => '0');
                    state <= dis_shift ;
                    dis_complete <= '0'; 
                 else
                    dis_count <= dis_count + 1 ;
                    state <= setfunc;
                 end if;

--state - 3 
             when dis_shift =>
                 RS_LCD <= '0' ;                --select command mode
                 DATA_LCD <= "00010100" ;       --0x14 (display shift)
                 state <= dis_on_off;

--state - 4 
             when dis_on_off =>
                 RS_LCD <= '0' ;                --select command mode
                 DATA_LCD <= "00001100" ;       --0x0c (display on off)
                 state <= dis_mode;

--state - 5 
             when dis_mode =>
                 RS_LCD <= '0' ;                --select command mode
                 DATA_LCD <= "00000110" ;       --0x06 (display mode)
                 state <= dis_clear;

--state - 6 
             when dis_clear =>
                 RS_LCD <= '0' ;                --select command mode
                 DATA_LCD <= "00000001" ;       --0x01 (display clear)
                 state <= dis_set_add;

--state - 7 (display intialze finish)
             when dis_set_add =>
                 RS_LCD <= '0' ;                --select command mode
                 DATA_LCD <= "10000000" ;       --0x80 (display clear)
                 state <= dis_write;

--state - 8 (display data write starts here)
             when dis_write =>

                 if dis_complete = '1' then
                    state <= home;
                 else
                    case dis_count is
                         when "0000" => 
                              DATA_LCD <= dis_char(1) ;
                         when "0001" => 
                              DATA_LCD <= dis_char(2) ;
                         when "0010" =>
                              DATA_LCD <= dis_char(3) ;
                         when "0011" =>
                              DATA_LCD <= dis_char(4) ;
                         when "0100" =>
                              DATA_LCD <= dis_char(5) ;
                         when "0101" =>
                              DATA_LCD <= dis_char(6) ;
                         when "0110" =>
                              DATA_LCD <= dis_char(7) ;
                         when "0111" =>
                              DATA_LCD <= dis_char(8) ;
                              sel_char <= sel_char + 1;
                         when "1000" => 
                              DATA_LCD <= dis_char(1) ;
                         when "1001" => 
                              DATA_LCD <= dis_char(2) ;
                         when "1010" =>
                              DATA_LCD <= dis_char(3) ;
                         when "1011" =>
                              DATA_LCD <= dis_char(4) ;
                         when "1100" =>
                              DATA_LCD <= dis_char(5) ;
                         when "1101" =>
                              DATA_LCD <= dis_char(6) ;
                         when "1110" =>
                              DATA_LCD <= dis_char(7) ;
                         when "1111" =>
                              DATA_LCD <= dis_char(8) ;
                              dis_complete <= '1';
                              sel_char <= sel_char + 1;
                         when others =>
                              DATA_LCD <= (others => '0');
                    end case;
                    RS_LCD <= '1' ;                --select data mode
                    dis_count <= dis_count + 1;
                    state <= dis_write;
                 end if;

--state - 9 (display data write starts here)
             when home =>
                  RS_LCD <= '0' ;                --select command mode
                  dis_count <= (others => '0');
                  dis_complete <= '0';
                  DATA_LCD <= "00000111";
                  state <= dis_write;
             end case;
    end if;
end process;
------------------------------------------------------------------------------------

------------------------------------------------------------------------------------
end DEF_ARCH; 
------------------------------------------------------------------------------------
