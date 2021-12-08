--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:44:12 11/30/2021
-- Design Name:   
-- Module Name:   E:/Uni/AZ DL/P06/Freq_Divider/Freq_Divider_tb.vhd
-- Project Name:  Freq_Divider
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Freq_Divider
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
 
ENTITY Freq_Divider_tb IS
END Freq_Divider_tb;
 
ARCHITECTURE behavior OF Freq_Divider_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Freq_Divider
    PORT(
         div_fact : IN  integer range 255 downto 0;
         rst : IN  std_logic;
         clk_ref : IN  std_logic;
         clk_in : IN  std_logic;
         clk_out : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal div_fact : integer range 255 downto 0 := 0 ;
   signal rst : std_logic := '0';
   signal clk_ref : std_logic := '0';
   signal clk_in : std_logic := '0';

 	--Outputs
   signal clk_out : std_logic;

   -- Clock period definitions
   constant clk_ref_period : time := 10 ns;
   signal clk_in_period : time := 200 ns;
   constant clk_out_period : time := 10 ns;
 
BEGIN
	-- Instantiate the Unit Under Test (UUT)
   uut: Freq_Divider PORT MAP (
          div_fact => div_fact,
          rst => rst,
          clk_ref => clk_ref,
          clk_in => clk_in,
          clk_out => clk_out
        );
   -- Clock process definitions
   clk_ref_process :process
   begin
		clk_ref <= '0';
		wait for clk_ref_period/2;
		clk_ref <= '1';
		wait for clk_ref_period/2;
   end process;
 
   clk_in_process :process
   begin
		clk_in <= '0';
		wait for clk_in_period/2;
		clk_in <= '1';
		wait for clk_in_period/2;
   end process;

	div_fact <= 2 , 4 after 1000 ns , 5 after 3000 ns , 3 after 5000 ns , 7 after 8000 ns;
	clk_in_period <= 500 ns after 5000 ns;
END;
