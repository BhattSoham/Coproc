----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2023 02:21:28 PM
-- Design Name: 
-- Module Name: Mem_TB - Behavioral
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

entity Mem_TB is
--  Port ( );
end Mem_TB;

architecture Behavioral of Mem_TB is
COMPONENT Mem is
Port (
           cont: in std_logic_vector(31 downto 0);
           addr : in std_logic_vector(11 downto 0);
           x_in: out STD_LOGIC_VECTOR(31 downto 0);
           y_in : out STD_LOGIC_VECTOR(31 downto 0);
           h : out STD_LOGIC_VECTOR(31 downto 0);
           p_in : out STD_LOGIC_VECTOR(31 downto 0);
           p1_in : out STD_LOGIC_VECTOR(31 downto 0);
           c_in : out STD_LOGIC_VECTOR(31 downto 0);
           write_en: in std_logic;
           clock: in std_logic;
           flush : in std_logic;
           x_out: in STD_LOGIC_VECTOR(31 downto 0);
           y_out : in STD_LOGIC_VECTOR(31 downto 0);
           --cma_in: in STD_LOGIC_VECTOR(11 downto 0);
         cma_out: out STD_LOGIC_VECTOR(11 downto 0);
         init: in std_logic );
end COMPONENT;

signal     cont:  std_logic_vector(31 downto 0);
signal            addr :  std_logic_vector(11 downto 0);
signal            x_in:  STD_LOGIC_VECTOR(31 downto 0) ;
signal            y_in :  STD_LOGIC_VECTOR(31 downto 0); 
signal            h :  STD_LOGIC_VECTOR(31 downto 0);
signal            p_in :  STD_LOGIC_VECTOR(31 downto 0);
signal            p1_in :  STD_LOGIC_VECTOR(31 downto 0);
signal            c_in :  STD_LOGIC_VECTOR(31 downto 0);
signal            write_en:  std_logic;
signal            clock:  std_logic := '1';
signal            flush :  std_logic;
signal            init: std_logic; 
signal            x_out:  STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal            y_out :  STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
--signal            cma_in :  std_logic_vector(11 downto 0);
signal            cma_out :  std_logic_vector(11 downto 0);
constant clock_period : time := 100 ns;

begin

uut: Mem port map (
cont => cont,
addr => addr,
x_in => x_in,
y_in => y_in,
h => h,
c_in => c_in,
p_in => p_in,
p1_in => p1_in,
write_en => write_en,
clock => clock,
flush => flush,
x_out => x_out,
y_out => y_out,
--cma_in => cma_in,
cma_out => cma_out,
init => init
);

mem_clock: process
begin
clock <= '0';
wait for clock_period/2;
  clock <= '1';
  wait for clock_period/2;
   end process;


proc: process
begin


--flush <= '0';
--write_en <= '1';

--cont <= x"40000000";
--addr <= "000000000000";
--wait for clock_period;

--cont <= x"3F800000";
--addr <= "000000000100";
--wait for clock_period;

--cont <= x"3DCCCCCD";
--addr <= "000000001000";
--wait for clock_period;

--cont <=  x"3D4CCCCD";
--addr <= "000000001100";
--wait for clock_period;

--cont <= x"40000000";
--addr <= "000000010000";
--wait for clock_period;

--cont <= x"3C887A8D";
--addr <= "000000010100";

--wait for clock_period;

--flush <= '1';
--write_en <= '0';
--wait for clock_period;

flush <= '0'; ----My part
write_en <= '1';
x_out <= x"ABCDEF12";
addr <= "000000000000" ;
wait for clock_period;
--flush <= '0';
--write_en <= '1';
y_out <= x"123ABCDE";
addr <= "000000000100";
wait for clock_period;


write_en <= '1';
x_out <= x"DEFABC12" ;
addr <= "000000000000" ;
--addr <= "000000000000";
wait for clock_period;


--flush <= '0';
--write_en <= '1';
y_out <= x"456DEFAB";
addr <= "000000000100" ;
--addr <= "000000000100";
wait for clock_period;



write_en <= '1';
x_out <= x"EFABCD12";
addr <= "000000000000" ;
--addr <= "000000000000";
wait for clock_period;


--flush <= '0';
--write_en <= '1';
y_out <= x"789EFABC";
addr <= "000000000100" ;
--addr <= "000000000100";
wait for clock_period;


















--wait for clock_period;
--init <= '1';
 --cma_in <= "000000011000";
  ---wait for clock_period;

--init <= '0';
--  wait for clock_period;
--flush <= '1';
--write_en <= '0';
--wait for clock_period;

wait;
end process;
end Behavioral;
