(*
  Takes two dates and evaluates to true or false.
  It evaluates to true if the first argument is a date 
  that comes before the second argument.
  If the two dates are the same, the result is false.
*)
fun is_older (dates : (int * int * int) * (int * int * int)) = 
    #1 (#1 dates) < #1 (#2 dates) orelse
    (#1 (#1 dates) = #1 (#2 dates) andalso #2 (#1 dates) < #2 (#2 dates)) orelse
    (#1 (#1 dates) = #1 (#2 dates) andalso #2 (#1 dates) = #2 (#2 dates) andalso #3 (#1 dates) < #3 (#2 dates))

(*
  Takes a list of dates and a month.
  Returns how many dates in the list are in the given month.
*)
fun number_in_month (dates : (int * int * int) list, month : int) =
    if null dates then 0
    else (if #2 (hd dates) = month then 1 else 0) + number_in_month (tl dates, month)

(*
  Takes a list of dates and a list of months.
  Returns the number of dates in the list of dates that are in any of the months
  in the list of months.
*)
fun number_in_months (dates : (int * int * int) list, months : int list) = 
    if null months orelse null dates then 0
    else number_in_month (dates, hd months) + number_in_months (dates, tl months);

(*
  Takes a list of dates and a month.
  Returns a list holding the dates from the argument list of dates that are in the month.
*)
fun dates_in_month (dates : (int * int * int) list, month : int) = 
    if null dates then []
    else if #2 (hd dates) = month then hd dates :: dates_in_month (tl dates, month)
    else dates_in_month (tl dates, month)

(*
  Takes a list of dates and a list of months.
  Returns a list holding the dates from the argument list of dates that are in any
  of the months in the list of months.
*)
fun dates_in_months (dates : (int * int * int) list, months : int list) = 
    if null months orelse null dates then []
    else dates_in_month (dates, hd months) @ dates_in_months (dates, tl months)

(*
  Takes a list of strings and an int.
  Returns the nth element of the list, where the head of the list is the 1st.
  
  The assignment doesn't say what to return if n is out of range, or when the list is empty
  It just says, don't worry, but I will probably just return an empty string to meet the 
  required functon signature.  In other case I would probably return an Option not a string
  here.
*)
fun get_nth (strings : string list, n : int) =
    if null strings orelse n <= 0 then ""
    else if n = 1 then hd strings
    else get_nth (tl strings, n - 1)

(*
  Takes a date.
  Returns the date string representation in the format: January 20, 2013.

  Here, I assume the date is "resonable".
*)
fun date_to_string (date : int * int * int) =
  let
      val months = ["January","February","March","April","May","June","July",
                    "August","September","October","November","December"]
  in
      get_nth (months, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
  end

(*
  Takes an int called sum, which is positive, and an int list,
  which contains all positive numbers, and returns an int such that
  the first n elements of the list add to less than sum, but the first n + 1 elements of
  the list add to sum or more.
  
  Assume the entire list sums to more than the passed in value;
  it is okay for an exception to occur if this is not the case.
*)
fun number_before_reaching_sum (sum : int, numbers : int list) = 
    let
        fun n_before_reaching_sum (sum : int, numbers : int list, counter : int) = 
	    if sum <= hd numbers then counter
            else n_before_reaching_sum (sum - hd numbers, tl numbers, counter + 1) 
    in
        n_before_reaching_sum (sum, numbers, 0)
    end

(*
  Takes a day of year.
  Returns what month that day is in.
*)
fun what_month (day_of_year : int) =
    let
        val days_in_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
	1 + number_before_reaching_sum (day_of_year, days_in_months)
    end

(*
  Takes two days of the year.
  Returns a list of months to which days between day 1 and day 2 belong.
  The size of the list should be day2 - day1 + 1 or 0 if day2 < day1.
*)
fun month_range (day1 : int, day2 : int) = 
    let
        fun prepend_month_for_day (month_list : int list, day : int) = 
	    if day > day2 then month_list
            else what_month (day) :: prepend_month_for_day (month_list, day + 1)
    in
        if (day1 <= 0 andalso day2 <= 0) orelse day1 > day2 then []
	else prepend_month_for_day ([], (if day1 > 0 then day1 else 1))
    end

(*
  Takes a list of dates adn evaluates to an date option.
  Returns NONE if the list has no dates and SOME d if the date d is the
  oldest date in the list.
*)
fun oldest (dates : (int * int * int) list) =
    if null dates then NONE
    else 
	let
            fun oldest_nonempty (dates : (int * int * int) list) = 
                if null (tl dates)
                then hd dates
                else
                    let 
                        val tl_ans = oldest_nonempty (tl dates)
                    in
                        if is_older (hd dates, tl_ans)
                        then hd dates
                        else tl_ans
                    end 
                
	in
            SOME (oldest_nonempty dates)
        end