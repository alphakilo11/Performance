program nth_prime;

{$mode objfpc}{$H+}

uses sysutils;

function nth_prime(n: integer): integer;
var
  primes: array of integer;
  num, sqrt_num, i: integer;
  is_prime: boolean;
begin
  if n <= 0 then
  begin
    nth_prime := 0;
    exit;
  end;

  SetLength(primes, 1);
  primes[0] := 2;
  num := 3;
  while Length(primes) < n do
  begin
    is_prime := true;
    sqrt_num := trunc(sqrt(num)) + 1;
    for i := 0 to High(primes) do
    begin
      if primes[i] > sqrt_num then
        break;
      if num mod primes[i] = 0 then
      begin
        is_prime := false;
        break;
      end;
    end;
    if is_prime then
    begin
      SetLength(primes, Length(primes) + 1);
      primes[High(primes)] := num;
    end;
    num := num + 2;
  end;
  nth_prime := primes[High(primes)];
end;

var
  i: integer;
  start_time, end_time: TDateTime;
begin
  start_time := Now;
  for i := 0 to 9 do
    writeln(nth_prime(50000));
  end_time := Now;
  writeln('Dauer: ', MilliSecondsBetween(end_time, start_time) / 1000:0:6);
end.
