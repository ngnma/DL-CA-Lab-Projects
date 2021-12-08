----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:33:40 11/30/2021 
-- Design Name: 
-- Module Name:    Freq_Divider - Behavioral 
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

entity Freq_Divider is
    Port ( div_fact : in  Integer range 255 downto 0;
           rst : in  STD_LOGIC;
           clk_ref : in  STD_LOGIC;
           clk_in : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end Freq_Divider;

architecture Behavioral of Freq_Divider is
	signal refrence_clk : std_logic;	
	component Fpga_Clock
	port
	 (-- Clock in ports
	  CLK_IN1           : in     std_logic;
	  -- Clock out ports
	  CLK_OUT1          : out    std_logic
	 );
	end component;
begin

	fpga_clk : Fpga_Clock
  port map
   (-- Clock in ports
    CLK_IN1 => clk_ref,
    -- Clock out ports
    CLK_OUT1 => refrence_clk );
	 
	process( refrence_clk  , rst)
		variable iterates : integer range 255 downto 0 := 0;
		variable tempout : STD_LOGIC := '0';
		variable last_in : STD_LOGIC := '0';
	begin 	
		if ( rst = '1') then
			tempout := '0';
			iterates := 0;
		elsif ( refrence_clk 'Event and refrence_clk ='1')then
			if ( last_in = not clk_in)then
				last_in  := clk_in;
				iterates := iterates + 1;
				if ( iterates = div_fact )then
					iterates := 0;
					tempout := not tempout;
				end if;
			end if;
		end if;
		clk_out <= tempout;
	end process;

end Behavioral;

