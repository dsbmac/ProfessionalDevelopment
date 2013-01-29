(* Return true if d1 is older than d2 *)
fun is_older (d1 : int*int*int, d2: int*int*int) =
    (#1 d1) < (#1 d2) orelse 
    (#1 d1) = (#1 d2) andalso (#2 d1) < (#2 d2) orelse
    (#1 d1) = (#1 d2) andalso (#2 d1) = (#2 d2) andalso (#3 d1) < (#3 d2)

(* return the number of dates containing the given month *)
fun number_in_month (dates : (int*int*int) list, month : int) =
    let fun count (d : (int*int*int) list) =
            if null d 
            then 0
            else 
                let val tl_ans = count(tl d) 
                in
                    if (#2 (hd d)) = month
                    then 1 + tl_ans
                    else tl_ans
                end
    in
        count dates
    end

(* return the number of dates containing any of the given months *)
fun number_in_months (dates : (int*int*int) list, months : int list) =
    let fun count (m : int list) =
            if null m 
            then 0
            else number_in_month (dates, hd m) + count (tl m)
    in
        count months
    end

(* return the number of dates containing any of the given months *)
fun dates_in_month (dates : (int*int*int) list, month : int) =
    let fun filter (d : (int*int*int) list) =
            if null d
            then []
            else 
                let val tl_ans = filter (tl d) 
                in
                    if (#2 (hd d)) = month
                    then (hd d) :: tl_ans
                    else tl_ans
                end
    in
        filter dates
    end

(* return a list of dates containing the given month *)
fun dates_in_months (dates : (int*int*int) list, months : int list) =
    let fun filter (m : int list) =
            if null m 
            then []
            else dates_in_month (dates, hd m) @ filter (tl m)
    in
        filter months
    end

(* get the nth string from a list *)
fun get_nth (s : string list, n : int) =
    if null s
    then ""
    else if n = 1
    then hd s
    else get_nth (tl s, n-1)

(* convert a date to a string *)
fun date_to_string (d : int*int*int) =
    get_nth (["January", "February", "March", "April", 
              "May", "June", "July", "August", 
              "September", "October", "November", "December"], 
              (#2 d)) ^ " " ^ Int.toString (#3 d) ^ ", " ^ Int.toString (#1 d)

(* number of elements before total reaches sum *)
fun number_before_reaching_sum (s : int, l : int list) =
    if s <= (hd l)
    then 0
    else (1 + number_before_reaching_sum (s - hd l, tl l))

(* what month does a day number fall in *)
fun what_month (d : int) =
    number_before_reaching_sum (d, [31,28,31,30,31,30,31,31,30,31,30,31]) + 1

(* list the months between 2 dates *)
fun month_range (d1 : int, d2: int) =
    if d1 > d2
    then []
    else what_month d1 :: month_range (d1+1, d2)

(* oldest date *)
fun oldest (dates : (int*int*int) list) =
    let fun solve (best : (int*int*int), d : (int*int*int) list) =
            if null d
            then best
            else if is_older (best, (hd d))
            then solve (best, tl d)
            else solve ((hd d), (tl d))
    in
        if null dates
        then NONE
        else SOME (solve ((hd dates), (tl dates)))
    end

(* test if an integer is in an int list *)
fun member (i : int, l : int list) =
    let fun test (sl : int list) = 
        if null sl 
        then false
        else if (hd sl) = i then true
        else test (tl sl)
    in
        test l
    end

(* Remove dupes from an int list *)
fun squash_int_list (l : int list) =
    let fun build (il : int list, ol : int list) =
            if null il
            then ol
            else if member ((hd il), ol)
            then build ((tl il), ol)
            else build ((tl il), ol @ [(hd il)])
    in
        build(l, [])
    end

(* number in months coping with dupe months *)
fun number_in_months_challenge (dates : (int*int*int) list, months : int list) =
    number_in_months (dates, squash_int_list months)

(* dates in months coping with dupe months *)
fun dates_in_months_challenge (dates : (int*int*int) list, months : int list) =
    dates_in_months (dates, squash_int_list months)

(* get the nth int from a list *)
fun get_nth_int (l : int list, n : int) =
    if n = 1
    then hd l
    else get_nth_int (tl l, n-1)

fun reasonable_date (date : int*int*int) = 
    (* positive year *)
    (#1 date) >= 1 andalso 
    (* month 1..12 *)
    (#2 date) >= 1 andalso (#2 date) <= 12 andalso
    (* positive day *)
    (#3 date) >= 1 andalso 
    (* day ok for month *)
    (#3 date) <= get_nth_int ([31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31], (#2 date)) andalso
    (* deal with leap year *)
    ((#2 date) <> 2 orelse
     (#3 date) < 29 orelse
     (#1 date) mod 400 = 0 orelse
     (#1 date) mod 4 = 0 andalso not ((#1 date) mod 100 = 0))
