LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY testing_sensor IS
END testing_sensor;
 
ARCHITECTURE behavior OF testing_sensor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sensors
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         a : IN  std_logic;
         b : IN  std_logic;
         dec : OUT  std_logic;
         inc : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal a : std_logic := '0';
   signal b : std_logic := '0';

 	--Outputs
   signal dec : std_logic;
   signal inc : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
  
BEGIN
  
	-- Instantiate the Unit Under Test (UUT)
   uut: Sensors PORT MAP (
          clk => clk,
          reset => reset,
          a => a,
          b => b,
          dec => dec,
          inc => inc
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      reset <= '1';
		wait for 15 ns;	
		reset <= '0';
		
		wait until falling_edge(clk);
		-- Auto ingresa
		--wait for 10 ns;
		a <= '0';
		b <= '0';
		
		wait for clk_period;
		a <= '1';
		b <= '0';
		
		wait for clk_period;
		a <= '1';
		b <= '1';
		
		wait for clk_period;
		a <= '0';
		b <= '1';
		
		wait for clk_period;
		a <= '0';
		b <= '0';
		wait for clk_period;
		
		assert inc = '1' and dec = '0' report "Fallo en incremento" severity failure;
		
		
				
		
      wait for clk_period*10;
		
		-- Auto egresa
		wait for clk_period;
		a <= '0';
		b <= '0';
		
		wait for clk_period;
		a <= '0';
		b <= '1';
		 
		wait for clk_period;	
		a <= '1';
		b <= '1';
		
		wait for clk_period;
		a <= '1';
		b <= '0';
		
		wait for clk_period;
		a <= '0';
		b <= '0';
		
		wait for clk_period;
		
		assert inc = '0' and dec = '1' report "Fallo en decremento" severity failure;
		
				
		
      wait for clk_period*10;

		assert false report "todo Ok" severity failure;
      wait;
   end process;

END;
