(** Representation of items in game.

    This module represents the data stored items, including its x and y
    position, as well as logic and effects to be executed upon trigger (when
    user passes upon a cell with item) *)

(** [t] represents an item in a game *)
type t

(** [probability] will output the probability of [t] showing up in a game *)
val probability : t -> float

(**[period] will output the duration of how long [t] will last for *)
val period : t -> int

(** [src] provides the image link of [t] *)
val src : t -> string

(** [effect] corresponds to the effect of [t] *)
val effect : t -> unit

val animate : t -> unit
(* TODO (once main graphics loop is implemented): implement an animation
   function for all items *)

(** Item to double the amount of coins collected *)
val coinsItem : unit -> t

(** Item to double the speed of player in game *)
val speedItem : unit -> t

(** Item to show the trajectory of which way the humans will move *)
val trajectoryItem : unit -> t

(** Item to stun players temporarily *)
val sandItem : unit -> t

(** Item to allow player to phase through walls *)
val phaseItem : unit -> t

(** Item to make humans move away from player *)
val cactusItem : unit -> t

(** Item to teleport the camel to another teleport item *)
val teleportItem : unit -> t