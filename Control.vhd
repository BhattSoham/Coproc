----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2023 08:33:41 PM
-- Design Name: 
-- Module Name: Control - Behavioral
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
use IEEE.numeric_std.ALL;
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Control is
Port (
inst: in std_logic_vector(31 downto 0);
addr: out std_logic_vector(11 downto 0);
write_en: out std_logic;
flush: out std_logic
--rs: in std_logic_vector(4 downto 0)

 );
end Control;

architecture Behavioral of Control is

signal opcode: std_logic_Vector(6 downto 0);
signal rs1: std_logic_Vector(4 downto 0);
signal  rd: std_logic_Vector(4 downto 0);
signal func3: std_logic_Vector(2 downto 0);
signal imm: std_logic_Vector(11 downto 0);
signal addr1: std_logic_Vector(11 downto 0); 
signal mflush: std_logic;

begin

opcode <= inst(6 downto 0);
rd <= inst(11 downto 7);
func3 <= inst(14 downto 12);
rs1 <= inst(19 downto 15);
imm <= inst(31 downto 20);

process(func3, imm)
begin
 if (func3 = "000") then    ---    RKI
   write_en <= '1';
   flush <= '0';
    if (imm = "000000000000" ) then 
     addr1 <= imm;
    else
         addr1 <= std_logic_vector(unsigned(addr1) + 4);
   end if;
  
   
  elsif (func3 = "010") then ---   RKU (Flush Mode)
   write_en <= '0';
   flush <= '1';
   
 
 
 
 
 
 
 end if;
 end process;
   addr <= addr1;
 --flush <= mflush; 

end Behavioral;

--end process;
--if (func3(1) = '1') then
--    flush <=  '0';
--    else 
--    flush <= '1';
-- end if;  
   
--  case func3 is
  
--  when "010" => ---RKU(Flush mode)
   

--    if (imm = "000000000000" ) then 
--            addr1 <= imm;
--    else
--         addr1 <= std_logic_vector(unsigned(addr1) + 4);
--   end if;
  

 
-- when others =>
--   opcode <= "0000000";
--   rd <= "00000";
--   rs1 <= "00000";
--   imm <= "000000000000"; 
 
--end case;

 --addr1 <= inst(31 downto 20);






-- when "000" => ---RKI
     
   
  
  
   --init <= '1';
--    opcode <= inst(6 downto 0);
--   rd <= inst(11 downto 7);
--   imm <= inst(31 downto 20);
   
   
--   opcode <= "0001100";
--   rd <= "00000";
--   imm <= "000000000000";


---when "010" =>
--   opcode <= inst(6 downto 0);
--   rd <= inst(11 downto 7);
--    if (imm = "000000000000" ) then 
--           addr1 <= imm;
--           -- addr1 <= imm;
--    else
--         addr1 <= std_logic_vector(unsigned(addr1) + 4);
--   end if;
   
   
   
   
   
   
--   opcode <= "0001100";
--   rd <= "00000";
