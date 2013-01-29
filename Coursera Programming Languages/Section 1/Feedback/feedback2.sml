fun is_older (d1 : int*int*int, d2 : int*int*int) =
  if (#1 d1) < (#1 d2)
  then true
  else if (#1 d1) > (#1 d2)
  then false
  else if (#2 d1) < (#2 d2)
  then true
  else if (#2 d1) > (#2 d2)
  then false
  else if (#3 d1) < (#3 d2)
  then true
  else false

fun number_in_month (dxs : (int*int*int) list, m : int) =
  let fun number_in_m (dxs : (int*int*int) list) =
    if null dxs
    then 0
    else if (#2 (hd dxs)) = m
    then 1 + number_in_m(tl dxs)
    else number_in_m(tl dxs)
  in
    number_in_m dxs
  end

fun number_in_months (dxs : (int*int*int) list, mxs : int list) =
  if null mxs
  then 0
  else number_in_month(dxs, (hd mxs)) + number_in_months(dxs, (tl mxs))

fun dates_in_month (dxs : (int*int*int) list, m : int) =
  let fun dates_in_m (dxs : (int*int*int) list) =
    if null dxs
    then []
    else if (#2 (hd dxs)) = m
    then (hd dxs) :: dates_in_m(tl dxs)
    else dates_in_m(tl dxs)
  in
    dates_in_m dxs
  end

fun dates_in_months (dxs : (int*int*int) list, mxs : int list) =
  if null mxs
  then []
  else dates_in_month(dxs, (hd mxs)) @ dates_in_months(dxs, (tl mxs))

fun get_nth (xs : string list, n : int) =
  if n <= 0
  then ""
  else if n = 1
  then hd xs
  else get_nth((tl xs), n-1)

fun date_to_string (d : int*int*int) =
  let val month_name_xs = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  in
    get_nth(month_name_xs, #2 d)^" "^Int.toString(#3 d)^", "^Int.toString(#1 d)
  end

fun number_before_reaching_sum (sum : int, xs : int list) =
  if (sum - (hd xs)) <= 0
  then 0
  else 1+number_before_reaching_sum((sum-(hd xs)), (tl xs));

fun what_month (day : int) =
  let
    val num_days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  in
    1+number_before_reaching_sum(day, num_days_in_month)
  end

fun month_range (day1 : int, day2 : int) =
  let fun m_range (day1 : int) =
    if day1 = day2
    then [what_month day1]
    else what_month day1 :: m_range(day1+1)
  in
    if day1 > day2
    then []
    else m_range day1
  end

fun oldest (dxs : (int*int*int) list) =
  if null dxs
  then NONE
  else
    let fun oldest_nonempty (dxs : (int*int*int) list) =
      if null (tl dxs)
      then hd dxs
      else
        let val tl_ans = oldest_nonempty(tl dxs)
        in
          if is_older((hd dxs), tl_ans)
          then hd dxs
          else tl_ans
        end
    in
      SOME(oldest_nonempty dxs)
    end

fun remove_duplicates (oxs : int list) =
  let
    fun purge_head_value (xs : int list) =
      if null xs
      then []
      else if (hd xs) = (hd oxs)
      then purge_head_value(tl xs)
      else (hd xs) :: purge_head_value(tl xs)
  in
    if null oxs
    then []
    else (hd oxs) :: (remove_duplicates(purge_head_value(tl oxs)))
  end

fun number_in_months_challenge (dxs : (int*int*int) list, mxs : int list) =
  number_in_months(dxs, remove_duplicates(mxs))

fun dates_in_months_challenge (dxs : (int*int*int) list, mxs : int list) =
  dates_in_months (dxs, remove_duplicates(mxs))

fun reasonable_date (d : (int*int*int)) =
  let
    fun get_nth (xs : int list, n : int) =
    if n = 1
    then hd xs
    else get_nth((tl xs), n-1);
    fun is_leap (y: int) =
    if (((y mod 400) = 0) orelse (((y mod 4) = 0) andalso (y mod 100) <> 0))
    then true
    else false;
    val num_days_in_month = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  in
    if (#1 d) <= 0
    then false
    else if (((#2 d) <= 0) orelse ((#2 d) > 12))
    then false
    else if (((#3 d) <= 0) orelse ((#3 d) > get_nth(num_days_in_month, (#2 d))))
    then false
    else if (((#2 d) = 2) andalso ((#3 d) = 29) andalso (not (is_leap(#1 d))))
    then false
    else true
  end

