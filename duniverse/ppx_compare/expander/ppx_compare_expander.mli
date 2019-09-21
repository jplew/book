open Ppxlib

module type S = Ppx_compare_expander_intf.S

module Compare : sig
  include S

  (** [equal_core_type ty] is an expression of type [ty -> ty -> bool], using the
      comparison function generated by [core_type] *)
  val equal_core_type : core_type -> expression
end

module Equal : S