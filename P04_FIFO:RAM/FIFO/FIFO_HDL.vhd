----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:01:42 10/31/2021 
-- Design Name: 
-- Module Name:    FIFO_HDL - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIFO_HDL is
    Port ( din : in  STD_LOGIC_VECTOR (9 downto 0);
           rst : in  STD_LOGIC;
           rd_en : in  STD_LOGIC;
           wr_en : in  STD_LOGIC;
           empty : out  STD_LOGIC;
           full : out  STD_LOGIC;
           dout : out  STD_LOGIC_VECTOR (9 downto 0);
           clk : in  STD_LOGIC );
end FIFO_HDL;

architecture Behavioral of FIFO_HDL is
	type RAM_TYPE is array (0 to 255 ) of std_logic_vector (9 downto 0);
	signal RAM : RAM_TYPE;
begin

PROCESS( clk , rst , wr_en , rd_en , din) 
	variable top : integer :=0;
	variable tail : integer:=0;
begin
	if (clk'Event and clk ='1') then
		if( (tail - top = 1) or (tail = 255 and top = 0)) then
			full <= '1';
		else 
			full <= '0';
			if(wr_en = '1') then
				RAM(top) <= din;
				top := top + 1;
				if(top = 256) then
					top :=0 ;
				end if;
			end if;
		end if;
		
		if( tail = top ) then
			empty <= '1';
		else 
			empty <= '0';
			if(rd_en = '1') then
				dout <= RAM(tail);
				tail := tail + 1;
				if(tail = 256) then
					tail :=0 ;
				end if;
			end if;	
		end if;	
	end if;
	
	if (rst ='1') then
	  dout <= "0000000000";
	  empty <= '1';
	  full <= '0';
	  top := 0 ;
	  tail := 0;
	end if;
end process;

end Behavioral;

