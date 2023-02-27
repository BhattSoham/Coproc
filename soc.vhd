----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2023 12:16:05 PM
-- Design Name: 
-- Module Name: soc - Behavioral
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

entity soc is
 Port (
  clk: in std_logic;
       rs1 : in std_logic_vector(4 downto 0);
        regwr : in std_logic;
        wrdata: out std_logic_vector(31 downto 0)
 
  );
end soc;

architecture Behavioral of soc is

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

COMPONENT AXI_COMB
  PORT (
    aclk : IN STD_LOGIC;
    aresetn : IN STD_LOGIC;
    s_axis_tvalid : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axis_tready : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axis_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_tvalid : OUT STD_LOGIC;
    m_axis_tready : IN STD_LOGIC;
    m_axis_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) 
  );
END COMPONENT;


 signal aclk : STD_LOGIC := '1';
 signal   aresetn : STD_LOGIC := '1';
 signal   s_axis_tvalid :  STD_LOGIC_VECTOR(1 DOWNTO 0) := (others => '1');
 signal   s_axis_tready :  STD_LOGIC_VECTOR(1 DOWNTO 0);
 signal   s_axis_tdata :  STD_LOGIC_VECTOR(31 DOWNTO 0);
 signal   m_axis_tvalid :  STD_LOGIC;
 signal   m_axis_tready :  STD_LOGIC := '1';
 signal   m_axis_tdata :  STD_LOGIC_VECTOR(31 DOWNTO 0); 




--signal rs1 :  std_logic_vector(4 downto 0);

signal rdata: std_logic_Vector(31 downto 0);
signal wdata: std_logic_Vector(31 downto 0);
signal addr: std_logic_vector(4 downto 0);

begin

uut: reg port map (
clk => clk,
rs1 => rs1,
regwr => regwr,
wrdata => rdata
);

uut2 : AXI_COMB  PORT MAP (
    aclk => aclk,
    aresetn => aresetn,
    s_axis_tvalid => s_axis_tvalid,
    s_axis_tready => s_axis_tready,
    s_axis_tdata => rdata,
    m_axis_tvalid => m_axis_tvalid,
    m_axis_tready => m_axis_tready,
    m_axis_tdata => wdata
  );



wrdata <= wdata;

--wrdata <=  M00_AXIS_TDATA;


end Behavioral;
