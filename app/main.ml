
open Lwt
open Cohttp
open Cohttp_lwt_unix
open Printf


let () =
  assert (Array.length Sys.argv = 3);
  let server_url = Sys.argv.(1) in
  let player_key = Sys.argv.(2) in
  printf "ServerUrl: %s; PlayerKey: %s\n" server_url player_key;
  Lwt_main.run begin
    Client.post (Uri.of_string server_url) >>= fun (resp, body) ->
    body |> Cohttp_lwt.Body.to_string >|= fun body ->
    match Response.status resp with
      | `OK ->
          printf "Server response: %s\n" body
      | status ->
          printf "Unexpected server response:\n";
          printf "HTTP code: %d\n" (Code.code_of_status status);
          printf "Response body: %s\n" body;
          exit 2
  end
