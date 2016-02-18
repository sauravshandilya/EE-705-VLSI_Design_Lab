-------------------------
-- Author: Saurav Shandilya 
-- Roll No: 153076004, Electronics System, EE, IIT Bombay
-- EE-705 VLSI Design Lab (Course Instructor: Prof. Virendra Singh)
-- Description: Booth Multiplier COntroller implementation
-------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity gcd_controller is
port 
( 
	sysclk: In bit;		-- input to data block
    reset: In bit;
    start: In bit;
    done: out bit;
    
	---- Signal from datapath to controller	
	eql : in bit;   -- comparator equal output
	lss : in bit;   -- comparator less then output 
			
	---- Signal going from controller into datapath
    enable_data1_reg: out bit;
	reset_data1_reg: out bit;

	enable_data2_reg: out bit;
	reset_data2_reg: out bit;

	enable_out_reg: out bit;
	reset_out_reg: out bit;
	
	enable_topositive: out bit;
	reset_topositive: out bit;
	
	enable_sub1buffout_reg: out bit;
	reset_sub1buffout_reg: out bit;
	
	enable_sub2buffout_reg: out bit;
	reset_sub2buffout_reg: out bit;
	
	data1muxsel: out bit;
	data2muxsel: out bit	
);
end gcd_controller;

---- architecture starts 

architecture behav of gcd_controller is
--state description
type mystate is (s_idle,s_start, s_initialize,s_input,s_compare1,s_compare2,s_wait1,s_wait2,s_update1,s_update2,s_done);


signal state_signal : mystate;

-- begin
begin
next_state:    
    process (sysclk,reset) 
        variable next_state_var : myState;
        begin
            next_state_var := state_signal;
            
            
            if reset = '1' then           -- if reset =1 remain in idle state
                next_state_var := s_idle;
            else
                case state_signal is
                
                when s_idle => 
                    if(reset = '0') then      -- change state when reset goes low
                        next_state_var := s_start;
                    end if;  

  	             when s_start => 
                    if(start = '1') then      -- change state when reset goes low
                        next_state_var := s_initialize;
                    end if;  

                when s_initialize =>
                    next_state_var := s_input;
                    
                when s_input =>
                    next_state_var := s_compare1;
                    
                when s_compare1 =>
                    if eql = '1' then
                        next_state_var := s_done;
                    else        
                        next_state_var := s_compare2;
                    end if;
                    
                when s_compare2 =>
                    if lss = '1' then
                        next_state_var := s_update1;    -- update Y register
                    else        
                        next_state_var := s_update2;    -- update X
                    end if;
                    
                when s_update1 =>
                    next_state_var := s_wait1;
                    
                when s_update2 =>
                    next_state_var := s_wait2;    
                    
                when s_wait1 => 
                    next_state_var := s_compare1;
                
                when s_wait2 => 
                    next_state_var := s_compare1;

                when s_done =>
                    next_state_var := s_idle;
                    
                when others => NULL;
              end case;     
            end if;    
            
            if(sysclk'event and sysclk = '1') then
                state_signal <= next_state_var;
            end if;
    end process;            
                        
            
output_process: process(state_signal,reset,eql,lss)
begin
  
    enable_data1_reg <= '0';
	reset_data1_reg <= '0';

	enable_data2_reg <= '0';
	reset_data2_reg <= '0';

	enable_out_reg <= '0';
	reset_out_reg <= '0';
	
	enable_topositive <= '0';
	reset_topositive <= '0';
	
	enable_sub1buffout_reg <= '0';
	reset_sub1buffout_reg <= '0';
	
	enable_sub2buffout_reg <= '0';
	reset_sub2buffout_reg <= '0';
	
	data1muxsel <= '0';
	data2muxsel <= '0';
	
	done <= '0';
	
	case state_signal is
	  
	  when s_idle =>               --- reset all registers to zero
	  	reset_data1_reg <= '1';
    	reset_data2_reg <= '1';
    	reset_out_reg <= '1';
    	reset_topositive <= '1';
    	reset_sub1buffout_reg <= '1';
    	reset_sub2buffout_reg <= '1';
    	
    	done <= '0';     -- disable done flag
    
      when s_initialize =>
       enable_topositive <= '1';
    
	  when s_input =>
	   enable_data1_reg <= '1';
	   enable_data2_reg<= '1';
	   enable_sub1buffout_reg <= '1';	    
	   enable_sub2buffout_reg <= '1';
	   
	  when s_compare1 =>
	     enable_sub1buffout_reg <= '1';	    
	     enable_sub2buffout_reg <= '1';
	   
	   when s_compare2 =>
   	   enable_sub1buffout_reg <= '1';	    
	     enable_sub2buffout_reg <= '1';	   
      
	  when s_update1 =>          -- update data2_reg i.e Y
 	      enable_sub2buffout_reg <= '1';
 	      enable_data2_reg <= '1';
        --data2muxsel <= '1';
	  
	  when s_update2 =>          -- update data1_ reg i.e X
	       enable_sub1buffout_reg <= '1';
	       enable_data1_reg <= '1';
         --data1muxsel <= '1';

	  when s_wait1 => null;
	      enable_sub2buffout_reg <= '1';
 	      enable_data2_reg <= '1';
        data2muxsel <= '1';
	   
	  when s_wait2 => null;
	       enable_sub1buffout_reg <= '1';
	       enable_data1_reg <= '1';
         data1muxsel <= '1';
	    
	  when s_done => 
	    enable_out_reg <= '1';   
      done <= '1';
    
    when others =>null;
      
  end case;
end process output_process;
            

end behav;