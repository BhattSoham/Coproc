----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2023 07:30:53 PM
-- Design Name: 
-- Module Name: Top - Behavioral
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

entity Top is
 Port (
  inst: in std_logic_vector(31 downto 0);
  cont: out std_logic_vector(31 downto 0);
  addr : out std_logic_vector(11 downto 0);
  write_en: in std_logic;
  clock: in std_logic;
  x_in: out STD_LOGIC_VECTOR(31 downto 0);
  y_in : out STD_LOGIC_VECTOR(31 downto 0);
    h : out STD_LOGIC_VECTOR(31 downto 0);
  p_in : out STD_LOGIC_VECTOR(31 downto 0);
  p1_in : out STD_LOGIC_VECTOR(31 downto 0);
  c_in : out STD_LOGIC_VECTOR(31 downto 0)
 
 );
end Top;

architecture Behavioral of Top is

component Mem is
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
           flush : in std_logic );
end component;

component reg is
Port (
        clk: in std_logic;
        rs1 : in std_logic_vector(4 downto 0);
        regwr : in std_logic;
        wrdata: out std_logic_vector(31 downto 0)
--        x_out : out std_logic_vector(31 downto 0);
--        y_out: out std_logic_vector(31 downto 0)
        );
 end component;

component Control is
Port (
inst: in std_logic_vector(31 downto 0);
addr: out std_logic_vector(11 downto 0)

 );
end component;

 


signal wdata:  std_logic_vector(31 downto 0);
signal  clk:  std_logic := '1';
signal  rs :  std_logic_vector(4 downto 0);
signal  regwr :  std_logic := '1';
signal  flush :  std_logic;
--signal inst:  std_logic_vector(31 downto 0);

begin

uut1: Mem port map (

cont => wdata,
addr => inst(31 downto 20),
write_en => write_en,
clock => clock,
x_in => x_in,
y_in => y_in,
h => h,
p_in => p_in,
c_in => c_in,
p1_in => p1_in,
flush => flush

);

uut2: reg port map (
 clk => clock,
 rs1 => inst(19 downto 15), 
 regwr => regwr,
 wrdata => wdata
);

uut3: Control port map (
inst => inst,
addr => addr

);
addr <= inst(31 downto 20);
cont <= wdata;


end Behavioral;
