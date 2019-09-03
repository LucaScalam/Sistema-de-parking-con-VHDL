
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testing_adaptador IS
END testing_adaptador;
 
ARCHITECTURE behavior OF testing_adaptador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adaptation
    PORT(

         inc : IN  std_logic;
         dec : IN  std_logic;
         en : OUT  std_logic;
         up : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal inc : std_logic := '0';
   signal dec : std_logic := '0';

 	--Outputs
   signal en : std_logic;
   signal up : std_logic;

  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adaptation PORT MAP (

          inc => inc,
          dec => dec,
          en => en,
          up => up
        );



   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;	
		inc <= '1';
		dec <= '0';
		wait for 5 ns;
		assert en='1' and up='1' report "Falla incrementando" severity failure;
		wait for 10 ns;
		
		
		inc <= '0';
		dec <= '0';
		wait for 10 ns;
		
		inc <= '0';
		dec <= '1';
		wait for 5 ns;
		assert en='1' and up='0' report "Falla decrementando" severity failure;
		wait for 10 ns;
		
				
		inc <= '0';
		dec <= '0';
		wait for 10 ns;
	
	
		wait for 100 ns;
		assert false report "todo Ok" severity failure;
      wait;
   end process;

END;
