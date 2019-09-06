library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity next_state_logic is
	generic(N: integer := 16);
	port(
		state_reg: in std_logic_vector( N-1 downto 0);
		up,en,load,syn_clr: in std_logic;
		d: in std_logic_vector(N-1 downto 0);
		state_next: out std_logic_vector(N-1 downto 0)
		);
end next_state_logic;

architecture Behavioral of next_state_logic is
	signal num: std_logic_vector(1 downto 0); --Numero a sumar o restar al contador (-1 o +1)
	signal aux: std_logic_vector(N downto 0); --Resultado de sumarle o restarle al contador
	signal mux1: std_logic_vector(N-1 downto 0); -- salida del 1er, 2do o 3er multiplexlor
	signal mux2: std_logic_vector(N-1 downto 0);
	signal mux3: std_logic_vector(N-1 downto 0);
begin
	with up select
		num <= '1' & '1' when '0',
				 '0' & '1' when others;
	aux <= std_logic_vector(signed('0' & state_reg)+signed(num)); -- Creo esta senal porque el resultado tiene N+1 bits
	with en select
		mux1 <= state_reg when '0',
			  aux(N-1 downto 0) when others;
	with load select
		mux2 <= mux1 when '0',
			  d when others;
	
	with syn_clr select
		mux3 <= mux2 when '0',
			  (others=>'0') when others;
	state_next <= mux3;
end Behavioral;

