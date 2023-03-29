----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2023 11:52:33 AM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( CLK100MHZ : in STD_LOGIC;
           LED16_R : out STD_LOGIC;
           LED16_G : out STD_LOGIC;
           LED16_B : out STD_LOGIC;
           LED17_R : out STD_LOGIC;
           LED17_G : out STD_LOGIC;
           LED17_B : out STD_LOGIC;
           -- 7 segments
           --CA : out STD_LOGIC;
           --CB : out STD_LOGIC;
           --CC : out STD_LOGIC;
           --CD : out STD_LOGIC;
           --CE : out STD_LOGIC;
           --CF : out STD_LOGIC;
           --CG : out STD_LOGIC;
           --AN : out STD_LOGIC_VECTOR (7 downto 0);
           -- LED counter
           LED  : out std_logic_vector(4 downto 0);
           BTNR : in STD_LOGIC;  -- west speed button
           BTNC : in STD_LOGIC); -- reset button
end top;

----------------------------------------------------------
-- Architecture body for top level
----------------------------------------------------------
architecture behavioral of top is
    
begin
    ------------------------------------------------------
    -- Instance (copy) of tlc entity
    tlc : entity work.tlc
        port map(
            clk => CLK100MHZ,
            rst => BTNC,
            south(2) => LED16_R,
            -- MAP OTHER RGB LEDS (SOUTH and WEST) HERE
            south(1) => LED16_G,
            south(0) => LED16_B,
            west(2) => LED17_R,
            west(1) => LED17_G,
            west(0) => LED17_B,
            cnt => LED
        );

end architecture behavioral;
