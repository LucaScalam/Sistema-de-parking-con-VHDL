library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity ssegMultiple2 is
	generic(N: integer := 19);
	port(
		sw: in std_logic_vector(15 downto 0);
		btn: in std_logic_vector(3 downto 0);
		codif: out std_logic_vector(7 downto 0);
		an : out std_logic_vector(3 downto 0);
		clk, reset: in std_logic
	);
end ssegMultiple2;

architecture Behavioral of ssegMultiple2 is
	signal q1 : std_logic_vector(3 downto 0);
	signal q2 : std_logic_vector(3 downto 0);
	signal q3 : std_logic_vector(3 downto 0);
	signal q4 : std_logic_vector(3 downto 0);
	signal M : unsigned(N-1 downto 0);
begin
	M <= ("1000000000000000000");
	 ff1: entity work.FLIPFLOP1
		port map( clk=>clk, reset=>reset, en=>btn(0), d=>sw(15 downto 12), q=>q1);
	 ff2: entity work.FLIPFLOP1
	 	port map( clk=>clk, reset=>reset, en=>btn(1), d=>sw(11 downto 8), q=>q2);
	 ff3: entity work.FLIPFLOP1
	 	port map( clk=>clk, reset=>reset, en=>btn(2), d=>sw(7 downto 4), q=>q3);
	 ff4: entity work.FLIPFLOP1
	 	port map( clk=>clk, reset=>reset, en=>btn(3), d=>sw(3 downto 0), q=>q4);
	disp_multiplexor: entity work.disp_mux
		port map( clk=>clk, reset=>reset, M=>M, in0=>q1, in1=>q2, in2=>q3 ,in3=>q4,cod=>codif, an=>an);


end Behavioral;