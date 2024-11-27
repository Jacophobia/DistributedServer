-module(router).
-export([start/0, stop/0]).

start() ->
    %% Define the dispatch table
    Dispatch = cowboy_router:compile([
        {'_', [%% Match all hostnames
            {"/health", health_handler, []} %% Route /health to health_handler
        ]}
    ]),

    %% Start the Cowboy HTTP server
    io:format("Starting server~n"),
    cowboy:start_clear(http_listener, [{port, 8080}], #{env => #{dispatch => Dispatch}}).

stop() ->
    io:format("Stopping server~n"),
    ok = cowboy:stop_listener(http_listener),
    io:format("Server stopped~n"),
    ok.
