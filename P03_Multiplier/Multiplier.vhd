----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:56:53 10/19/2021 
-- Design Name: 
-- Module Name:    Multiplier - Behavioral 
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
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
use ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiplier is
    Port ( inp1 : in  STD_LOGIC_VECTOR (3 downto 0);
           inp2 : in  STD_LOGIC_VECTOR (3 downto 0);
           out1 : out  STD_LOGIC_VECTOR (7 downto 0));
end Multiplier;

architecture Behavioral of Multiplier is

begin

PROCESS(inp1 , inp2) 
		VARIABLE product : STD_LOGIC_VECTOR ( 7 downto 0 );
		VARIABLE multiplier : STD_LOGIC_VECTOR ( 3 downto 0 );
		VARIABLE multiplicand : STD_LOGIC_VECTOR ( 7 downto 0 );
	BEGIN
		product :="00000000";
		multiplier := inp1;
		multiplicand :="0000" & inp2;
		
		FOR i IN 0 TO 3 LOOP
			IF (multiplier(0) = '1') THEN
				 product:= multiplicand + product;
				--product := std_logic_vector( unsigned(product) + unsigned( multiplicand));
			END IF;
			multiplier := ("0" & multiplier(3 downto 1) );
			multiplicand := (multiplicand(6 downto 0) & "0");
		END LOOP;
		
	out1 <= product;
	END PROCESS;
end Behavioral;

