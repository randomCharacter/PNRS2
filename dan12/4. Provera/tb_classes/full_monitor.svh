/*
   Copyright 2013 Ray Salemi

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/
class full_monitor extends uvm_component;
   `uvm_component_utils(full_monitor);

  uvm_analysis_port #(command_s) ap1;
  uvm_analysis_port #(shortint) ap2;
    
  function void build_phase(uvm_phase phase);
    virtual tinyalu_bfm bfm;
    
    if(!uvm_config_db #(virtual tinyalu_bfm)::get(null, "*","bfm", bfm))
       $fatal("Failed to get BFM");

    bfm.full_monitor_h = this;
	
	bfm.full_monitor_h = this;

    ap1  = new("ap1",this);
    ap2  = new("ap2",this);

  endfunction : build_phase

  function void write_to_command_monitor(byte A, byte B, bit[2:0] op);
    command_s cmd;
    cmd.A = A;
    cmd.B = B;
    cmd.op = op2enum(op);
    $display("COMMAND MONITOR: A:0x%2h B:0x%2h op: %s", A, B, cmd.op.name());
    ap1.write(cmd);
  endfunction : write_to_command_monitor
  
  function void write_to_result_monitor(shortint r);
      $display ("RESULT MONITOR: resultA: 0x%0h",r);
      ap2.write(r);
   endfunction : write_to_result_monitor

   function operation_t op2enum(bit[2:0] op);
      case(op)
        3'b000 : return no_op;
        3'b001 : return add_op;
        3'b010 : return and_op;
        3'b011 : return xor_op;
        3'b100 : return mul_op;
        3'b111 : return rst_op;
        default : $fatal($sformatf("Illegal operation on op bus: %3b",op));
      endcase // case (op)
   endfunction : op2enum

   function new (string name, uvm_component parent);
      super.new(name,parent);
   endfunction
      

endclass : full_monitor

  