library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Sensors is
	port(
		clk,reset: std_logic;
		a,b: in std_logic;
		dec,inc: out std_logic
	);
end Sensors;

architecture moore of Sensors is
	type state_type is (start, in_1, in_2, in_3, in_4, out_1, out_2, out_3, out_4);
	signal state_next, state_reg: state_type;
begin


	-- Registro de estado
	process(clk, reset)
	begin
		if (reset = '1') then
			state_reg <= start;
		elsif (clk'event and clk = '1') then
			state_reg <= state_next;
		end if;
	end process;
	
	-- Logica del next_state
	process(state_reg,a,b)
	begin
		case state_reg is
			-- Estado start
			when start =>
				if (a='1' and b='0') then
					state_next <= in_1;
				elsif (a='0' and b='1') then
					state_next <= out_1;
				else 
					state_next <= start;
				end if;
				
			-- Estado in_1
			when in_1 =>
				if (a='1' and b='1') then
					state_next <= in_2;
				elsif (a='1' and b='0') then
					state_next <= in_1;
				elsif (a='0' and b='0') then
					state_next <= start;
				else
					state_next <= start;
				end if;
			
			-- Estado in_2
			when in_2 =>
				if (a='1' and b='1') then
					state_next <= in_2;
				elsif (a='0' and b='1') then
					state_next <= in_3;
				elsif (a='1' and b='0') then
					state_next <= in_1;
				else
					state_next <= start;
				end if;
		
			-- Estado in_3
			when in_3 =>
				if (a='1' and b='1') then
					state_next <= in_2;
				elsif (a='0' and b='1') then
					state_next <= in_3;
				elsif (a='0' and b='0') then
					state_next <= in_4;
				else
					state_next <= start;
				end if;
			-- Estado in_4
			
			when in_4 =>
				--inc <= '1';
				--dec <= '0';
				state_next <= start;
			
			-- Salidas
			
			-- Estado out_1
			when out_1 =>
				if (a='1' and b='1') then
					state_next <= out_2;
				elsif (a='0' and b='1') then
					state_next <= out_1;
				elsif (a='0' and b='0') then
					state_next <= start;
				else
					state_next <= start;
				end if;
			
			-- Estado out_2
			when out_2 =>
				if (a='1' and b='1') then
					state_next <= out_2;
				elsif (a='0' and b='1') then
					state_next <= out_1;
				elsif (a='1' and b='0') then
					state_next <= out_3;
				else
					state_next <= start;
				end if;
		
			-- Estado out_3
			when out_3 =>
				if (a='1' and b='1') then
					state_next <= out_2;
				elsif (a='1' and b='0') then
					state_next <= out_3;
				elsif (a='0' and b='0') then
					state_next <= out_4;
				else
					state_next <= start;
				end if;
				
			-- Estado out_4
			--when out_4 =>
			when others =>
--				dec <= '1';
--				inc <= '0';
				state_next <= start;
		end case; 
	end process;
		
	-- Logica de output
	process(state_reg)
	begin
		case state_reg is
			when out_4 =>
				dec <= '1';
				inc <= '0';
			when in_4 =>
				inc <= '1';
				dec <= '0';
			when others=>
				inc <= '0';
				dec <= '0';
		end case;
	end process;

end moore;

