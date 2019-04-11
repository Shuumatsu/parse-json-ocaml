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

let __ocaml_lex_tables =
  { Lexing.lex_base=
      "\000\000\243\255\244\255\245\255\246\255\247\255\248\255\249\255\250\255\251\255\013\000\254\255\003\000\023\000\033\000\003\000\253\255\254\255\255\255"
  ; Lexing.lex_backtrk=
      "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\002\000\255\255\000\000\255\255\003\000\255\255\255\255\255\255\255\255"
  ; Lexing.lex_default=
      "\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\255\255\000\000\255\255\255\255\255\255\018\000\000\000\000\000\000\000"
  ; Lexing.lex_trans=
      "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\012\000\011\000\000\000\012\000\017\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\012\000\000\000\009\000\012\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\003\000\013\000\000\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\008\000\000\000\007\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\006\000\000\000\005\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
  ; Lexing.lex_check=
      "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\000\000\000\000\255\255\012\000\015\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\000\000\255\255\000\000\012\000\255\255\015\000\255\255\255\255\255\255\255\255\255\255\255\255\000\000\255\255\255\255\255\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\010\000\255\255\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\013\000\013\000\013\000\013\000\013\000\013\000\013\000\013\000\013\000\013\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\014\000\000\000\255\255\000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\000\000\255\255\000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\000\000\255\255\255\255\015\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255"
  ; Lexing.lex_base_code= ""
  ; Lexing.lex_backtrk_code= ""
  ; Lexing.lex_default_code= ""
  ; Lexing.lex_trans_code= ""
  ; Lexing.lex_check_code= ""
  ; Lexing.lex_code= "" }

let rec token lexbuf = __ocaml_lex_token_rec lexbuf 0

and __ocaml_lex_token_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
  | 0 ->
      token lexbuf
  | 1 ->
      Lexing.new_line lexbuf ; token lexbuf
  | 2 ->
      Int (int_of_string @@ Lexing.lexeme lexbuf)
  | 3 ->
      Float (float_of_string @@ Lexing.lexeme lexbuf)
  | 4 ->
      String (string (Buffer.create 17) lexbuf)
  | 5 ->
      Left_bracket
  | 6 ->
      Right_bracket
  | 7 ->
      Left_brace
  | 8 ->
      Right_brace
  | 9 ->
      Comma
  | 10 ->
      Colon
  | 11 ->
      Eof
  | 12 ->
      raise @@ SyntaxError ("unknown input: " ^ Lexing.lexeme lexbuf)
  | __ocaml_lex_state ->
      lexbuf.Lexing.refill_buff lexbuf ;
      __ocaml_lex_token_rec lexbuf __ocaml_lex_state

and string buf lexbuf = __ocaml_lex_string_rec buf lexbuf 15

and __ocaml_lex_string_rec buf lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
  | 0 ->
      Buffer.add_string buf @@ Lexing.lexeme lexbuf ;
      string buf lexbuf
  | 1 ->
      Buffer.add_string buf @@ Lexing.lexeme lexbuf ;
      Lexing.new_line lexbuf ;
      string buf lexbuf
  | 2 ->
      Buffer.contents buf
  | __ocaml_lex_state ->
      lexbuf.Lexing.refill_buff lexbuf ;
      __ocaml_lex_string_rec buf lexbuf __ocaml_lex_state

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
