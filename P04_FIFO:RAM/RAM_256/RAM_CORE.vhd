----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:18:55 11/02/2021 
-- Design Name: 
-- Module Name:    RAM_CORE - Behavioral 
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

entity RAM_CORE is
    Port ( din : in  STD_LOGIC_VECTOR (9 downto 0);
           addr : in  STD_LOGIC_VECTOR (7 downto 0);
           rst : in  STD_LOGIC;
           en : in  STD_LOGIC;
           we : in  STD_LOGIC_VECTOR(0 DOWNTO 0);
           clk : in  STD_LOGIC;
           dout : out  STD_LOGIC_VECTOR (9 downto 0));
end RAM_CORE;

architecture Behavioral of RAM_CORE is

	COMPONENT RAM_COREIP
	  PORT (
		 clka : IN STD_LOGIC;
		 ena : IN STD_LOGIC;
		 wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		 rsta : IN STD_LOGIC ;
		 addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 dina : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 douta : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)
	  );
END COMPONENT;

begin
MRAM : RAM_COREIP
  PORT MAP (
    clka => clk,
    ena => en,
    wea => we,
	 rsta => rst,
    addra => addr,
    dina => din,
    douta => dout
  );



end Behavioral;

