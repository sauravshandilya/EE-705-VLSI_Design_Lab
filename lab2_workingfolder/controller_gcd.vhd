-------------------------
-- Author: Saurav Shandilya 
-- Roll No: 153076004, Electronics System, EE, IIT Bombay
-- EE-705 VLSI Design Lab (Course Instructor: Prof. Virendra Singh)
-- Description: GCD Controller Implementation
--              Controller consist of states which is used to generate necessary control signal which are sent to datapath.
--              Total states (09): Idle, Start, Initialize, Input, Comparision-1, Comparision-2, Update-1,Update-2, done         
-------------------------

-- library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Entity - gcd controller
entity gcd_controller is
port 
( 
	  sysclk: In bit;		  -- clock input
    reset: In bit;   -- reset all register when 0 
    start: In bit;   -- Start every computation when start = 1 
    done: out bit;
    
	---- Signal from datapath to controller	
	eql : in bit;   -- comparator equal output
	lss : in bit;   -- comparator less then output 
			
	---- Signal going from controller into datapath
  enable_data1_reg: out bit;    -- enable data-1 register
	reset_data1_reg: out bit;    -- reset data-1 register

	enable_data2_reg: out bit;
	reset_data2_reg: out bit;

	enable_out_reg: out bit;
	reset_out_reg: out bit;
	
	enable_topositive: out bit;    -- enable register used in converting -ve number to positive.
	reset_topositive: out bit;
	
	data1muxsel: out bit;        -- Mux to select between input data-1 or its updated input
	data2muxsel: out bit	        -- Mux to select between input data-2 or its updated input
);
end gcd_controller;

---- architecture starts FSM Implementation

architecture behav of gcd_controller is
  
--state description
type mystate is (s_idle,s_start, s_initialize,s_input,s_compare1,s_compare2,s_update1,s_update2,s_done);

signal state_signal : mystate;

-- begin process-1 - Jump between states
begin
next_state:    
    process (sysclk,reset) 
        variable next_state_var : myState;
        begin
            next_state_var := state_signal;
            
            
            if reset = '1' then                       -- if reset =1 remain in idle state
                next_state_var := s_idle;
            else
                case state_signal is
                
                when s_idle => 
                    if(reset = '0') then              -- reset = 0, goto start state
                        next_state_var := s_start;
                    end if;  

  	             when s_start => 
                    if(start = '1') then              -- wait in start state till start = 1 not received
                        next_state_var := s_initialize;   -- if start = 1 goto initialize 
                    end if;  

                when s_initialize =>                  -- when in initialize goto input
                    next_state_var := s_input;
                    
                when s_input =>                       -- when in input goto compare1
                    next_state_var := s_compare1;
                    
                when s_compare1 =>                    -- compare1 checks if input-1 = input-2, 
                    if eql = '1' then
                        next_state_var := s_done;     -- ifequal, goto done state
                    else        
                        next_state_var := s_compare2; -- ifnoyequal, goto compare2 state
                    end if;
                    
                when s_compare2 =>                    -- compare2 checks if input-1 < input-2, 
                    if lss = '1' then
                        next_state_var := s_update1;    -- ifless , goto update1, input2 = input2 - input1
                    else        
                        next_state_var := s_update2;    -- ifgreater, goto update2 input1 = input1 - input2
                    end if;
                    
                when s_update1 =>                     -- After update, goto compare1 state
                    next_state_var := s_compare1;
                    
                when s_update2 =>                     -- After update, goto compare1 state
                    next_state_var := s_compare1;    
  
                when s_done =>                        -- After computation complete, goto Idle state and wait for start signal 
                    next_state_var := s_idle;
                    
                when others => NULL;
              end case;     
            end if;    
            
            if(sysclk'event and sysclk = '1') then    -- change state on positive clock edge
                state_signal <= next_state_var;
            end if;
    end process;            

-- begin process-2 - Enable register and set value to required signals in various states                            
output_process: 
  process(state_signal,reset,eql,lss)
begin
  
  enable_data1_reg <= '0';
	reset_data1_reg <= '0';

	enable_data2_reg <= '0';
	reset_data2_reg <= '0';

	enable_out_reg <= '0';
	reset_out_reg <= '0';
	
	enable_topositive <= '0';
	reset_topositive <= '0';
	
	data1muxsel <= '0';
	data2muxsel <= '0';
	
	done <= '0';
	
	case state_signal is
	  
	  when s_idle =>               --- reset all registers to zero in idle state
	  	reset_data1_reg <= '1';
    	reset_data2_reg <= '1';
    --	reset_out_reg <= '1';
    	reset_topositive <= '1';
    	
    	done <= '0';               -- disable done flag
    
    when s_initialize =>        -- check if input is negative - covert it to positive
     enable_topositive <= '1';
    
	  when s_input =>             -- enable 2 input registers for input data
	   enable_data1_reg <= '1';
	   enable_data2_reg<= '1';

      
	  when s_update1 =>          -- update input register 2. When input2 > input1, input2 = input2 - input1 
 	   enable_data2_reg <= '1';
     data2muxsel <= '1';
	  
	  when s_update2 =>          -- update input register 1. When input2 < input1, input1 = input1 - input2
	   enable_data1_reg <= '1';
     data1muxsel <= '1';
	    
	  when s_done =>             -- out result when input1 = input2 and set done = 1 to indicate computation is complete
	    enable_out_reg <= '1';   
      done <= '1';
    
    when others =>null;
      
  end case;
end process output_process;
            

end behav;