----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:14:46 11/23/2021 
-- Design Name: 
-- Module Name:    Elevator - Behavioral 
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

entity Elevator is
    Port ( F : in  STD_LOGIC_VECTOR (3 downto 0);
           U : in  STD_LOGIC_VECTOR (3 downto 0);
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           S : in  STD_LOGIC_VECTOR (3 downto 0);
           rst : in  STD_LOGIC;
           ac : out  STD_LOGIC_VECTOR (1 downto 0);
           op : out  STD_LOGIC;
           disp : out  STD_LOGIC_VECTOR (2 downto 0);
           clk : in  STD_LOGIC);
end Elevator;

architecture Behavioral of Elevator is

	signal prst , nxst : integer range 0 to 9;
	
	signal freg : STD_LOGIC_VECTOR (3 downto 0);
	signal clr : STD_LOGIC_VECTOR (3 downto 0);
	
	signal ureg : STD_LOGIC_VECTOR (3 downto 0);
	signal dreg : STD_LOGIC_VECTOR (3 downto 0);
 
begin

--hypothesize :
	process (clk)
	begin
	if ( clk'Event and clk ='1') then
			freg <= F and (not clr);
	end if;
	if ( clk'Event and clk ='1') then
			ureg <= U and (not clr);
	end if;
	if ( clk'Event and clk ='1') then
			dreg <= D and (not clr);
	end if;
	end process;

		
	process(clk,rst)
	begin 
		if (rst='1') then
			prst <= 0;
		elsif ( clk'Event and clk ='1') then
			prst <= nxst;
		end if;
	end process;
	
	process ( freg , ureg , dreg , S , prst)
	begin
		case prst is
		when 0 =>
			if ( s="0001" and ( freg="1--0" or freg="-1-0" or freg="--10" or  ureg="-1--" or ureg="--1-" or dreg="1---" or dreg="-1--" or dreg="--1-"  ) ) then
				op <= '0';
				ac <= "01";
				nxst <= 4;
				
				clr <= "0000";
				
				disp <= "001";
			else 
				op <= '1';
				ac <= "00";
				nxst <= 0;
				clr <= "0001";
				disp <= "001";
			end if;
		
		when 1 =>
			if ( s="0010" and ( freg="1-0-" or freg="-10-" or ( freg = "--00" and (ureg="-10-" or dreg="1---" or dreg="-1--" ) ) ) ) then
				op <= '0';
				ac <= "01";
				nxst <= 5;
				clr <= "0000";
				
				disp <= "010";
			elsif ( s="0010" and ( freg="--01" or (ureg="0001" and freg="000-" ) ) ) then
				op <= '0';
				ac <= "10";
				nxst <= 7;	
				clr <= "0000";
				
				disp <= "010";
			else
				op <= '1';
				ac <= "00";
				nxst <= 1;
				clr <= "0010";
				
				disp <= "010";
			end if;
		
		when 2 =>
			if ( s="0100" and  ( freg="10--" or (dreg="1---" and freg="-000" ) ) ) then
				op <= '0';
				ac <= "01";
				nxst <= 6;
				clr <= "0000";
				
				disp <= "011";
			elsif ( s="0100" and ( freg="00-1" or freg="001-" or ( freg = "00--" and (ureg="0010" or ureg="0001" or dreg="0010" ) ) ) ) then
				op <= '0';
				ac <= "10";
				nxst <= 8;
				clr <= "0000";
				
				disp <= "011";
			else
				op <= '1';
				ac <= "00";
				nxst <= 2;
				clr <= "0100";
				
				disp <= "011";
			end if;
			
		when 3 =>
				if ( s="1000" and ( freg="0--1" or freg="0-1-" or freg="01--" or  ureg="-1--" or ureg="--1-" or ureg="---1" or dreg="-1--" or dreg="--1-"  ) ) then
				op <= '0';
				ac <= "10";
				nxst <= 9;
				clr <= "0000";
				
				disp <= "100";
			else
				op <= '1';
				ac <= "00";
				nxst <= 3;
				clr <= "1000";

				disp <= "100";
			end if;
					
		when 4 => 
			if ( s="0010" and ( freg="--1-" or ureg="--1-" or ( dreg="001-" and freg="00--" and ureg="00--"   ) ) ) then
				op <= '1';
				ac <= "00";
				nxst <= 1;
				clr <= "0010";
			
				disp <= "010";
			elsif ( s="0010" and not( freg="--1-" or ureg="--1-" or ( dreg="001-" and freg="00--" and ureg="00--"   ) ) ) then
				op <= '0';
				ac <= "01";
				nxst <= 5;
				clr <= "0000";
				
				disp <= "010";
			else
				op <= '0';
				ac <= "01";
				nxst <= 4;
				clr <= "0000";
				
				disp <= "001";
			end if;
			
		when 5 => 
			if ( s="0100" and ( freg="-1--" or ureg="-1--" or ( dreg="01--" and freg="0---") ) ) then
				op <= '1';
				ac <= "00";
				nxst <= 2;
				clr <= "0100";
				
				disp <= "011";
			elsif ( s="0100" and not ( freg="-1--" or ureg="-1--" or ( dreg="01--" and freg="0---") ) ) then
				op <= '0';
				ac <= "01";
				nxst <= 6;
				clr <= "0000";
				
				disp <= "011";
			else
				op <= '0';
				ac <= "01";
				nxst <= 5;
				clr <= "0000";
				
				disp <= "010";
			end if;
			
		when 6 => 
			if ( s="1000" ) then
				op <= '1';
				ac <= "00";
				nxst <= 3;
				clr <= "1000";
				
				disp <= "100";
			else
				op <= '0';
				ac <= "01";
				nxst <= 6;
				clr <= "0000";
				
				disp <= "011";
			end if;		
		
		when 7 => 
			if ( s="0001" ) then
				op <= '1';
				ac <= "00";
				nxst <= 0;
				clr <= "0001";
				
				disp <= "001";
			else
				op <= '0';
				ac <= "10";
				nxst <= 7;
				clr <= "0000";
				
				disp <= "010";
			end if;
			
		when 8 => 
			if ( s="0010" and ( freg="--1-" or dreg="--1-" or ( ureg="--10" and freg="---0" and dreg = "---0") ) ) then
				op <= '1';
				ac <= "00";
				nxst <= 1;
				clr <= "0010";
				
				disp <= "010";
			elsif ( s="0010" and not ( freg="--1-" or dreg="--1-" or ( ureg="--10" and freg="---0" and dreg = "---0") ) ) then
				op <= '0';
				ac <= "10";
				nxst <= 7;
				clr <= "0000";
				
				disp <= "010";
			else
				op <= '0';
				ac <= "10";
				nxst <= 8;
				clr <= "0000";
				
				disp <= "011";
			end if;
			
		when 9 => 
			if ( s="0100" and ( freg="-1--" or dreg="-1--" or ( ureg="0100" and freg="--00" and dreg="--00"   ) ) ) then
				op <= '1';
				ac <= "00";
				nxst <= 2;
				clr <= "0100";
				
				disp <= "011";
			elsif ( s="0100" and not( freg="-1--" or dreg="-1--" or ( ureg="0100" and freg="--00" and dreg="--00"   ) ) ) then
				op <= '0';
				ac <= "10";
				nxst <= 8;
				clr <= "0000";
				
				disp <= "011";
			else
				op <= '0';
				ac <= "10";
				nxst <= 9;
				clr <= "0000";
				disp <= "100";
			end if;
		
		when others =>
			nxst <=0 ;
			op <= '0';
			ac <= "10";
			clr <= "0000";
			
			disp <= "111";
		end case;
		
	end process;
		
		
end Behavioral;

