----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/09/2023 12:38:59 PM
-- Design Name: 
-- Module Name: reg_TB - Behavioral
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

entity reg_TB is
--  Port ( );
end reg_TB;

architecture Behavioral of reg_TB is
component reg is
Port (
        clk: in std_logic;
        rs1 : in std_logic_vector(4 downto 0);
        regwr : in std_logic;
        wrdata: out std_logic_vector(31 downto 0)
       
        );
 end component;

signal clk:  std_logic;
signal  rs1 :  std_logic_vector(4 downto 0);
signal  regwr :  std_logic;
signal  wrdata:  std_logic_vector(31 downto 0);


begin

uut: reg port map (
clk => clk,

rs1 => rs1,
regwr => regwr,
wrdata => wrdata

);

regi: process
begin
 clk <= '1';
 regwr <= '1';
 rs1 <= "00001";
  wait for 100 ns;
  
  clk <= '1';
 regwr <= '1';
 rs1 <= "00010";
  wait for 100 ns;
  
  clk <= '1';
 regwr <= '1';
 rs1 <= "00011";
  wait for 100 ns;
  
  clk <= '1';
 regwr <= '1';
 rs1 <= "00100";
  wait for 100 ns;
  
  
  clk <= '1';
 regwr <= '1';
 rs1 <= "00101";
  wait for 100 ns;
  
  
  clk <= '1';
 regwr <= '1';
 rs1 <= "00110";
  wait for 100 ns;
  
  
--  clk <= '1';
-- regwr <= '1';
-- rs1 <= "00111";
--  wait for 100 ns;
  
  
--  clk <= '1';
-- regwr <= '1';
-- rs1 <= "01000";
--  wait for 100 ns;
  
  
    
 
 wait ;
 end process;


end Behavioral;
