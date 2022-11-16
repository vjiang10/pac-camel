open OUnit2
open Game
open Movable
open Camel
open Human
open Gui
open Item
open Pacmap
open State
open Bogue
open Main
open Tsdl
open Utils
open Random
open Sdl
module W = Widget
module L = Layout
module T = Trigger

let canvas = W.sdl_area ~w:800 ~h:800 ()
let sdl_area = W.get_sdl_area canvas

(*create a new map to run tests on*)
let map_1 = gen_map 5 sdl_area

(*test edge case where 0 is passed in (lowest value it can be)*)
let map_2 = gen_map 0 sdl_area

(*Create a camel to test the camel functions*)
let camel_1 = Camel.("assets/images/camel-cartoon.png" |> init map_1)

(*check that src is actually the same one*)

let camel_tests =
  [
    ( "Testing that the camel has the same source as creation" >:: fun _ ->
      assert_equal "assets/images/camel-cartoon.png" (Camel.src camel_1) );
    ( " Testing that the camel has a size of (19,19) when initially created so \
       that it is ensured that the camel stays on the map \n\
      \    at any given point at time"
    >:: fun _ -> assert_equal (19, 19) (Camel.size camel_1) );
    ( "Testing that the camel has a speed of 19 intially to make sure that there \n\
      \    isn't an underlying bug with any future powerups of the camel's \
       speed changing "
    >:: fun _ -> assert_equal 19 (Camel.speed camel_1) );
  ]

let gui_tests = []
let human_tests = []
let item_tests = []
let pacmap_tests = []
let state_tests = []
let tests = []
let suite = "test suite for Pac Caml" >::: List.flatten [ camel_tests ]
let _ = run_test_tt_main suite
