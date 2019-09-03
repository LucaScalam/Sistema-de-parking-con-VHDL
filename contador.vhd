library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity contador is
	generic(N: integer := 16);
	port(
		clk: in std_logic;
		reset: in std_logic;
		inc,dec: in std_logic;
		q: out std_logic_vector(N-1 downto 0);
		max_tick: out std_logic;
		min_tick: out std_logic
		);
end contador;

architecture Behavioral of contador is
	signal next_out,q_f: std_logic_vector(N-1 downto 0);
	signal en_adapt,up_adapt: std_logic;
begin
	-- Instancia de cada modulo
	NEXT_STATE: entity work.next_state_logic
		port map( up=>up_adapt, en=>en_adapt, load=>'0' ,syn_clr=>'0', d=>"0000000000000000", state_reg=>q_f, state_next=>next_out);
	OUTPUT: entity work.output_logic
		port map( state_reg=>q_f, q=>q, max_tick=>max_tick,min_tick=>min_tick);
	FLIPFLOP: entity work.d_ff2
		port map( clk=>clk, reset=>reset, d=>next_out, q=>q_f);
	ADAPTA: entity work.adaptation
		port map(inc=>inc, dec=>dec, en=>en_adapt,up=>up_adapt);

end Behavioral;
