LIBRARY ieee;
USE ieee.std_logic_1164.all;
entity Mux2_1 is
port
(
A: in std_logic_vector(3 downto 0);
B: in std_logic_vector(3 downto 0);
PL:in std_logic;
D: out std_logic_vector(3 downto 0)
);
end Mux2_1;
architecture structural of Mux2_1 is
begin
D(0)<= (A(0) and not PL) or (B(0) and PL);
D(1)<= (A(1) and not PL) or (B(1) and PL);
D(2)<= (A(2) and not PL) or (B(2) and PL);
D(3)<= (A(3) and not PL) or (B(3) and PL);
end structural;