library IEEE;								-- Su dung thu vien chuan
use IEEE.std_logic_1164.all;				-- Su dung cac phan tu logic

--!	@brief	Phan tu nho D FlipFlop
entity DFF is
	port (
		CLR : in std_logic;		  --! Xoa bit nho, khong dong bo
		CE : in std_logic;		  --! Cho phep Write
		CLK : in std_logic;		  --! Tin hieu dong ho, tich cuc suon len		
		D : in std_logic;		  --! Bit du lieu vao
		Q : out std_logic		  --! Bit du lieu da duoc ghi nho trong D-FF
		);
end entity;


architecture behavior of DFF is
begin
	process (CLK, CLR)				  -- Process chi duoc goi ra de thuc thi, khi co su thay doi tren tin hieu CLK va CLR
	begin
		if CLR = '1' then			  -- Neu tin hieu CLR tich cuc, thi gan ngay dau ra Q = 0
			Q <= '0';
		elsif rising_edge(CLK) then	  -- Neu tin hieu CLR khong tich cuc, va tai suon duong cua tin hieu dong ho CLK
			if CE = '1' then		  --      Neu tin hieu cho phep Write CE tich cuc, thi chot lai gia tri can nho
				Q <= D;
			end if;					  -- Trong cac truong hop con lai, dau ra Q giu nguyen gia tri, tuc la trang thai nho.
		end if;
	end process;
end behavior;
