# 1 "lib/token.mll"
 
type token =
  | Null
  | True
  | False
  | String of string
  | Int of int
  | Float of float
  | Left_bracket
  | Right_bracket
  | Left_brace
  | Right_brace
  | Comma
  | Colon
  | Eof

exception SyntaxError of string

# 21 "lib/token.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base =
   "\000\000\243\255\244\255\245\255\246\255\247\255\248\255\249\255\
    \250\255\251\255\013\000\254\255\003\000\023\000\033\000\003\000\
    \253\255\254\255\255\255";
  Lexing.lex_backtrk =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\002\000\255\255\000\000\255\255\003\000\255\255\
    \255\255\255\255\255\255";
  Lexing.lex_default =
   "\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\255\255\000\000\255\255\255\255\255\255\018\000\
    \000\000\000\000\000\000";
  Lexing.lex_trans =
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\012\000\011\000\000\000\012\000\017\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \012\000\000\000\009\000\012\000\000\000\016\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
    \010\000\010\000\003\000\013\000\000\000\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\014\000\
    \014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
    \014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
    \014\000\014\000\014\000\008\000\000\000\007\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\006\000\000\000\005\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \002\000\000\000\000\000\255\255\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000";
  Lexing.lex_check =
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\000\000\000\000\255\255\012\000\015\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\000\000\012\000\255\255\015\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\000\000\255\255\255\255\255\255\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\010\000\255\255\010\000\010\000\010\000\
    \010\000\010\000\010\000\010\000\010\000\010\000\010\000\013\000\
    \013\000\013\000\013\000\013\000\013\000\013\000\013\000\013\000\
    \013\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\
    \014\000\014\000\014\000\000\000\255\255\000\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\000\000\255\255\000\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\255\255\255\255\015\000\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255";
  Lexing.lex_base_code =
   "";
  Lexing.lex_backtrk_code =
   "";
  Lexing.lex_default_code =
   "";
  Lexing.lex_trans_code =
   "";
  Lexing.lex_check_code =
   "";
  Lexing.lex_code =
   "";
}

let rec token lexbuf =
   __ocaml_lex_token_rec lexbuf 0
and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 26 "lib/token.mll"
                 ( token lexbuf )
# 132 "lib/token.ml"

  | 1 ->
# 27 "lib/token.mll"
             ( Lexing.new_line lexbuf ; token lexbuf )
# 137 "lib/token.ml"

  | 2 ->
# 28 "lib/token.mll"
            ( Int(int_of_string @@ Lexing.lexeme lexbuf) )
# 142 "lib/token.ml"

  | 3 ->
# 29 "lib/token.mll"
                     ( Float(float_of_string @@ Lexing.lexeme lexbuf) )
# 147 "lib/token.ml"

  | 4 ->
# 30 "lib/token.mll"
        ( String (string (Buffer.create 17) lexbuf) )
# 152 "lib/token.ml"

  | 5 ->
# 31 "lib/token.mll"
        ( Left_bracket )
# 157 "lib/token.ml"

  | 6 ->
# 32 "lib/token.mll"
        ( Right_bracket )
# 162 "lib/token.ml"

  | 7 ->
# 33 "lib/token.mll"
        ( Left_brace )
# 167 "lib/token.ml"

  | 8 ->
# 34 "lib/token.mll"
        ( Right_brace )
# 172 "lib/token.ml"

  | 9 ->
# 35 "lib/token.mll"
        ( Comma )
# 177 "lib/token.ml"

  | 10 ->
# 36 "lib/token.mll"
        ( Colon )
# 182 "lib/token.ml"

  | 11 ->
# 37 "lib/token.mll"
        ( Eof )
# 187 "lib/token.ml"

  | 12 ->
# 38 "lib/token.mll"
      ( raise @@ SyntaxError ("unknown input: " ^ Lexing.lexeme lexbuf) )
# 192 "lib/token.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

and string buf lexbuf =
   __ocaml_lex_string_rec buf lexbuf 15
and __ocaml_lex_string_rec buf lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 41 "lib/token.mll"
                ( Buffer.add_string buf @@ Lexing.lexeme lexbuf
                ; string buf lexbuf
                )
# 206 "lib/token.ml"

  | 1 ->
# 44 "lib/token.mll"
         ( Buffer.add_string buf @@ Lexing.lexeme lexbuf
         ; Lexing.new_line lexbuf
         ; string buf lexbuf
         )
# 214 "lib/token.ml"

  | 2 ->
# 48 "lib/token.mll"
        ( Buffer.contents buf )
# 219 "lib/token.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf;
      __ocaml_lex_string_rec buf lexbuf __ocaml_lex_state

;;

# 50 "lib/token.mll"
 
let to_string = function
  | Null ->
      "Null"
  | True ->
      "True"
  | False ->
      "False"
  | String str ->
      "String(" ^ str ^ ")"
  | Int i ->
      "Int(" ^ string_of_int i ^ ")"
  | Float f ->
      "Float(" ^ string_of_float f ^ ")"
  | Left_bracket ->
      "Left_bracket([)"
  | Right_bracket ->
      "Right_bracket(])"
  | Left_brace ->
      "Left_brace({)"
  | Right_brace ->
      "Right_bracket(})"
  | Comma ->
      "Comma"
  | Colon ->
      "Colon"
  | Eof ->
      "Eof"

let lexing_stdin () =
  let lexbuf = Lexing.from_channel stdin in
  let rec loop accu = function
    | Eof ->
        to_string Eof :: accu |> List.rev
    | x ->
        loop (to_string x :: accu) (token lexbuf)
  in
  loop [] (token lexbuf) |> String.concat " " |> print_endline

let () = lexing_stdin ()

# 268 "lib/token.ml"
