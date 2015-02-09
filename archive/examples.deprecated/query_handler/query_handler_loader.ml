open Core.Std
open Async.Std
open Query_handler_core

let () =
  let loader = Loader.create [(module Unique); (module List_dir)] in
  let loader_instance =
    (module struct
       module Query_handler = Loader
       let this = loader
     end : Query_handler_instance)
  in
  Hashtbl.replace loader.Loader.active
    ~key:Loader.name ~data:loader_instance;
  cli loader.Loader.active
