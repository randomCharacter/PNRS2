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
class fun_tester extends random_tester;
   `uvm_component_utils(fun_tester)

   function operation_t get_op();
      bit [2:0] op_choice;
      return fun_op;
   endfunction : get_op

    task run_phase(uvm_phase phase);
      byte         unsigned        iA;
      byte         unsigned        iB;
      operation_t                  op_set;
      shortint     result;
      
      phase.raise_objection(this);
      bfm.reset_alu();

    op_set = and_op;
    iA = get_data();
    iB = get_data();
    bfm.send_op(iA, iB, op_set, result);


    repeat (1000) begin : fun_loop
        op_set = fun_op;
        iA = get_data();
        iB = get_data();
        bfm.send_op(iA, iB, op_set, result);
    end : fun_loop

      repeat (1000) begin : random_loop
         op_set = get_op();
         iA = get_data();
         iB = get_data();
         bfm.send_op(iA, iB, op_set, result);
      end : random_loop
      #500;
      phase.drop_objection(this);
   endtask : run_phase

   function new (string name, uvm_component parent);
      super.new(name, parent);
   endfunction : new

endclass : fun_tester
