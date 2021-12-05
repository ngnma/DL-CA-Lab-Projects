----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:44:09 11/02/2021 
-- Design Name: 
-- Module Name:    FIFO_CORE - Behavioral 
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

entity FIFO_CORE is
    Port ( din : in  STD_LOGIC_VECTOR (9 downto 0);
           rst : in  STD_LOGIC;
           rd_en : in  STD_LOGIC;
           wr_en : in  STD_LOGIC;
           empty : out  STD_LOGIC;
           full : out  STD_LOGIC;
           dout : out  STD_LOGIC_VECTOR (9 downto 0);
           clk : in  STD_LOGIC);
end FIFO_CORE;

architecture Behavioral of FIFO_CORE is

COMPONENT FIFO_COREIP
  PORT (
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC
  );
END COMPONENT;

begin

MFIFO : FIFO_COREIP
  PORT MAP (
    clk => clk,
    rst => rst,
    din => din,
    wr_en => wr_en,
    rd_en => rd_en,
    dout => dout,
    full => full,
    empty => empty
  );
  
end Behavioral;

