library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

entity clock is
	port(	CLK	:	in	std_logic;
			En		:	in	std_logic;
			Rst	:	in	std_logic;
			Cout	:	out	std_logic;
			H		:	out	std_logic_vector(7 downto 0);
			M		:	out	std_logic_vector(7 downto 0);
			S		:	out	std_logic_vector(7 downto 0));
end clock;


		
architecture Behavioral of clock is
	Component Counter_60
		port(	CLK	:	in	std_logic;
				En		:	in	std_logic;
				Rst	:	in	std_logic;
				Cout	:	out	std_logic;
				Fout	:	out	std_logic_vector(7 downto 0));
	End Component;
		
	Component Counter_24
		port(	CLK	:	in	std_logic;
				En		:	in	std_logic;
				Rst	:	in	std_logic;
				Cout	:	out	std_logic;
				Fout	:	out	std_logic_vector(7 downto 0));
	End Component;
	
	signal first_cout	:	std_logic;
	signal second_cout	:	std_logic;
begin

	C1:Counter_60 port map(CLK, En, Rst, first_cout, S);
	C2:Counter_60 port map(first_cout, En, Rst, second_cout, M);
	C3:Counter_24 port map(second_cout, En, Rst, Cout, H);

end Behavioral;
