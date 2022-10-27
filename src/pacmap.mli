(** Representation of static map data.

    This module represents the data stored in a map, including wall positions
    and spaces *)

(** The abstract type of values representing pacmap *)
type t

(** [find_move t p1 p2] is the updated point of attempting to move to point [p2]
    from point [p1] in pacmap [t]. Updates game state. *)
val find_move : t -> int * int -> int * int -> int * int

(** [camel_ctx t] is the starting point and size of the camel in pacmap [t] *)
val camel_ctx : t -> (int * int) * (int * int)

(** [gen_map s a] is a generated seeded random pacmap dependent on seed [s] and
    sdl_area [a]*)
val gen_map : int -> Bogue.Sdl_area.t -> t

(** [add_item t] adds a random item to map t *)
val add_item : t -> unit

(** [draw_map s t] draws [t] to sdl_area [s] *)
val draw_map : Bogue.Sdl_area.t -> t -> unit