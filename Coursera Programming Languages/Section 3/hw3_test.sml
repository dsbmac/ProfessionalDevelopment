(* turn off obnoxious warning about calling polyEqual *)
(* hopefully, we know what we're doing ;)             *)
use "hw3provided.sml";

val _ = Control.polyEqWarn := false;

val _ = let
    (* utility *)
    fun printResults(results) = foldl (fn ((module, report), _) => print(module ^ ":\n" ^ report ^ "\n")) () results
    fun allStringsEqual str strs = foldl (fn (nextStr, allEqualSoFar) => allEqualSoFar andalso nextStr = str) true strs
    fun onlyFailedModules results =
        List.map
            (fn (module, result) => (module, foldl (op ^) "" result))
            (List.filter (fn (_, result) => (not o (allStringsEqual "")) result) results)

    (* assertion framework *)
    fun assert(msg: string, e: bool) = if e then "" else "\tFAIL: " ^ msg ^ "\n"
    fun assertFalse(msg: string, e: bool) = assert(msg, not e)
    fun assertEquals(msg, expected, result) = assert("expected " ^ msg, expected = result)
    fun assertEqualsInt(msg, expected, result) =
        assertEquals("int " ^ Int.toString(expected) ^ " but was " ^ Int.toString(result) ^ " - " ^ msg, expected, result)
    fun assertEmptyList(msg, xs) = assert("expected empty list - " ^ msg, null xs)
    fun assertEqualsList(msg, expected, result) = assertEquals("equal lists - " ^ msg, expected, result)
    fun assertEqualsString(msg, expected, result) =
        assertEquals("string '" ^ expected ^ "' but was '" ^ result ^ "' - " ^ msg, expected, result)
    fun assertNone(msg: string, result) = assert("expected NONE but got SOME - " ^ msg, not (isSome result))
    fun assertSome(msg, expected) = assert("expected SOME but got NONE - " ^ msg, isSome(expected))

    (* tests *)
    (* TODO: should implement test runner (only feasible with some kind of lazy evaluation scheme) *)
    (*       (also setup/teardown functions, number of tests run, ...)                             *)
    (*       consider passing the function to be tested as a parameter just once, to avoid         *)
    (*       having to repeat the function name all the time                                       *)
    (*       find out if SML allows the code to find out a function name as a string, to avoid     *)
    (*       having to pass the test function both as a symbol and as a string                     *)
    val tests = [
        ("only_capitals", [
            assertEmptyList("for empty list", only_capitals([])),
            assertEqualsList("for list with uppercase strings", ["Upper", "Case"],
                only_capitals(["lower", "case", "Upper", "Case"])
            )
        ]),
        ("longest_string1", [
            assertEqualsString("for 'longest' as the first of many longest strings",
                "longest", longest_string1(["short", "small", "longest", "tiny", "l0ng3st"]))
        ]),
        ("longest_string2", [
            assertEqualsString("for 'l0ng3st' as the last of many longest strings",
                "l0ng3st", longest_string2(["short", "small", "longest", "tiny", "l0ng3st"]))
        ]),
        ("longest_string_helper", let
            fun like_in_longest_string_1(x, y) = x > y
        in [
            assertEqualsString("for 'longest' as the first of many longest strings",
                "longest", longest_string_helper like_in_longest_string_1 ["short", "small", "longest", "tiny", "l0ng3st"])
        ] end),
        ("first_answer", [
            assert("should raise NoAnswer for empty list",
                (* NOTE: sort of tedious construct to test for the right kind of exception to be raised *)
                (*       maybe figure out a more elegant way                                            *)
                (*       trivial, if lazy evaluation is possible in any way                             *)
                case SOME(SOME(first_answer (fn x => NONE) [])) handle NoAnswer => NONE | _ => SOME(NONE) of
                    NONE => true
                    | SOME _ => false
            ),
            assertEqualsInt("for equals_3 on increasing list", 3,
                first_answer (fn x => case x of 3 => SOME 3 | _ => NONE) [1, 2, 3, 4, 5]
            )
        ]),
        ("all_answers", [
            assertEquals("for any f and empty list", SOME [], all_answers (fn x => x) []),
            assertNone("for x => NONE and any list", all_answers (fn x => NONE) [1, 2, 3, 4, 5]),
            assertEqualsList("for x => SOME [x, x*x] and an int list", SOME [2, 4, 5, 25, 3, 9, 4, 16],
                all_answers (fn x => SOME [x, x*x]) [2, 5, 3, 4]
            )
        ])(*,
        ("count_wildcards", [
            assertEqualsInt("for tuple of Wildcard patterns", 3,
                count_wildcards (TupleP [Wildcard, ConstP 3, Wildcard, UnitP, Wildcard]))
        ]),
        ("check_pat", [
            assertFalse("for repeated Variable name", check_pat (TupleP [Variable "my_var", Variable "my_var"])),
            assertFalse("for repeated Variable names with other patterns interspersed",
                check_pat(TupleP [Variable "my_var", UnitP, Wildcard, Variable "my_var"])
            ),
            assert("for non-repeated Variables names with other patterns interspersed",
                check_pat (TupleP [Variable "my_var", UnitP, Wildcard, Variable "other_var"])
            )
        ]),
        ("match", [
            assertEquals("empty binding list for Wildcard pattern", SOME [], match(Const 16, Wildcard)),
            assertEquals("one binding for matching pattern with one Variable", SOME [("my_var", Const 13)],
                match(Const 13, Variable "my_var")
            ),
            assertEquals("empty binding list for matching UnitP", SOME [], match(Unit, UnitP)),
            assertEquals("empty binding list for matching ConstP", SOME [], match(Const 17, ConstP 17)),
            assertEquals("binding list for matching ConstructorP", SOME [("my_var", Const 13)],
                match(Constructor("my_constructor", Const 13), ConstructorP("my_constructor", Variable "my_var"))
            ),
            assertEquals("binding list for matching TupleP", SOME [("my_var", Const 13), ("other_var", Const 17)],
                match(Tuple [Const 13, Const 17], TupleP [Variable "my_var", Variable "other_var"])
            )
        ]),
        ("first_match", [
            assertEquals("empty binding list for Wildcard pattern", SOME [],
                first_match (Const 16) [UnitP, Wildcard, Variable "my_var"]
            ),
            assertEquals("one binding for Variable pattern", SOME [("my_var", Const 16)],
                first_match (Const 16) [UnitP, Variable "my_var", Wildcard]
            ),
            assertNone("for no matching pattern",
                first_match (Const 16) [UnitP, ConstP 32, ConstructorP ("my_constructor", Variable "my_var")]
            )
        ]),
        ("typecheck_patterns", [
            assertEquals("Anything-TupleT for first hw-example",
                SOME (TupleT [Anything, Anything]),
                typecheck_patterns([], [TupleP [Variable "x", Variable "y"], TupleP [Wildcard, Wildcard]])),
            assertEquals("nested Anything-TupleT for second hw-example",
                SOME (TupleT [Anything, TupleT [Anything, Anything]]),
                typecheck_patterns([], [TupleP [Wildcard, TupleP [Wildcard, Wildcard]], TupleP [Wildcard, Wildcard]])),
            assertNone("for exception UnmatchedConstructor",
                typecheck_patterns([], [
                    TupleP [Wildcard, TupleP [Wildcard, Wildcard]],
                    TupleP [Wildcard, Wildcard],
                    TupleP [ConstructorP("my_cons", Variable "my_var"), Wildcard]
                ])),
            assertEquals("TupleT with Datatype for example with valid Constructor",
                SOME (TupleT [Datatype "c_my_type", TupleT [Anything, Anything]]),
                typecheck_patterns([("my_cons", "c_my_type", IntT)], [
                    TupleP [Wildcard, TupleP [Wildcard, Wildcard]],
                    TupleP [Wildcard, Wildcard],
                    TupleP [ConstructorP("my_cons", ConstP 13), Wildcard]
                ]))
        ])*)
    ]
    val _ = print "\n\n";
in
    case onlyFailedModules tests of
        [] => print("SUCCESS\n\n")
        | results => printResults(results)
end
