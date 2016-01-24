module T  = Test13_pb

let decode_ref_data () = T.({
  p2 = {
    empty = ();
    sub = Sub_empty;
  };
  p1 = {
    l  = [Empty; Int 1; Empty; Int 2];
  }; 
}) 
  
let mode   = Test_util.parse_args ()

let () = 

  match mode with 
  | Test_util.Decode -> 
    Test_util.decode "test13.c2ml.data" T.decode_t T.pp_t (decode_ref_data  ()) 
  | Test_util.Encode -> 
    Test_util.encode "test13.ml2c.data" T.encode_t (decode_ref_data ())
