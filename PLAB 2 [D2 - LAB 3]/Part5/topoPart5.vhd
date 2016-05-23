library ieee;
use ieee.std_logic_1164.all;

entity topoPart5 is
port(SW: in std_logic_vector(16 downto 0);
	  KEY: in std_logic_vector(1 downto 0);
	  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7: out std_logic_vector(6 downto 0));
end topoPart5;
	
architecture topo_estru of topoPart5 is
	signal saidaDMuxParaReg, saidaDMuxParaHex, saidaLetParaDecode: std_logic_vector (15 downto 0);
     
component decod7seg
	port(entrada: in std_logic_vector(3 downto 0);
        saida: out std_logic_vector(6 downto 0));
end component;

component dLatch3
	PORT (Clk, reset: in std_logic;
			D: in std_logic_vector (15 downto 0);
			q		: out std_logic_vector (15 downto 0));
END component;

component demux1_2
port (
      saidaParaLetixi, saidaHex : out std_logic_vector(15 downto 0);  
      botao : in std_logic;
      suit14 : in std_logic_vector (15 downto 0)
     );
end component;

begin
    L1: demux1_2 port map (saidaDMuxParaReg, saidaDMuxParaHex, SW(16), SW(15 downto 0));
    L2: dLatch3 port map (KEY(1), KEY(0), saidaDMuxParaReg, saidaLetParaDecode);
    L3: decod7seg port map (saidaLetParaDecode(15 downto 12), HEX7);
    L4: decod7seg port map (saidaLetParaDecode(11 downto 8), HEX6);
	 L5: decod7seg port map (saidaLetParaDecode(7  downto 4), HEX5);
	 L6: decod7seg port map (saidaLetParaDecode(3  downto 0), HEX4);
	 L7: decod7seg port map (saidaDMuxParaHex (15 downto 12), HEX3);
	 L8: decod7seg port map (saidaDMuxParaHex (11 downto 8), HEX2);
	 L9: decod7seg port map (saidaDMuxParaHex (7  downto 4), HEX1);
	 L10: decod7seg port map (saidaDMuxParaHex(3  downto 0), HEX0);

end topo_estru;