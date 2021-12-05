--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:33:26 10/19/2021
-- Design Name:   
-- Module Name:   E:/Uni/AZDL/P03/Multiplier/Multiplier_tb.vhd
-- Project Name:  Multiplier
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Multiplier
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Multiplier_tb IS
END Multiplier_tb;
 
ARCHITECTURE behavior OF Multiplier_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Multiplier
    PORT(
         inp1 : IN  std_logic_vector(3 downto 0);
         inp2 : IN  std_logic_vector(3 downto 0);
         out1 : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal inp1 : std_logic_vector(3 downto 0) := (others => '0');
   signal inp2 : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal out1 : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Multiplier PORT MAP (
          inp1 => inp1,
          inp2 => inp2,
          out1 => out1
        );

	inp1 <= "0111" after 0 ns , "1001" after 50 ns , "0001" after 100 ns , "0000" after 150 ns ;
--		"01111111" after 200 ns , "10000001" after 250 ns , "01111111" after 300 ns , "00000001" after 350 ns,
--		"10101100" after 400 ns;

	inp2 <= "0111" after 0 ns , "1010" after 50 ns , "1100" after 100 ns , "0001" after 150 ns ;
--		"10000001" after 200 ns , "01111111" after 250 ns , "00000001" after 300 ns , "01111111" after 350 ns ,
--		"01101110" after 400 ns;
			

END;
