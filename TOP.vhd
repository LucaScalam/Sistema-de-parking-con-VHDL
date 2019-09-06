library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TOP is
	generic(N: integer := 16);
	port(
		clk,reset,a,b: in std_logic;
		min,max: out std_logic;
		an: out std_logic_vector(3 downto 0);
		codif: out std_logic_vector(7 downto 0)
	);
end TOP;

architecture Behavioral of TOP is
	signal dec_i,inc_i,a_i,b_i: std_logic;
	signal q: std_logic_vector(N-1 downto 0);
begin
	sensors: entity work.Sensors
		port map( clk=>clk, reset=>reset, a=>a_i ,b=>b_i, inc=>inc_i, dec=>dec_i);
	counter: entity work.contador 
		port map( clk=>clk, reset=>reset, inc=>inc_i, dec=>dec_i, q=>q, max_tick=>max, min_tick=>min);
	sseMultiple: entity work.ssegMultiple2
		port map(clk=>clk,reset=>reset,sw=>q,btn=>"1111",codif=>codif,an=>an);
	deboun :entity work.debouncing
		port map(clk=>clk,reset=>reset,a=>a,b=>b,a_o=>a_i,b_o=>b_i);
end Behavioral;
 
 
 