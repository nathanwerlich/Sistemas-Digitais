library ieee;
use ieee.std_logic_1164.all;

entity topoPart1 is
port( SW: in std_logic_vector(2 downto 0);
		LEDR: out std_logic_vector(0 downto 0));
end topoPart1;
	
architecture topo_estru of topoPart1 is
	  
component RSLatch
	port (Clk, R, S : in std_logic;
		   Q :  out std_logic);
end component;

begin
	L1: RSLatch port map (SW(2), SW(1), SW(0), LEDR(0));

end topo_estru;