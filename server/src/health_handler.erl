-module(health_handler).
-export([init/2]).

init(Req, State) ->
    %% Respond with "Hello, World!"
    cowboy_req:reply(200, #{<<"content-type">> => <<"text/plain">>}, <<"Hello, World!">>, Req),
    {ok, Req, State}.