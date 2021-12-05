--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:46:19 11/02/2021
-- Design Name:   
-- Module Name:   E:/Uni/AZDL/P04/FIFO/FIFO_CORE_tb.vhd
-- Project Name:  FIFO
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FIFO_CORE
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
 
ENTITY FIFO_CORE_tb IS
END FIFO_CORE_tb;
 
ARCHITECTURE behavior OF FIFO_CORE_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FIFO_CORE
    PORT(
         din : IN  std_logic_vector(9 downto 0);
         rst : IN  std_logic;
         rd_en : IN  std_logic;
         wr_en : IN  std_logic;
         empty : OUT  std_logic;
         full : OUT  std_logic;
         dout : OUT  std_logic_vector(9 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal din : std_logic_vector(9 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal rd_en : std_logic := '0';
   signal wr_en : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal empty : std_logic;
   signal full : std_logic;
   signal dout : std_logic_vector(9 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FIFO_CORE PORT MAP (
          din => din,
          rst => rst,
          rd_en => rd_en,
          wr_en => wr_en,
          empty => empty,
          full => full,
          dout => dout,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
	wr_en <= '1' , '0' after 50 ns ; 
	rd_en <= '0' , '1' after 100 ns;
	rst <= '0' , '1' after 123 ns;	din <="0000111100"  , "0001111100" after 10ns,  "0001111111"  after 20ns , 	"1111111100" after 30ns,  "1001100001"  after 40ns   ;

END;
