----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:14:47 10/10/2021 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
LIBRARY ieee;
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

entity ALU is
    Port ( a : in  STD_LOGIC_VECTOR (7 downto 0);
           b : in  STD_LOGIC_VECTOR (7 downto 0);
           op : in  STD_LOGIC_VECTOR (2 downto 0);
           z : out  STD_LOGIC_VECTOR (7 downto 0);
           cout : out  STD_LOGIC;
           ov : out  STD_LOGIC;
           sign : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

begin
	PROCESS(a, b,op) 
		variable tmpz : STD_LOGIC_VECTOR ( 8 downto 0 );
		variable tmpov :  std_logic;
	
	BEGIN
		IF op= "000" THEN		
				tmpz     :=("0" & a) + ("0" & b);
				tmpov 	:= ( not a(7) and not b(7) and tmpz(7)) or ( a(7) and b(7) and not tmpz(7) ) ;	
		ELSIF op= "001" THEN
				tmpz    :=  ("0" & a)  + ( "0" &( not(b)  + 1)) ;
				tmpov   := ( a(7) and not b(7) and not tmpz(7)) or ( not a(7) and b(7) and tmpz(7));
		ELSIF op= "010" THEN
				tmpz    := ( "0" & ( a and b ));
		ELSIF op= "011" THEN
				tmpz    :=( "0" & (  a or b ));
		ELSIF op= "100" THEN
				tmpz    :=( "0" & (  a xor b ));
		ELSIF op= "101" THEN
				tmpz    :=( "0" & (  not a ));
		ELSIF op= "110" THEN
				tmpz    := (a & "0" );
		ELSIF op= "111" THEN
				tmpz    := (b(0) & "0" & b(7 downto 1) );				
		END IF;
		
		z 		<= tmpz(7 downto 0);
		cout 	<= tmpz(8);
		ov    <= tmpov;
		sign  <= (tmpov and tmpz(8)) or ( not tmpov and tmpz(7));
	
	END PROCESS;
 
end Behavioral;

