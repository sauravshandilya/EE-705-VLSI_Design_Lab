---------------------------------------------------------
-- Name: Vishwanathan Iyer
-- Roll No: 143076004
-- Last updated: 18th January, 2014
-- Version: 1.5
---------------------------------------------------------
entity priority_encode is

port (x7,x6,x5,x4,x3,x2,x1,x0: in bit;
      s2,s1,s0,N	     : out bit);
end entity;

architecture priority_encode_bit of priority_encode is
 begin
  process(x7,x6,x5,x4,x3,x2,x1,x0)
    begin
	if (x0='1') then
	 s2<='0'; s1<='0';s0<='0';N<='0'; 
	elsif (x1='1') then
	 s2<='0'; s1<='0'; s0<='1';N<='0';
	elsif (x2='1') then
	 s2<='0'; s1<='1'; s0<='0';N<='0'; 
	elsif (x3='1') then
	 s2<='0'; s1<='1'; s0<='1';N<='0'; 
	elsif (x4='1') then
	 s2<='1'; s1<='0'; s0<='0';N<='0';
	elsif (x5='1') then
	 s2<='1'; s1<='0'; s0<='1';N<='0'; 
	elsif (x6='1') then
	 s2<='1'; s1<='1'; s0<='0';N<='0'; 
	elsif (x7='1') then
	 s2<='1'; s1<='1'; s0<='1';N<='0'; 
	else  
	 N<='1';s2<='0'; s1<='0';s0<='0'; -- s2, s1, s0 are assigned to zero for this case
	end if;
    end process;
end priority_encode_bit;
