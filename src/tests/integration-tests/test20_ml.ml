module T = Test20_types
module Pb = Test20_pb
module Pp = Test20_pp

let decode_ref_data () = { T.f1 = 1l; f2 = { T.sub_f1 = 2l }; f3 = T.Eone }
let () = Printf.printf "Show is working: %s\n" @@ T.show_m (decode_ref_data ())

let () =
  let mode = Test_util.parse_args () in

  match mode with
  | Test_util.Decode ->
    Test_util.decode "test20.c2ml.data" Pb.decode_m Pp.pp_m (decode_ref_data ())
  | Test_util.Encode ->
    Test_util.encode "test20.ml2c.data" Pb.encode_m (decode_ref_data ())
