library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity disp_mux is
	generic(N: integer := 19);
	port(
		clk, reset: in std_logic;
		M: in unsigned(N-1 downto 0);
		in0: in std_logic_vector(3 downto 0);
		in1: in std_logic_vector(3 downto 0);
		in2: in std_logic_vector(3 downto 0);
		in3: in std_logic_vector(3 downto 0);
		cod: out std_logic_vector(7 downto 0);
		an: out std_logic_vector(3 downto 0)
	);
end disp_mux;

architecture Behavioral of disp_mux is
	signal tick_out_t: std_logic;
	signal ng_generated: std_logic_vector(1 downto 0);
begin
	timer: entity work.Timing
		port map( clk=>clk, reset=>reset, M=>M, tick=>tick_out_t);
	num_gene: entity work.num_generator
		port map(clk=>clk,reset=>reset,tick=>tick_out_t, ng=>ng_generated);
	to_sseg: entity work.ng_to_sseg
		port map( in0=>in0,in1=>in1,in2=>in2,in3=>in3, ng=>ng_generated, cod=>cod);
	an <= "1110" when ng_generated = "00" else
			"1101" when ng_generated = "01" else
			"1011" when ng_generated = "10" else
			"0111";


end Behavioral;
