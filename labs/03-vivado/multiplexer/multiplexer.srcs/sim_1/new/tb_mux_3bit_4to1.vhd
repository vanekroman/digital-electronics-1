------------------------------------------------------------
--
-- Testbench for 2-bit binary comparator.
-- EDA Playground
--
-- Copyright (c) 2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_mux_3bit_4to1 is
    -- Entity of testbench is always empty
end entity tb_mux_3bit_4to1;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_mux_3bit_4to1 is

    -- Local signals
    signal s_sel_i           : std_logic_vector(1 downto 0);
    signal s_a_i             : std_logic_vector(2 downto 0);
	signal s_b_i             : std_logic_vector(2 downto 0);
	signal s_c_i             : std_logic_vector(2 downto 0);
    signal s_d_i             : std_logic_vector(2 downto 0);
    signal s_f_o             : std_logic_vector(2 downto 0);

begin
    -- Connecting testbench signals with comparator_4bit
    -- entity (Unit Under Test)
    uut_mux_3bit_4to1 : entity work.mux_3bit_4to1
        port map(
                    sel_i => s_sel_i,
                    a_i => s_a_i,
                    b_i => s_b_i,
                    c_i => s_c_i,
                    d_i => s_d_i,
                    f_o => s_f_o
        );

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started";
		
		s_a_i <= "001";
		s_b_i <= "010";
		s_c_i <= "011";
		s_d_i <= "100";
		
        -- First test case
        s_sel_i <= "00";
        wait for 100 ns;

        s_sel_i <= "01";
        wait for 100 ns;
        
        s_sel_i <= "10";
        wait for 100 ns;
        
        s_sel_i <= "11";
        wait for 100 ns;

        -- Report a note at the end of stimulus process
        report "Stimulus process finished";
        wait; -- Data generation process is suspended forever
    end process p_stimulus;

end architecture testbench;
