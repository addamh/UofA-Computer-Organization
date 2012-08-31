library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Use ieee.std_logic_unsigned.all;

entity Counter_60 is
port(	CLK		:	in	std_logic;
		En			:	in	std_logic;
		Rst		:	in	std_logic;
		Cout		:	out	std_logic;
		Fout		:	out	std_logic_vector(7 downto 0));
end Counter_60;



architecture Behavioral of Counter_60 is
	signal	time	:	std_logic_vector(7 downto 0);
begin

TT:process(CLK,Rst,En)
	Begin
		if (CLK='1' and CLK'event) then
			if (Rst = '1') then
				time <= "00000000";
			else
				if (En = '1') then
					if (time < "00111011") then
						time <= time+1;
						Cout <= '0';
					else
						time <= "00000000";
						Cout <= '1';
					End if;
				End if;
			End if;
		End if;
	End process;
	Fout <= time;

end Behavioral;

