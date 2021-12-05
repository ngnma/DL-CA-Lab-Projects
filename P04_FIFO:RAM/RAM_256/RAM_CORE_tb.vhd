--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:28:23 11/02/2021
-- Design Name:   
-- Module Name:   E:/Uni/AZDL/P04/RAM256/RAM_CORE_tb.vhd
-- Project Name:  RAM256
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM_CORE
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
 
ENTITY RAM_CORE_tb IS
END RAM_CORE_tb;
 
ARCHITECTURE behavior OF RAM_CORE_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM_CORE
    PORT(
         din : IN  std_logic_vector(9 downto 0);
         addr : IN  std_logic_vector(7 downto 0);
         rst : IN  std_logic;
         en : IN  std_logic;
         we : IN  std_logic_vector(0 downto 0);
         clk : IN  std_logic;
         dout : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal din : std_logic_vector(9 downto 0) := (others => '0');
   signal addr : std_logic_vector(7 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal en : std_logic := '0';
   signal we : std_logic_vector(0 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal dout : std_logic_vector(9 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM_CORE PORT MAP (
          din => din,
          addr => addr,
          rst => rst,
          en => en,
          we => we,
          clk => clk,
          dout => dout
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
 	we <= "1" , "0" after 35 ns ; 
	en <= '1' ;
	rst <= '0' , '1' after 52 ns;
	addr <= "00000000" , "00000001" after 10 ns ,"00000010" after 20 ns ,"00000011" after 30 ns , "00000000" after 40 ns ,"00000001" after 50 ns ,"00000010" after 55 ns ,"00000011" after 70 ns ;	din <= "1000000000" , "1000000001" after 10 ns , "1000000010" after 20 ns , "1000000011" after 30 ns ;--	addr <= "00000001" after 5 ns, "00000010" after 20 ns ,"00000111" after 30 ns ,  "00000011" after 40 ns ,"00000100" after 50 ns ;
--	din <= "0000001111" after 5 ns, "1111111000" after 20 ns , "0000001110" after 30 ns , "0000000011" after 40 ns ,"1111011111" after 50 ns;
--	en <= '1' ;
--	we <= "1", "0" after 70 ns;
--	rst <= '1' , '0' after 5 ns , '1' after 84 ns;
	
END;
