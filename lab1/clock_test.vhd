--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:23:39 08/30/2012
-- Design Name:   
-- Module Name:   C:/Users/tahardy/Desktop/New folder/clock/clock_test.vhd
-- Project Name:  clock
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clock
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
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY clock_test IS
END clock_test;
 
ARCHITECTURE behavior OF clock_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clock
    PORT(
         CLK : IN  std_logic;
         En : IN  std_logic;
         Rst : IN  std_logic;
         Cout : OUT  std_logic;
         H : OUT  std_logic_vector(7 downto 0);
         M : OUT  std_logic_vector(7 downto 0);
         S : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal En : std_logic := '0';
   signal Rst : std_logic := '0';

 	--Outputs
   signal Cout : std_logic;
   signal H : std_logic_vector(7 downto 0);
   signal M : std_logic_vector(7 downto 0);
   signal S : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clock PORT MAP (
          CLK => CLK,
          En => En,
          Rst => Rst,
          Cout => Cout,
          H => H,
          M => M,
          S => S
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
		Rst	<=	'1';
		wait for 100 ns;
		En	<= '1';
		Rst	<= '0';
		wait for 100 ns;
		Rst	<=	'1';
		wait for 50 ns;
		Rst	<=	'0';
		wait for 100 ns;
		En	<= '0';
		wait for 50 ns;
		En	<=	'1';


      -- insert stimulus here 

      wait;
   end process;

END;
