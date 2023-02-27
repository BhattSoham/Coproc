----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2023 08:02:34 PM
-- Design Name: 
-- Module Name: Top_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_TB is
--  Port ( );
end Top_TB;

architecture Behavioral of Top_TB is
component Top is
 Port (
  cont: out std_logic_vector(31 downto 0);
  rs1 : in std_logic_vector(4 downto 0);
  addr : in std_logic_vector(11 downto 0);
  write_en: in std_logic;
  clock: in std_logic;
  x_in: out STD_LOGIC_VECTOR(31 downto 0);
  y_in : out STD_LOGIC_VECTOR(31 downto 0);
    h : out STD_LOGIC_VECTOR(31 downto 0);
  p_in : out STD_LOGIC_VECTOR(31 downto 0);
  p1_in : out STD_LOGIC_VECTOR(31 downto 0);
  c_in : out STD_LOGIC_VECTOR(31 downto 0)
 
 );
end component;

signal cont:  std_logic_vector(31 downto 0);
signal  addr :  std_logic_vector(11 downto 0);
signal  write_en:  std_logic;
signal  clock:  std_logic;
signal  x_in:  STD_LOGIC_VECTOR(31 downto 0);
signal  y_in :  STD_LOGIC_VECTOR(31 downto 0);
signal    h :  STD_LOGIC_VECTOR(31 downto 0);
signal  p_in :  STD_LOGIC_VECTOR(31 downto 0);
signal  p1_in :  STD_LOGIC_VECTOR(31 downto 0);
signal  c_in :  STD_LOGIC_VECTOR(31 downto 0);
signal rs1 :  std_logic_vector(4 downto 0);

begin

uut: Top port map (
cont => cont,
rs1 => rs1,
addr => addr,
write_en => write_en,
clock => clock,
x_in => x_in,
y_in => y_in,
h => h,
p_in => p_in,
p1_in => p1_in,
c_in => c_in

);

proc: process 
begin

write_en <= '1';
clock <= '1';
rs1 <= "00001";
 wait for 100 ns;

write_en <= '1';
clock <= '1';
rs1 <= "00010";
 wait for 100 ns;

write_en <= '1';
clock <= '1';
rs1 <= "00011";
 wait for 100 ns;

write_en <= '1';
clock <= '1';
rs1 <= "00100";
 wait for 100 ns;

write_en <= '1';
clock <= '1';
rs1 <= "00101";
 wait for 100 ns;

write_en <= '1';
clock <= '1';
rs1 <= "00110";
 wait for 100 ns;

wait;

end process;



end Behavioral;
