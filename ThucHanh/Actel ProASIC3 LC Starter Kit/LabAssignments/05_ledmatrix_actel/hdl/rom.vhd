library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity rom is  
	 generic(
        ROW_WIDTH : INTEGER := 8;  --- Khong su dung, 
	    ADDR_WIDTH : INTEGER := 3  --- Khong su dung, 
	 );    
	 port(
		 CLK : in STD_LOGIC;                               --- Tin hieu dong ho
		 ADDR : in STD_LOGIC_VECTOR(ADDR_WIDTH-1 downto 0);--- Tin hieu dia chi ngan nho can doc
		 Q : out STD_LOGIC_VECTOR(ROW_WIDTH-1 downto 0)    --- Gia tri cua ngan nho tuong ung voi dia chi ADDR
	     );
end rom;

architecture rom_arch of rom is
	type rom_mem_type is array (0 to 7) of std_logic_vector(7 downto 0);
begin
	process (CLK)
	begin
		if rising_edge(CLK) then 
            case CONV_INTEGER(ADDR) is
            when 0  => Q <= "00010001";  --  1
            when 1  => Q <= "00100011";  --  3      
            when 2  => Q <= "01000111";  --  7
            when 3  => Q <= "10001111";  --  F
            when 4  => Q <= "10001111";  -- 8F
            when 5  => Q <= "01000111";  -- 87 
            when 6  => Q <= "00100011";  -- 83
            when 7  => Q <= "00010001";  -- 81
            when others => Q <= (others => '0');
            end case;
		end if;
	end process;
end architecture;
