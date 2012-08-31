--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:47:49 08/30/2012
-- Design Name:   
-- Module Name:   C:/Users/tahardy/Desktop/New folder/clock/counter_60_test.vhd
-- Project Name:  clock
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Counter_60
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
 
ENTITY counter_60_test IS
END counter_60_test;
 
ARCHITECTURE behavior OF counter_60_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Counter_60
    PORT(
         CLK : IN  std_logic;
         En : IN  std_logic;
         Rst : IN  std_logic;
         Cout : OUT  std_logic;
         Fout : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal En : std_logic := '0';
   signal Rst : std_logic := '0';

 	--Outputs
   signal Cout : std_logic;
   signal Fout : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Counter_60 PORT MAP (
          CLK => CLK,
          En => En,
          Rst => Rst,
          Cout => Cout,
          Fout => Fout
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
