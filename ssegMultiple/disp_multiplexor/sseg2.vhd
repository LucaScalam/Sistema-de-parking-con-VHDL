library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sseg2 is
	port(
		number: in std_logic_vector(3 downto 0);
		codification: out std_logic_vector(7 downto 0)
	);
end sseg2;

architecture Behavioral of sseg2 is

begin
	with number select
		codification <= "1"&"1"&"0"&"0"&"0"&"0"&"0"&"0" when "0"&"0"&"0"&"0",
							"1"&"1"&"1"&"1"&"1"&"0"&"0"&"1" when "0"&"0"&"0"&"1",
							"1"&"0"&"1"&"0"&"0"&"1"&"0"&"0" when "0"&"0"&"1"&"0",
							"1"&"0"&"1"&"1"&"0"&"0"&"0"&"0" when "0"&"0"&"1"&"1",
							"1"&"0"&"0"&"1"&"1"&"0"&"0"&"1" when "0"&"1"&"0"&"0",
							"1"&"0"&"0"&"1"&"0"&"0"&"1"&"0" when "0"&"1"&"0"&"1",
							"1"&"0"&"0"&"0"&"0"&"0"&"1"&"0" when "0"&"1"&"1"&"0",
							"1"&"1"&"1"&"1"&"1"&"0"&"0"&"0" when "0"&"1"&"1"&"1",
							"1"&"0"&"0"&"0"&"0"&"0"&"0"&"0" when "1"&"0"&"0"&"0",
							"1"&"0"&"0"&"1"&"1"&"0"&"0"&"0" when "1"&"0"&"0"&"1",
							"1"&"0"&"0"&"0"&"1"&"0"&"0"&"0" when "1"&"0"&"1"&"0",
							"1"&"0"&"0"&"0"&"0"&"0"&"1"&"1" when "1"&"0"&"1"&"1",
							"1"&"1"&"0"&"0"&"0"&"1"&"1"&"0" when "1"&"1"&"0"&"0",
							"1"&"0"&"1"&"0"&"0"&"0"&"0"&"1" when "1"&"1"&"0"&"1",
							"1"&"0"&"0"&"0"&"0"&"1"&"0"&"0" when "1"&"1"&"1"&"0",
							"1"&"0"&"0"&"0"&"1"&"1"&"1"&"0" when others;

end Behavioral;

