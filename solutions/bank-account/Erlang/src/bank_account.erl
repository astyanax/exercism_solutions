-module(bank_account).

-behaviour(gen_server).

-export([
    start_link/0,
    balance/1,
    charge/2,
    close/1,
    create/0,
    deposit/2,
    withdraw/2
]).

-export([
    init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3,
    format_status/2
]).

start_link() ->
    Balance = 0,
    gen_server:start_link(?MODULE, Balance, []).

balance(Pid) -> gen_server:call(Pid, balance).

charge(Pid, Amount) -> gen_server:call(Pid, {charge, Amount}).

close(Pid) -> gen_server:call(Pid, close).

create() ->
    {ok, Pid} = start_link(),
    Pid.

deposit(Pid, Amount) -> gen_server:call(Pid, {deposit, Amount}).

withdraw(Pid, Amount) -> gen_server:call(Pid, {withdraw, Amount}).

init(State) ->
    process_flag(trap_exit, true),
    {ok, State}.

handle_call(balance, _From, State) -> {reply, State, State};
handle_call(close, _From, State) -> {reply, State, {error, account_closed}};
handle_call({deposit, Amount}, _From, _State) when Amount < 0 -> {reply, Amount, 0};
handle_call({deposit, Amount}, _From, State) -> {reply, Amount, State + Amount};
handle_call({withdraw, Amount}, _From, State) when Amount < 0 -> {reply, 0, State};
handle_call({withdraw, Amount}, _From, State) when Amount > State -> {reply, State, 0};
handle_call({withdraw, Amount}, _From, State) -> {reply, Amount, State - Amount};
handle_call({charge, Amount}, _From, State) when Amount < 0; Amount > State -> {reply, 0, State};
handle_call({charge, Amount}, _From, State) -> {reply, Amount, State - Amount}.

handle_cast(_Request, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

format_status(_Opt, Status) ->
    Status.
