----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:07:01 10/31/2021 
-- Design Name: 
-- Module Name:    RAM_HDL - Behavioral 
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
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM_HDL is
    Port ( din : in  STD_LOGIC_VECTOR (9 downto 0);
           addr : in  STD_LOGIC_VECTOR (7 downto 0);
           rst : in  STD_LOGIC;
           en : in  STD_LOGIC;
           we : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           dout : out  STD_LOGIC_VECTOR (9 downto 0));
end RAM_HDL;

architecture Behavioral of RAM_HDL is
	type RAM_TYPE is array (0 to 255 ) of std_logic_vector (9 downto 0);
begin

	PROCESS( clk , rst , en , we , addr , din) 
		  variable RAM : RAM_TYPE :=( others => (others=>'0') );
		  variable dout_var : STD_LOGIC_VECTOR (9 downto 0);
	begin
		if (clk'Event and clk ='1') then
			if(we = '1' and en = '1') THEN
				RAM(to_integer(unsigned(addr))) := din;
			end if;
			if(en = '1') THEN
				dout_var := RAM(to_integer(unsigned(addr)));
			end if;
		end if;
		
		if (rst ='1') then
		  RAM := ( others => (others=>'0') );
		  dout_var := "0000000000";
		end if;
		
		dout <= dout_var;
	end process;

end Behavioral;