library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ng_to_sseg is
	generic(N: integer := 4);
	port(
		in0: in std_logic_vector(N-1 downto 0);
		in1: in std_logic_vector(N-1 downto 0);
		in2: in std_logic_vector(N-1 downto 0);
		in3: in std_logic_vector(N-1 downto 0);	
		ng: in std_logic_vector(1 downto 0);
		cod: out std_logic_vector(7 downto 0)
	);
end ng_to_sseg;

architecture Behavioral of ng_to_sseg is
	signal num: std_logic_vector(N-1 downto 0);
begin
	siete: entity work.sseg2
		port map( number=>num, codification=>cod);
	with ng select
		num <= 	in0 when "00",
					in1 when "01",
					in2 when "10",
					in3 when others;

end Behavioral;

