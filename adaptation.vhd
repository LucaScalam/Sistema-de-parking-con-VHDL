library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity adaptation is
	port(
		inc, dec: in std_logic;
		en, up: out std_logic
	);
end adaptation;

architecture Behavioral of adaptation is

begin
	
	en <= '1' when inc='1' and dec='0' else
			'1' when inc='0' and dec='1' else
			'0'; 
	up <= '1' when inc='1' and dec='0' else
			'0'; 

end Behavioral;

