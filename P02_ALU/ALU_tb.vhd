--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:18:58 10/10/2021
-- Design Name:   
-- Module Name:   E:/Uni/AZDL/P02/ALU/ALU_tb.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         a : IN  std_logic_vector(7 downto 0);
         b : IN  std_logic_vector(7 downto 0);
         op : IN  std_logic_vector(2 downto 0);
         z : OUT  std_logic_vector(7 downto 0);
         cout : OUT  std_logic;
         ov : OUT  std_logic;
         sign : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(7 downto 0) := (others => '0');
   signal b : std_logic_vector(7 downto 0) := (others => '0');
   signal op : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal z : std_logic_vector(7 downto 0);
   signal cout : std_logic;
   signal ov : std_logic;
   signal sign : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          a => a,
          b => b,
          op => op,
          z => z,
          cout => cout,
          ov => ov,
          sign => sign
        );

a <= "01111111" after 0 ns , "10000001" after 50 ns , "01111111" after 100 ns , "10000001" after 150 ns ,
	"01111111" after 200 ns , "10000001" after 250 ns , "01111111" after 300 ns , "00000001" after 350 ns,
	"10101100" after 400 ns;

b <= "01111111" after 0 ns , "10000001" after 50 ns , "11111111" after 100 ns , "00000001" after 150 ns ,
	"10000001" after 200 ns , "01111111" after 250 ns , "00000001" after 300 ns , "01111111" after 350 ns ,
	"01101110" after 400 ns;

op <= "000" after 0 ns , "001" after 200 ns , "010" after 400 ns , "011" after 450 ns , "100" after 500 ns , 
	"101" after 550 ns , "110" after 600 ns , "111" after 650 ns;
	
END;
