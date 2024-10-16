----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:09:59 10/10/2024 
-- Design Name: 
-- Module Name:    SDRAMController - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY SDRAMController IS
	PORT (
		clk : IN STD_LOGIC;
		ADDR : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		WR_RD : IN STD_LOGIC;
		MEMSTRB : IN STD_LOGIC;
		DIN : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		DOUT : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
END SDRAMController;


ARCHITECTURE Behavioral OF SDRAMController IS
	TYPE ramemory IS ARRAY (7 DOWNTO 0, 31 DOWNTO 0) OF std_logic_vector(7 DOWNTO 0);
	SIGNAL RAM_SIG : ramemory;
	SIGNAL counter : INTEGER := 0;
BEGIN
	PROCESS (CLK)
	BEGIN
		IF CLK'EVENT AND CLK = '1' THEN
	
			IF counter = 0 THEN
				FOR I IN 0 TO 7 LOOP
					FOR J IN 0 TO 31 LOOP
						RAM_SIG(i, j) <= "11110000";
					END LOOP;
				END LOOP;
				counter <= 1;
			END IF;
		
		IF MEMSTRB = '1' THEN
			IF WR_RD = '1' THEN
				RAM_SIG(to_integer(unsigned(ADDR(7 DOWNTO 5))), to_integer(unsigned(ADDR(4 DOWNTO 0)))) <= DIN;
			ELSE
				DOUT <= RAM_SIG(to_integer(unsigned(ADDR(7 DOWNTO 5))), to_integer(unsigned(ADDR(4 DOWNTO 0))));
			END IF;
		END IF;
	END IF;
	
	END PROCESS;
END Behavioral;