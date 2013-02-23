<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node COLOR="#000000" CREATED="1359982230999" ID="ID_1271875710" MODIFIED="1361213057273">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Programming
    </p>
    <p>
      Languages
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="36"/>
<hook NAME="accessories/plugins/AutomaticLayout.properties"/>
<node COLOR="#0033ff" CREATED="1359982430620" FOLDED="true" ID="ID_1783454412" MODIFIED="1361216213518" POSITION="right">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Evaluate the power
    </p>
    <p>
      and elegance of
    </p>
    <p>
      languages and their
    </p>
    <p>
      constructs
    </p>
  </body>
</html></richcontent>
<edge STYLE="sharp_bezier" WIDTH="8"/>
<font NAME="Georgia" SIZE="30"/>
<node COLOR="#cc0000" CREATED="1360293066054" ID="ID_1638949918" MODIFIED="1360680117640" TEXT="Functions">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360250080759" ID="ID_267825409" MODIFIED="1360680117640" TEXT="Function calls">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="16"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360279750597" ID="ID_1419365539" MODIFIED="1360588242107" TEXT="Using functions as values">
<edge STYLE="bezier" WIDTH="thin"/>
<arrowlink DESTINATION="ID_223285859" ENDARROW="Default" ENDINCLINATION="584;0;" ID="Arrow_ID_1596404302" STARTARROW="None" STARTINCLINATION="584;0;"/>
<font NAME="Verdana" SIZE="12"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360292338868" ID="ID_130663740" MODIFIED="1360588242107" TEXT="Anonymous">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360292346907" ID="ID_1311954735" MODIFIED="1360588242107" TEXT="cannot use with recursion ">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360292351972" ID="ID_1071664984" MODIFIED="1360588242108" TEXT="most common use is as an argument to higher order function">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360292445835" ID="ID_1715354074" MODIFIED="1360588242108" TEXT="great for use in only one place">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360205516462" ID="ID_1584767849" MODIFIED="1360588242108" TEXT="Closures">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360280472759" ID="ID_468020703" MODIFIED="1360588242108" TEXT="can use bindings from outside the function definition">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360280499424" ID="ID_1771214115" MODIFIED="1360588242108" TEXT="makes 1st-class functions much more powerful">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360296761774" ID="ID_979753202" MODIFIED="1360588242109" TEXT="a &apos;pair&apos;, 2 parts">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360296772819" ID="ID_1600196665" MODIFIED="1360588242109" TEXT="code">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360296775965" ID="ID_18804971" MODIFIED="1360588242109" TEXT="environment">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360302716194" ID="ID_295459354" MODIFIED="1360588242109" TEXT="Currying">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360302724066" ID="ID_1387930916" MODIFIED="1360588242109" TEXT="closure idiom">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360302745515" ID="ID_1805902983" MODIFIED="1360588242110" TEXT="take arg and return a function that takes another arg and...">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360303154151" ID="ID_1091632368" MODIFIED="1360588242110" TEXT="syntactic sugar">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360033161870" ID="ID_159872181" MODIFIED="1360588242110">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Lexical scope
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<arrowlink DESTINATION="ID_1584767849" ENDARROW="Default" ENDINCLINATION="441;0;" ID="Arrow_ID_771460947" STARTARROW="None" STARTINCLINATION="441;0;"/>
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="yes"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360150384416" ID="ID_1014542162" MODIFIED="1360588242110" TEXT="Semantics">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360148639229" ID="ID_1913484779" MODIFIED="1360588242111" TEXT="the body of a function is evaluated in the environment in which it was defined not the one from where it was called.">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360296472743" ID="ID_1749485857" MODIFIED="1360588242111" TEXT="Example">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360296478407" ID="ID_1554187860" MODIFIED="1360588242111">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1&#160;&#160;val x = 1 (original environment)
    </p>
    <p>
      2&#160;&#160;fun f y = x + y (uses the x in the environment it was defined (1))
    </p>
    <p>
      3&#160;&#160;val x = 2 (new x binding)
    </p>
    <p>
      4&#160;&#160;val y = 3
    </p>
    <p>
      5&#160;&#160;val z = f (x+y) (<font face="Arial, sans-serif" color="#111111"><span style="color: #111111; font-family: Arial, sans-serif">evaluates to 6)</span></font>
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360299711880" ID="ID_1815392129" MODIFIED="1360588242111" TEXT="Dynamic Scope">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360299718366" ID="ID_525584557" MODIFIED="1360588242111" TEXT="use environment where function is called">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360299797624" ID="ID_338297689" MODIFIED="1360588242112" TEXT="not used much">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360300375027" ID="ID_1346595115" MODIFIED="1360588242112" TEXT="similar to raising exceptions">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360292963624" ID="ID_682671783" MODIFIED="1360588242112" TEXT="Unecessary function wrapping">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360358158848" ID="ID_1609419623" MODIFIED="1360588242112" TEXT="body is not evaluated until called">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360279930435" ID="ID_262435055" MODIFIED="1360680117645" TEXT="First-class functions">
<font NAME="Georgia" SIZE="16"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360033161876" ID="ID_1414150133" MODIFIED="1360588242113">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Higher-order functions
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360033161863" ID="ID_723862609" MODIFIED="1360588242113">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Currying
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360285441388" ID="ID_1314064529" MODIFIED="1360588242113" TEXT="often polymorphic but not always">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288457456" ID="ID_251777348" MODIFIED="1360588242113">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun times_until_zero (f,x) =
    </p>
    <p>
      &#160;&#160;&#160;&#160;if x=0 then 0 else 1 + times_until_zero(f, fx)
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360279954516" ID="ID_223285859" MODIFIED="1360588242114" TEXT="functions are values">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360287970939" ID="ID_411307757" MODIFIED="1360588242114" TEXT="Type">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360287977546" ID="ID_35395574" MODIFIED="1360588242114">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun n_times (f,n,x) =
    </p>
    <p>
      &#160;&#160;&#160;&#160;if n = 0
    </p>
    <p>
      &#160;&#160;&#160;&#160;then x
    </p>
    <p>
      &#160;&#160;&#160;&#160;else f(n_times(f, n-1, x))
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288046266" ID="ID_1175539128" MODIFIED="1360588242114" TEXT="val n_times : (&apos;a -&gt; &apos;a) * int * &apos;a -&gt; &apos;a">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288326312" ID="ID_657188418" MODIFIED="1360588242115" TEXT="A function of type &#x2032;a&#x2212;&gt;&#x2032;a indicates it takes one argument and returns a value of the same type as the argument.">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360288164345" ID="ID_1903048264" MODIFIED="1360588242115" TEXT="&apos;a means any type can be used">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360294759962" ID="ID_146165370" MODIFIED="1360588242115" TEXT="Use">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360294717667" ID="ID_1772503323" MODIFIED="1360588242115" TEXT="can return functions as results">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360294725771" ID="ID_41348300" MODIFIED="1360588242116" TEXT="can write higher-order functions that travese your own data structures">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360283057960" ID="ID_775171651" MODIFIED="1360588242116" TEXT="function as arguments">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360283092390" ID="ID_1536980434" MODIFIED="1360588242116" TEXT="fun f(g,...) = g(...)">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360283447075" ID="ID_1534251390" MODIFIED="1360588242116" TEXT="good technique to reuse code">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360294685995" ID="ID_1382402334" MODIFIED="1360588242116" TEXT="can pass several functions as arguments">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360294698068" ID="ID_1926589975" MODIFIED="1360588242117" TEXT="can put functions in data structures (list, tuples)">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360279968803" ID="ID_1080146765" MODIFIED="1360588242117" TEXT="can use them wherever we use values">
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="idea"/>
<node COLOR="#111111" CREATED="1360280160409" ID="ID_1773329292" MODIFIED="1360588242117" TEXT="most common use is as an argument/result  of another function">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360280235474" ID="ID_1961280377" MODIFIED="1360588242117">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      the other function is called a <i>higher-order function</i>
    </p>
  </body>
</html></richcontent>
<arrowlink DESTINATION="ID_1414150133" ENDARROW="Default" ENDINCLINATION="222;8;" ID="Arrow_ID_1866289354" STARTARROW="None" STARTINCLINATION="-240;-42;"/>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360207705877" ID="ID_912009804" MODIFIED="1360680117648">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Hall of Fame
    </p>
    <p>
      Functions
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="16"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360204050824" ID="ID_1003407896" MODIFIED="1360588242118" TEXT="Map">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360206900923" ID="ID_525075448" MODIFIED="1360588242118">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun map (fs, xs) =
    </p>
    <p>
      &#160;&#160;&#160;&#160;case xs of
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;[ ] =&gt; [ ]
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;| x::xs' =&gt; (f x)::(map(f,xs'))
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360293160838" ID="ID_1855298825" MODIFIED="1360588242118" TEXT="val map : (&apos;a -&gt; &apos;b) * &apos;a list -&gt; &apos;b list">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360293501228" ID="ID_638539267" MODIFIED="1360588242118" TEXT="map takes two arguments, a function and a list, and applies the function to each element of the list">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360204057840" ID="ID_1455353635" MODIFIED="1360588242119" TEXT="Filter">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360206684918" ID="ID_567130293" MODIFIED="1360588242119">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun filter (f, xs) =
    </p>
    <p>
      &#160;&#160;case xs of
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;[ ] =&gt; [ ]
    </p>
    <p>
      &#160;&#160;&#160;&#160;| x::xs' =&gt; if f x
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;then x::(filter (f,xs'))
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;else filter (f,xs')
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360293652123" ID="ID_746791147" MODIFIED="1360588242119" TEXT="returns a subset">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360293771946" ID="ID_1561981825" MODIFIED="1360588242119" TEXT="Type">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360293778337" ID="ID_1564379624" MODIFIED="1360588242120" TEXT="(&apos;a -&gt; bool) * &apos;a list -&gt; &apos;a list">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360293870865" ID="ID_995133773" MODIFIED="1360588242120" TEXT="filter takes two arguments, a function and a list, and applies the function to each element of the list, including the element if true">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360204060048" ID="ID_1746704610" MODIFIED="1360588242120" TEXT="Fold">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360205253264" ID="ID_1962402212" MODIFIED="1360588242120">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun fold (f,acc,xs) =
    </p>
    <p>
      &#160;&#160;case xs of
    </p>
    <p>
      &#160;&#160;&#160;&#160;[ ] =&gt; acc
    </p>
    <p>
      &#160;&#160;| x::xs' =&gt; fold(f, f(acc,x), xs')
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360358734902" ID="ID_588306372" MODIFIED="1360588242120" TEXT="this goes right to left">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360363300149" ID="ID_127346558" MODIFIED="1360588242121" TEXT="fun f1 xs = fold((fn (x,y) =&gt; x+y), 0, xs)">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360363342494" ID="ID_177450728" MODIFIED="1360588242121" TEXT="sums list example">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360363904714" ID="ID_818974228" MODIFIED="1360588242121" TEXT="no private data use">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360363400301" ID="ID_1546561626" MODIFIED="1360588242121">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun f3 (xs,lo,hi) =&#160;
    </p>
    <p>
      &#160;&#160;&#160;&#160;fold ((fn (x,y) =&gt;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;x + (if y &gt;= lo andalso y &lt;- hi then 1 else 0)), 0, xs)
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360363497092" ID="ID_1378338310" MODIFIED="1360588242121" TEXT="closure uses private data">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360363544516" ID="ID_1132919109" MODIFIED="1360588242122" TEXT="counts items between lo and hi">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360363882105" ID="ID_1287107531" MODIFIED="1360588242122" TEXT="closure makes fold more powerful">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360358645495" ID="ID_642591589" MODIFIED="1360588242122" TEXT="accumulates an answer by repeatedly applying f to a list">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360358813829" ID="ID_1647350625" MODIFIED="1360588242122" TEXT="works on different data structures tree, graph, set, array, etc.">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360736807438" ID="ID_1369985411" MODIFIED="1360736821562" TEXT="Scope">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360736821563" ID="ID_1140319929" MODIFIED="1360736869499" TEXT="which bindings are ">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#cc0000" CREATED="1360240801120" ID="ID_1977689532" MODIFIED="1360680117652" TEXT="Expressions">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360240838543" ID="ID_263509605" MODIFIED="1360680117652" TEXT="can contain subexpressions">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360240856717" ID="ID_1499496386" MODIFIED="1360588242123" TEXT="chain subexp to make larger expressions">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360245005569" ID="ID_1764097868" MODIFIED="1360680117652" TEXT="Kinds of Expressions">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360242113208" ID="ID_262588390" MODIFIED="1360588242123" TEXT="Addition">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360241211975" ID="ID_1303558663" MODIFIED="1360588242123" TEXT="Variable">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360241220275" ID="ID_1024967488" MODIFIED="1360588242123" TEXT="Simplest expression">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360735820046" ID="ID_1492566063" MODIFIED="1360735827835" TEXT="Local Variables">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360244472257" ID="ID_1688797825" MODIFIED="1360588242124" TEXT="Conditional">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360245054316" ID="ID_1138996395" MODIFIED="1360588242124" TEXT="Less than">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360250230304" ID="ID_511065556" MODIFIED="1360588242124" TEXT="Function calls">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360276932329" ID="ID_1761191071" MODIFIED="1360588242124" TEXT="Collection">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360276941880" ID="ID_112314920" MODIFIED="1360588242124" TEXT="Tuples">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360276945248" ID="ID_1279521354" MODIFIED="1360588242125" TEXT="Lists">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360276908489" ID="ID_1831677667" MODIFIED="1360588242125" TEXT="need a way to collect items">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360240902832" ID="ID_1277735550" MODIFIED="1360680117631" TEXT="Evaluation rules">
<font NAME="Georgia" SIZE="16"/>
</node>
</node>
<node COLOR="#cc0000" CREATED="1360033161764" ID="ID_1152113752" MODIFIED="1360680117654">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Eval
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
</node>
<node COLOR="#0033ff" CREATED="1359982430637" ID="ID_629579194" MODIFIED="1360947207951" POSITION="left">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      How to learn
    </p>
    <p>
      new programming
    </p>
    <p>
      languages quickly
    </p>
  </body>
</html></richcontent>
<edge STYLE="sharp_bezier" WIDTH="8"/>
<font NAME="Georgia" SIZE="30"/>
<node COLOR="#cc0000" CREATED="1360748069471" ID="ID_1563956048" MODIFIED="1360748093342" TEXT="Syntax">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360748073175" ID="ID_496570450" MODIFIED="1360748082319" TEXT="How do you write language constructs">
<font NAME="Georgia" SIZE="16"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360241571299" ID="ID_817354878" MODIFIED="1360748225868" TEXT="3 Rules">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="16"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360033218497" ID="ID_875308996" MODIFIED="1360748225868" TEXT="Syntax">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="stop"/>
<node COLOR="#111111" CREATED="1360238767539" ID="ID_1839216680" MODIFIED="1360588242092" TEXT="type checking">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360239662960" ID="ID_942876054" MODIFIED="1360588242092" TEXT="how you write something valid">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360239813989" ID="ID_1639485916" MODIFIED="1360748225869" TEXT="Evaluation">
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="go"/>
<node COLOR="#111111" CREATED="1360239826583" ID="ID_786276893" MODIFIED="1360588242093" TEXT="as the program runs">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360240120194" ID="ID_1136395115" MODIFIED="1360588242093" TEXT="extends the dynamic env.">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360241814745" ID="ID_1523572351" MODIFIED="1360588242093" TEXT="must type check first">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360241797532" ID="ID_704096861" MODIFIED="1360588242093" TEXT="produces a value">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244179849" ID="ID_489282001" MODIFIED="1360588242094" TEXT="all values are expressions">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244237253" ID="ID_566949980" MODIFIED="1360588242094" TEXT="not all expressions are values">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244255516" ID="ID_1252301042" MODIFIED="1360588242094" TEXT="evaluates to itself in 0 steps">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360239801091" ID="ID_1559677290" MODIFIED="1360748225871" TEXT="Type Checking">
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="prepare"/>
<node COLOR="#111111" CREATED="1360239838887" ID="ID_888927622" MODIFIED="1360588242095" TEXT="before the program runs">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360240104139" ID="ID_543078809" MODIFIED="1360588242095" TEXT="extends the static environment">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244319846" ID="ID_146160701" MODIFIED="1360588242095" TEXT="Types">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244331140" ID="ID_860706922" MODIFIED="1360588242095" TEXT="int">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244334346" ID="ID_548484441" MODIFIED="1360588242095">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      unit ( )
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244346696" ID="ID_898966498" MODIFIED="1360588242096" TEXT="the resul of using the use command in REPL">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360244340228" ID="ID_1821718631" MODIFIED="1360588242096" TEXT="bool">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360247284312" ID="ID_1768979395" MODIFIED="1360588242096" TEXT="Function">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360748478077" ID="ID_1497071528" MODIFIED="1360748497769" TEXT="uninteresting but a req for getting semantics">
<font NAME="Georgia" SIZE="16"/>
</node>
</node>
<node COLOR="#cc0000" CREATED="1360239723479" ID="ID_773106793" MODIFIED="1360748432111" TEXT="Semantics">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<icon BUILTIN="yes"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360239732983" ID="ID_50682881" MODIFIED="1360680117626" TEXT="What the written code means">
<font NAME="Georgia" SIZE="16"/>
</node>
</node>
<node COLOR="#cc0000" CREATED="1360033223006" ID="ID_983321391" MODIFIED="1360680117624" TEXT="Idioms">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360033161855" ID="ID_333611860" MODIFIED="1360680117625">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Syntactic sugar
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="16"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360748263205" ID="ID_330116923" MODIFIED="1360748277173" TEXT="typical patterns fo using language features">
<font NAME="Georgia" SIZE="16"/>
</node>
</node>
<node COLOR="#cc0000" CREATED="1360033227093" ID="ID_1365563441" MODIFIED="1360680117625" TEXT="Libraries">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360748286182" ID="ID_1949954391" MODIFIED="1360748304788" TEXT="what facilities does the language provide">
<font NAME="Georgia" SIZE="16"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360748342333" ID="ID_735048834" MODIFIED="1360748350250" TEXT="how much do you have write yourself">
<font NAME="Georgia" SIZE="16"/>
</node>
</node>
<node COLOR="#cc0000" CREATED="1360033231542" ID="ID_1572582425" MODIFIED="1360680117625" TEXT="Tools">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360748307445" ID="ID_339621089" MODIFIED="1360748327177" TEXT="REPL, debugger, code formatter, etc.">
<font NAME="Georgia" SIZE="16"/>
</node>
</node>
<node COLOR="#cc0000" CREATED="1360245982303" ID="ID_297285607" MODIFIED="1360680117626" TEXT="Play around">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
</node>
<node COLOR="#0033ff" CREATED="1359982377329" ID="ID_1795020779" MODIFIED="1360947207947" POSITION="left">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Understand functional and
    </p>
    <p>
      object-oriented programs
    </p>
  </body>
</html></richcontent>
<edge STYLE="sharp_bezier" WIDTH="8"/>
<font NAME="Georgia" SIZE="30"/>
<node COLOR="#cc0000" CREATED="1360238138828" ID="ID_1039009066" MODIFIED="1360680117617" TEXT="A functional program is a just a sequence of bindings">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<icon BUILTIN="idea"/>
</node>
<node COLOR="#cc0000" CREATED="1360279616734" ID="ID_1681294643" MODIFIED="1360680117618" TEXT="Avoiding mutation">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360237665449" ID="ID_327473395" MODIFIED="1360680117618" TEXT="Immutable Data">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360237683576" ID="ID_1275495174" MODIFIED="1360588242081">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      This is the core of functional programming!
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360033161895" ID="ID_1345295613" MODIFIED="1360680117618">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Benefits of no mutation
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360279645806" ID="ID_590255026" MODIFIED="1360588242081" TEXT="be confident no one changes your code">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360748715587" ID="ID_1586228212" MODIFIED="1360748720618" TEXT="Java security leak">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360748720620" ID="ID_1912960728" MODIFIED="1360748744715" TEXT="returns an alias you can change the list of allowed users">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360747977688" ID="ID_62309598" MODIFIED="1360747981534" TEXT="Alias">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360747872457" ID="ID_1058604614" MODIFIED="1360747885639" TEXT="ML creates aliases all the time">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360747885640" ID="ID_1600849500" MODIFIED="1360747903600" TEXT="impossible to tell, which is fine">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360747910488" ID="ID_1829513113" MODIFIED="1360747919697" TEXT="allows you to focus on the algorithm">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360747993160" ID="ID_800794684" MODIFIED="1360748028061" TEXT="languages that mutate data (Java) programmers have to obsess if the objects alias">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#cc0000" CREATED="1360279750597" ID="ID_1480013565" MODIFIED="1360680117618" TEXT="Using functions as values">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360279930435" ID="ID_1356647071" MODIFIED="1360680117619" TEXT="First-class functions">
<font NAME="Georgia" SIZE="16"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360033161876" ID="ID_491676561" MODIFIED="1360588242082">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Higher-order functions
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360033161863" ID="ID_1432374590" MODIFIED="1360588242082">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Currying
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360285441388" ID="ID_993106401" MODIFIED="1360588242082" TEXT="often polymorphic but not always">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288457456" ID="ID_76440692" MODIFIED="1360588242083">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun times_until_zero (f,x) =
    </p>
    <p>
      &#160;&#160;&#160;&#160;if x=0 then 0 else 1 + times_until_zero(f, fx)
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360279954516" ID="ID_160232736" MODIFIED="1360588242083" TEXT="functions are values">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360279968803" ID="ID_1297763280" MODIFIED="1360588242083" TEXT="can use them wherever we use values">
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="idea"/>
<node COLOR="#111111" CREATED="1360280160409" ID="ID_1955595259" MODIFIED="1360588242083" TEXT="most common use is as an argument/result  of another function">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360280235474" ID="ID_133652359" MODIFIED="1360588242084">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      the other function is called a <i>higher-order function</i>
    </p>
  </body>
</html></richcontent>
<arrowlink DESTINATION="ID_491676561" ENDARROW="Default" ENDINCLINATION="222;8;" ID="Arrow_ID_1228330632" STARTARROW="None" STARTINCLINATION="-240;-42;"/>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360283057960" ID="ID_1260475361" MODIFIED="1360588242084" TEXT="function as arguments">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360283092390" ID="ID_303507059" MODIFIED="1360588242084" TEXT="fun f(g,...) = g(...)">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360283447075" ID="ID_305234561" MODIFIED="1360588242084" TEXT="good technique to reuse code">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360287970939" ID="ID_783793342" MODIFIED="1360588242085" TEXT="Type">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360287977546" ID="ID_323935551" MODIFIED="1360588242085">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun n_times (f,n,x) =
    </p>
    <p>
      &#160;&#160;&#160;&#160;if n = 0
    </p>
    <p>
      &#160;&#160;&#160;&#160;then x
    </p>
    <p>
      &#160;&#160;&#160;&#160;else f(n_times(f, n-1, x))
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288046266" ID="ID_1509506845" MODIFIED="1360588242085" TEXT="val n_times : (&apos;a -&gt; &apos;a) * int * &apos;a -&gt; &apos;a">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288326312" ID="ID_1677230853" MODIFIED="1360588242085" TEXT="A function of type &#x2032;a&#x2212;&gt;&#x2032;a indicates it takes one argument and returns a value of the same type as the argument.">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360288164345" ID="ID_1948875305" MODIFIED="1360588242085" TEXT="&apos;a means any type can be used">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360205516462" ID="ID_61580563" MODIFIED="1360680117621" TEXT="Closures">
<arrowlink DESTINATION="ID_1356647071" ENDARROW="Default" ENDINCLINATION="-6;24;" ID="Arrow_ID_735745465" STARTARROW="Default" STARTINCLINATION="3;-12;"/>
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360280472759" ID="ID_771140487" MODIFIED="1360588242086" TEXT="can use bindings from outside the function definition">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360280499424" ID="ID_489499515" MODIFIED="1360588242086" TEXT="makes 1st-class functions much more powerful">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360364005729" ID="ID_55150341" MODIFIED="1360588242086" TEXT="fold">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360364012896" ID="ID_1690890120" MODIFIED="1360588242087" TEXT="private data">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360364019695" ID="ID_1402387868" MODIFIED="1360588242087" TEXT="lexical scope">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360358554152" ID="ID_1530468876" MODIFIED="1360588242087" TEXT="recomputation savings">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360292338868" ID="ID_1268681033" MODIFIED="1360680117622" TEXT="Anonymous">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360292346907" ID="ID_1082665501" MODIFIED="1360588242087" TEXT="cannot use with recursion ">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360292351972" ID="ID_1977566871" MODIFIED="1360588242088" TEXT="most common use is as an argument to higher order function">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360292445835" ID="ID_1797608789" MODIFIED="1360588242088" TEXT="great for use in only one place">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#cc0000" CREATED="1360279849323" ID="ID_889804456" MODIFIED="1360680117623" TEXT="no clear yes/no for a particular language">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#cc0000" CREATED="1360279874371" ID="ID_1671089419" MODIFIED="1360680117623" TEXT="Style">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360033161791" ID="ID_1873965344" MODIFIED="1360680117623">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Laziness, streams, and memoization
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="16"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360279779519" ID="ID_388725695" MODIFIED="1360680117624" TEXT="closer to mathematical definitions">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="16"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360238258911" ID="ID_1962718393" MODIFIED="1360680117624" TEXT="Recursion affinity">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="16"/>
</node>
</node>
</node>
<node COLOR="#0033ff" CREATED="1359982430607" ID="ID_878814675" MODIFIED="1360947207970" POSITION="right" STYLE="fork">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Learn basic
    </p>
    <p>
      ML, Racket, and Ruby
    </p>
    <p>
      and leverage that
    </p>
    <p>
      proficiency to
    </p>
    <p>
      different languages
    </p>
  </body>
</html></richcontent>
<edge STYLE="sharp_bezier" WIDTH="8"/>
<font NAME="Georgia" SIZE="30"/>
<node COLOR="#cc0000" CREATED="1359982522312" FOLDED="true" ID="ID_182957583" MODIFIED="1361215752342">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="../../../Users/Denis/Pictures/Lindig2.jpeg" />
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360238984907" ID="ID_1915988689" MODIFIED="1360680117654" TEXT="Dynamic &amp; Static environment">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360239002809" ID="ID_1761349363" MODIFIED="1360588242126" TEXT="Static">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360239009185" ID="ID_478573331" MODIFIED="1360588242126" TEXT="keeps track of variable types">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360680325603" ID="ID_40381589" MODIFIED="1360680365302" TEXT="the binding of names before the program is run is called&#xa0;static">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360238516503" ID="ID_422150713" MODIFIED="1360588242126" TEXT="Dynamic environment">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360238533056" ID="ID_1435659147" MODIFIED="1360680395465">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      env. when you're running your program
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360246448912" ID="ID_1860101807" MODIFIED="1360588242127" TEXT="Shadowing">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360246519498" ID="ID_1591562174" MODIFIED="1360588242127" TEXT="explains how variable bindings work">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360240801120" ID="ID_1482028639" MODIFIED="1360769532652" TEXT="Expressions">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360245005569" ID="ID_1993584588" MODIFIED="1360588242128" TEXT="Kinds of Expressions">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360242113208" ID="ID_28817220" MODIFIED="1360588242128" TEXT="Addition">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244472257" ID="ID_839879046" MODIFIED="1360588242129" TEXT="Conditional">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244484052" ID="ID_155437244" MODIFIED="1360588242129" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244499063" ID="ID_1782946491" MODIFIED="1360588242129" TEXT="if e1 then e2 else e3">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244536829" ID="ID_212029351" MODIFIED="1360588242129">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      where if, then else are keywords
    </p>
    <p>
      and e1, e2, e3 are subexpressions
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360244611988" ID="ID_1239891493" MODIFIED="1360588242129" TEXT="Type-checking">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244639209" ID="ID_1373974680" MODIFIED="1360588242129" TEXT="e1 must be type bool">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360244653471" ID="ID_848778078" MODIFIED="1360588242130" TEXT="e2, e3 can have any type t but must be the same type t">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360244745040" ID="ID_1139006463" MODIFIED="1360588242130" TEXT="Evaluation">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360244756015" FOLDED="true" ID="ID_316539049" MODIFIED="1360588242130">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      evaluate&#160;e1 to a value v1
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="full-1"/>
</node>
<node COLOR="#111111" CREATED="1360244807157" ID="ID_1861704710" MODIFIED="1360588242130" TEXT="if it&apos;s true then e2 is the result else e3">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360245054316" ID="ID_1003857860" MODIFIED="1360588242130" TEXT="Less than">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245061982" ID="ID_824789021" MODIFIED="1360588242131" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245068687" ID="ID_6487470" MODIFIED="1360588242131" TEXT="e1 &lt; e2">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245085936" ID="ID_1833084143" MODIFIED="1360588242131" TEXT="Type-checking">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245096791" ID="ID_1307393931" MODIFIED="1360588242131" TEXT="e1 and e2 have same type int">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245144045" ID="ID_1410815516" MODIFIED="1360588242131" TEXT="Evaluation">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245218685" ID="ID_1622997009" MODIFIED="1360588242132" TEXT="evaluate e2 to v1 and e2 to v2">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360245179715" ID="ID_730481765" MODIFIED="1360588242132" TEXT="if v1 &lt; v2 then true else false">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360276885002" FOLDED="true" ID="ID_906408532" MODIFIED="1360738761893" TEXT="Tuples &amp; Lists">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360276997288" ID="ID_666919492" MODIFIED="1360734065409" TEXT="Tuples">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360734181241" ID="ID_1455953414" MODIFIED="1360734194402" TEXT="Building">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245061982" ID="ID_1959410498" MODIFIED="1360588242132" STYLE="fork" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277070632" ID="ID_1776472701" MODIFIED="1360733941219" TEXT="(e1,e2,...en)">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245085936" ID="ID_1619743197" MODIFIED="1360588242133" STYLE="fork" TEXT="Type-checking">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277081863" ID="ID_580410403" MODIFIED="1360733959925" TEXT="ta * tb * ... * tn">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245144045" ID="ID_936342164" MODIFIED="1360588242133" STYLE="fork" TEXT="Evaluation">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277137039" ID="ID_1605223796" MODIFIED="1360588242133" TEXT="Eval e1 to v1 and e2 to v2; result is (v1,v2)">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360277357174" ID="ID_946999057" MODIFIED="1360588242134" TEXT="Access">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245061982" ID="ID_1441582057" MODIFIED="1360588242134" STYLE="fork" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277390605" ID="ID_626384089" MODIFIED="1360734026177" TEXT="#1 e, #2 e, #3 e, ...">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360734105066" ID="ID_172048895" MODIFIED="1360734170232" TEXT="Usage">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360734108775" ID="ID_467832715" MODIFIED="1360734118961" TEXT="can nest them">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360277185615" ID="ID_1065739060" MODIFIED="1360588242133" TEXT="is a new kind of type">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360733341423" ID="ID_1922028518" MODIFIED="1360733347052" TEXT="is a value">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360734293920" ID="ID_1751419091" MODIFIED="1360734305542" TEXT="each-of type">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360732617291" ID="ID_1263568446" MODIFIED="1360734066394" TEXT="Pairs (2-tuples)">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360733530126" ID="ID_407776166" MODIFIED="1360733533590" TEXT="Building">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360732640260" ID="ID_1298602910" MODIFIED="1360732643012" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360732656916" ID="ID_718345169" MODIFIED="1360733668925" TEXT="(e1,e2)">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360732643812" ID="ID_21464729" MODIFIED="1360732646261" TEXT="Evaluation">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360733295675" ID="ID_1954491038" MODIFIED="1360733337973" TEXT="eval e1 to v1, e2 to v2; result is (v1,v2)">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360732647123" ID="ID_981022813" MODIFIED="1360732650474" TEXT="Type-checking">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360733393623" ID="ID_98509034" MODIFIED="1360733493402">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      if e1 has type ta and e2 has type tb then the pair exp has type <b>ta * tb</b>
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360733533870" ID="ID_1607060288" MODIFIED="1360733536879" TEXT="Access">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360733542941" ID="ID_292253371" MODIFIED="1360733547923" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360733558077" ID="ID_706658202" MODIFIED="1360733689225">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <b>#1 e</b>&#160;and <b>#2 e</b>
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360733548222" ID="ID_799384494" MODIFIED="1360733550256" TEXT="Evaluation">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360733583358" ID="ID_1436925777" MODIFIED="1360733609541" TEXT="eval e to a pair of values and return first or second piece">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360733550534" ID="ID_531611485" MODIFIED="1360733554814" TEXT="Type-checking">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360733611277" ID="ID_1750772728" MODIFIED="1360733644640" TEXT="e has type ta * tb, then #1 e has type ta and #2 e has type tb">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360277003640" ID="ID_1995446943" MODIFIED="1360734069490" TEXT="Lists">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277888635" ID="ID_1420604799" MODIFIED="1360588242135" TEXT="any number of elements">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360734408303" ID="ID_1696367158" MODIFIED="1360734420143" TEXT="Building">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245061982" ID="ID_1014226687" MODIFIED="1360588242135" STYLE="fork" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277924537" ID="ID_135622555" MODIFIED="1360735146547" TEXT="[v1, v2,...,vn]">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360734449535" ID="ID_1078685956" MODIFIED="1360734458838" TEXT="[ ] is empty list">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245085936" ID="ID_161552795" MODIFIED="1360588242135" STYLE="fork" TEXT="Type-checking">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360278357199" ID="ID_1733533409" MODIFIED="1360588242135" TEXT="e1::e2 e1 has type t and e2 has type t list">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360278494501" ID="ID_1440689836" MODIFIED="1360588242135" TEXT="t list all elements have type t">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360278532709" ID="ID_1581078460" MODIFIED="1360588242135">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      'a means <i>any</i>&#160;type
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360734503446" ID="ID_472193125" MODIFIED="1360734510562" TEXT="all items have the same type">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245144045" ID="ID_1925965111" MODIFIED="1360588242135" STYLE="fork" TEXT="Evaluation">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360277948882" ID="ID_1145807934" MODIFIED="1360735237729" TEXT="e1::e2">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360735227756" ID="ID_1521802499" MODIFIED="1360735231709" TEXT=" adds an element to the front">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360735232170" ID="ID_1349533362" MODIFIED="1360735234728" TEXT="cons">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360278167415" ID="ID_716712108" MODIFIED="1360588242136" TEXT="accessing">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360587057910" ID="ID_2195146" MODIFIED="1360588242136" TEXT="check variant">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360278104921" ID="ID_750818610" MODIFIED="1360735116210" TEXT="null">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360278126056" ID="ID_676240123" MODIFIED="1360588242136" TEXT="returns true if list is empty">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360278676948" ID="ID_810323568" MODIFIED="1360588242136" TEXT="&apos;a list -&gt; bool">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360587071150" ID="ID_1269489039" MODIFIED="1360588242136" TEXT="extract data">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360278171112" ID="ID_431003745" MODIFIED="1360735117547" TEXT="hd">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360278685132" ID="ID_850912887" MODIFIED="1360588242137" TEXT="&apos;a list -&gt; &apos;a">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360734884260" ID="ID_1315455512" MODIFIED="1360734891412" TEXT="&quot;alpha&quot; list">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360734897220" ID="ID_1274260979" MODIFIED="1360734915177" TEXT="alpha represents any type">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360734728581" ID="ID_842586298" MODIFIED="1360734746041" TEXT="gets the first element">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360278175464" ID="ID_219830066" MODIFIED="1360735118763" TEXT="tl">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360278178224" ID="ID_572614686" MODIFIED="1360588242137" TEXT="the rest of the list to the right of the hd">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360278220055" ID="ID_479746199" MODIFIED="1360588242137" TEXT="exception e if empty">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360278697037" ID="ID_1151874247" MODIFIED="1360588242137" TEXT="&apos;a list -&gt; &apos;a list">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360735265353" ID="ID_1734788073" MODIFIED="1360735269110" TEXT="List functions">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360735337769" ID="ID_1453532617" MODIFIED="1360735508108">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun sum_list (xs : int list) =
    </p>
    <p>
      &#160;&#160;if null xs
    </p>
    <p>
      &#160;&#160;then 0
    </p>
    <p>
      &#160;&#160;else hd xs + sum_list(tl xs)
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360241211975" ID="ID_865473071" MODIFIED="1360738399963" TEXT="Variable">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360241220275" ID="ID_624851513" MODIFIED="1360588242139" TEXT="Simplest expression">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360239524143" ID="ID_118819988" MODIFIED="1360588242139" TEXT="variable binding">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360239532805" ID="ID_1097776630" MODIFIED="1360588242139" TEXT="val x = e">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360736141164" ID="ID_1239226852" MODIFIED="1360953158603" TEXT="Functions">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<icon BUILTIN="yes"/>
<node COLOR="#111111" CREATED="1360736147811" ID="ID_1287383955" MODIFIED="1360736149613" TEXT="Build">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360736153411" ID="ID_801528429" MODIFIED="1360736158909" TEXT="syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360736158911" ID="ID_552651079" MODIFIED="1360736182957" TEXT="fun x0 (x1:t1, ..., xn:tn) = e">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360736235530" ID="ID_1393030036" MODIFIED="1360736242219" TEXT="type">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360736242220" ID="ID_1287238995" MODIFIED="1360736254520" TEXT="t1 * ... * tn -&gt; t">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360736150116" ID="ID_894282675" MODIFIED="1360736152285" TEXT="Access">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360736193891" ID="ID_1965554772" MODIFIED="1360736209253" TEXT="e0 (e1, ..., en)">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360288632510" ID="ID_1870008175" MODIFIED="1360588242137" TEXT="Anonymous Functions">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360290690832" ID="ID_1985231392" MODIFIED="1360588242137" TEXT="fun triple_n_times (n_times(fn =&gt; 3*x),n,x)">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360290829663" ID="ID_1493172640" MODIFIED="1360588242138" TEXT="fn is an expression form not a binding">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360291132309" ID="ID_755556871" MODIFIED="1360588242138" TEXT="if you used fun binding it would not compile">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360289137155" ID="ID_547505702" MODIFIED="1360588242138">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun triple_n_times (n,x) =
    </p>
    <p>
      &#160;&#160;&#160;&#160;n_times(<font color="#cc0000">let fun triple x = 3*x in triple end</font>, <font color="#0000ff">n</font>, <font color="#00cc00">x</font>)
    </p>
    <p>
      &#160;&#160;&#160;
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288922540" ID="ID_1294608526" MODIFIED="1360588242138">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun triple_n_times (n,x) =
    </p>
    <p>
      &#160;&#160;&#160;&#160;let fun triple x = 3*x
    </p>
    <p>
      &#160;&#160;&#160;&#160;in n_times(triple,n,x)
    </p>
    <p>
      &#160;&#160;&#160;&#160;end
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288784088" ID="ID_237393991" MODIFIED="1360588242138">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun triple x = 3*x
    </p>
    <p>
      
    </p>
    <p>
      fun triple_n_times (n,x) = n_times(triple,n,x)
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360288641046" ID="ID_1120353145" MODIFIED="1360588242138" TEXT="given the function n_times">
<arrowlink DESTINATION="ID_323935551" ENDARROW="Default" ENDINCLINATION="2408;0;" ID="Arrow_ID_949735324" STARTARROW="None" STARTINCLINATION="453;0;"/>
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360291253508" ID="ID_1989504367" MODIFIED="1360588242138">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      top level <i>triple</i>&#160;definition (poor style)
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360292226436" ID="ID_1492771571" MODIFIED="1360588242138" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360292254565" ID="ID_1828935685" MODIFIED="1360588242139" TEXT="fn pat =&gt; exp">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360763808077" ID="ID_88681244" MODIFIED="1360763822237" TEXT="Mutual Recursion">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360763822238" ID="ID_1969113610" MODIFIED="1360763831007" TEXT="keyword and">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360861912126" ID="ID_382358956" MODIFIED="1360861923424" TEXT="Partial application">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360861923426" ID="ID_1320490687" MODIFIED="1360862028816" TEXT="if you call a function with too  few args you get back a closure waiting for the rest">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360862779690" ID="ID_711649510" MODIFIED="1360862799219" TEXT="can use this to build other functions">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360248277535" ID="ID_1048817481" MODIFIED="1360588242141" TEXT="the most important building block in the course">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360248550360" ID="ID_1230768021" MODIFIED="1360829087810" TEXT="takes exactly 1 argument">
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="ksmiletris"/>
<node COLOR="#111111" CREATED="1360248537682" ID="ID_238604073" MODIFIED="1360588242141" TEXT="Unless a function has exactly one argument, you need to use parentheses to call it">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360735918020" ID="ID_274221559" MODIFIED="1360735926470" TEXT="Local Variables">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360735926471" ID="ID_359676437" MODIFIED="1360735936185" TEXT="Let expressions">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360735936186" ID="ID_1173993456" MODIFIED="1360735936186" TEXT="">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360736355817" ID="ID_1160059423" MODIFIED="1360738394715" TEXT="Let-expression">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360736363623" ID="ID_79599240" MODIFIED="1360736366200" TEXT="syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360736366202" ID="ID_924440718" MODIFIED="1360736630439">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      let
    </p>
    <p>
      &#160;&#160;b1
    </p>
    <p>
      &#160;&#160;b2
    </p>
    <p>
      in
    </p>
    <p>
      &#160;&#160;e
    </p>
    <p>
      end
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360736392489" ID="ID_785038475" MODIFIED="1360736400451" TEXT="bi is any binding">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360736401010" ID="ID_483226621" MODIFIED="1360736404882" TEXT="e is any expression">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360736472377" ID="ID_1810181365" MODIFIED="1360736479318" TEXT="Type-checking">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360736534985" ID="ID_505409839" MODIFIED="1360736555001" TEXT="type-check each bi and e in a static env that incl the prev biding">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360736555848" ID="ID_58879599" MODIFIED="1360736574172" TEXT="type of whole let-exp is the type of e">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360736479920" ID="ID_160295657" MODIFIED="1360736483839" TEXT="Evaluation">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360736483841" ID="ID_1630484705" MODIFIED="1360736511291" TEXT="eval each bi and e in a dyn env that incl prev bindings">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360736518609" ID="ID_30779336" MODIFIED="1360736530825" TEXT="result of whole let-expression is result of eval e">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360736708415" ID="ID_302990912" MODIFIED="1360736720805" TEXT="can put anywhere an expression goes">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360738409795" ID="ID_1062159399" MODIFIED="1360738424601" TEXT="can use to memoize and avoid duplicating calculations">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360746636193" ID="ID_1632263763" MODIFIED="1360746639666" TEXT="Boolean">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360746639669" ID="ID_507993823" MODIFIED="1360746649303" TEXT="e1 andalso e2">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360746649881" ID="ID_1753633999" MODIFIED="1360746654645" TEXT="e1 orelse e2">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360746657481" ID="ID_1989823326" MODIFIED="1360746661182" TEXT="not e1">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360747024663" ID="ID_799549733" MODIFIED="1360747033189" TEXT="Type-checking">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360747033191" ID="ID_127661325" MODIFIED="1360747040976" TEXT="e1 and e2 must have type bool">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360747044767" ID="ID_761968636" MODIFIED="1360747048606" TEXT="Evaluation">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360747048607" ID="ID_1181851921" MODIFIED="1360747061885" TEXT="if result of e1 is false then false else result of e2">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360747312125" ID="ID_790008497" MODIFIED="1360747315444" TEXT="style">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360747315445" ID="ID_423952809" MODIFIED="1360747328271" TEXT="syntactic sugar for if then else">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360747328572" ID="ID_1868829123" MODIFIED="1360747351232">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      if e
    </p>
    <p>
      then true
    </p>
    <p>
      else false
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360747352556" ID="ID_1374405460" MODIFIED="1360747359089" TEXT="don&apos;t do this.">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360747359972" ID="ID_663462048" MODIFIED="1360747363920" TEXT="just do e">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360747415852" ID="ID_752482064" MODIFIED="1360747420429" TEXT="Comparisons">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360747424804" ID="ID_619002070" MODIFIED="1360747425856" TEXT="=">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360747426692" ID="ID_1050889444" MODIFIED="1360747430184" TEXT="&lt;&gt;">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360747430724" ID="ID_271934953" MODIFIED="1360747433176" TEXT="&gt;">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360747438044" ID="ID_1108926162" MODIFIED="1360747440017" TEXT="&lt;">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360747440731" ID="ID_1986830188" MODIFIED="1360747442915" TEXT="&gt;=">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360747444908" ID="ID_1095901865" MODIFIED="1360747447035" TEXT="&lt;=">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360582343730" ID="ID_459527501" MODIFIED="1360952026603" TEXT="Types">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360582347632" ID="ID_866102204" MODIFIED="1360588242147" TEXT="Basic">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360582356215" ID="ID_238655209" MODIFIED="1360591886044" TEXT="int">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360582361799" ID="ID_1687051999" MODIFIED="1360591886524" TEXT="bool">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360582382400" ID="ID_1770783880" MODIFIED="1360591887059" TEXT="unit">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360582384384" ID="ID_1229500554" MODIFIED="1360591887516" TEXT="char">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360582397391" ID="ID_237858056" MODIFIED="1360591887996" TEXT="real">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360582351656" ID="ID_837302319" MODIFIED="1360952982622" TEXT="Compound">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360582480998" ID="ID_1991010376" MODIFIED="1360588242148" TEXT="Each of">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360582425878" ID="ID_1631583264" MODIFIED="1360588242148" TEXT="list">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360582434711" ID="ID_1724111495" MODIFIED="1360591867404" TEXT="records">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360583194034" ID="ID_372435282" MODIFIED="1360588242149" TEXT="order of fields doesn&apos;t matter">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360583211577" ID="ID_1789279333" MODIFIED="1360588242149" TEXT="Type">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360583444023" ID="ID_556999141" MODIFIED="1360588242149" TEXT="{f1 : t1, ..., fn : tn}">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360583719398" ID="ID_129562148" MODIFIED="1360588242149" TEXT="{id : int, name : string}">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360583312928" ID="ID_1531193735" MODIFIED="1360588242149" TEXT="access with #id recordname">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360583423248" ID="ID_1395071106" MODIFIED="1360588242149" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360583365232" ID="ID_736716949" MODIFIED="1360588242149" TEXT="{f1 = v1, ..., vn = vn}">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360583116851" ID="ID_1064907499" MODIFIED="1360588242149" TEXT="val x = {bar=exp, foo=exp2, baz=exp3">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360583223842" ID="ID_1754664636" MODIFIED="1360588242150" TEXT="{name = &quot;Amelia&quot;, id = 41123 -12}">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360583705741" ID="ID_796045829" MODIFIED="1360588242150" TEXT="Evaluates to">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360583650814" ID="ID_978213712" MODIFIED="1360588242150" TEXT="{id = 41111, name = &quot;Amelia&quot;}">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360583820245" ID="ID_1498434304" MODIFIED="1360588242150" TEXT="better for many fields use">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360582422871" ID="ID_343566070" MODIFIED="1360588242150" TEXT="tuples">
<arrowlink DESTINATION="ID_1724111495" ENDARROW="Default" ENDINCLINATION="91;0;" ID="Arrow_ID_29657031" STARTARROW="Default" STARTINCLINATION="91;0;"/>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360583810788" ID="ID_127722144" MODIFIED="1360588242150" TEXT="good for short fields">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360584077218" ID="ID_1758178047" MODIFIED="1360588242150" TEXT="syntactic sugar for records">
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="idea"/>
<node COLOR="#111111" CREATED="1360584246266" ID="ID_813579088" MODIFIED="1360588242150" TEXT="just a record with particular field names 1=e, 2=e, etc.">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360582485470" ID="ID_1230419323" MODIFIED="1360588242151" TEXT="One of">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360582438135" ID="ID_632169948" MODIFIED="1360591858366" TEXT="datatypes">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360591613215" ID="ID_1966307824" MODIFIED="1360591625190" TEXT="simlilar to enums in other languages">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360591626189" ID="ID_1476996650" MODIFIED="1360591704571" TEXT="examples">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360591704573" ID="ID_1689301236" MODIFIED="1360591727070" TEXT="datatype suit = Club | Diamond | Heart | Spade">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360591806453" ID="ID_219767132" MODIFIED="1360591815614" TEXT="this ex carries no data">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360591777564" ID="ID_278041945" MODIFIED="1360591796813" TEXT="datatype rank = Jack | Queen | King | Ace | Num of int">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360591817845" ID="ID_1102295326" MODIFIED="1360591836150" TEXT="this carries data via Num tag">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360592532647" ID="ID_1207811638" MODIFIED="1360592677007">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      datatype exp = Constant of int
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Negate&#160;&#160;&#160;&#160;of exp
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Add&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;of exp * exp
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Multiply&#160;&#160;&#160;of exp * exp
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360592570625" ID="ID_958071008" MODIFIED="1360592574160" TEXT="recursive">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360592677503" ID="ID_1918350055" MODIFIED="1360592928618" TEXT="defines a set of trees">
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="idea"/>
<node COLOR="#111111" CREATED="1360592929997" ID="ID_266085842" MODIFIED="1360592953871" TEXT="Add (Constant (10+9), Negate (Constant 4))">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360592884021" ID="ID_1140435824" MODIFIED="1360592889644">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="../../../Users/Denis/Pictures/trees.png" />
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360593056868" ID="ID_630326759" MODIFIED="1360593114415" TEXT="every value of type exp will have this tree shape">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360593766455" ID="ID_1125953356" MODIFIED="1360593769308" TEXT="Add">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360593770431" ID="ID_1185584026" MODIFIED="1360593774858" TEXT="Constant">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360593774860" ID="ID_478343470" MODIFIED="1360593777294" TEXT="19">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360593780262" ID="ID_1869297387" MODIFIED="1360593784541" TEXT="Negate">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360593785127" ID="ID_1113952280" MODIFIED="1360593788458" TEXT="Constant">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360593788461" ID="ID_1262335387" MODIFIED="1360593790698" TEXT="4">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360593144539" ID="ID_1729759036" MODIFIED="1360593153686" TEXT="this is a mini language actually">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360593153689" ID="ID_1894233083" MODIFIED="1360593282780">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun eval e =
    </p>
    <p>
      &#160;&#160;&#160;&#160;case e of
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Constant i&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;=&gt; i
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Negate e2&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;=&gt; ~ (eval e2)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Add (e1,e2)&#160;&#160;&#160;&#160;&#160;&#160;&#160;=&gt; (eval e1) + (eval e2)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Multiply (e1,e2) =&gt; (eval e1) * (eval e2)
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360593305217" ID="ID_165859709" MODIFIED="1360593312392" TEXT="function is recursive">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360593332426" ID="ID_66836282" MODIFIED="1360593356121" TEXT="this function takes any exp type and returns the value integer">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360593566736" ID="ID_1538131971" MODIFIED="1360593717534">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun number_of_adds e =
    </p>
    <p>
      &#160;&#160;&#160;&#160;case e of
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Constant i&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;=&gt; 0
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;| Negate e2&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;=&gt; number_of_adds e2
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;| Add(e1,e2)&#160;&#160;&#160;&#160;&#160;&#160;&#160;=&gt; 1 + number_of_adds e1 + number_of_adds e2
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;| Multiply(e1,e2)&#160;&#160;=&gt; number_of_ads e1 + number_of_adds e2
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360593721279" ID="ID_1682064347" MODIFIED="1360593731640" TEXT="counts number of adds used">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360593903022" ID="ID_1362927607" MODIFIED="1360593916605" TEXT="type: exp -&gt; int">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360591926051" ID="ID_4417475" MODIFIED="1360591933213" TEXT="defines a new type">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360768983264" ID="ID_211344416" MODIFIED="1360769022773" TEXT="only way to create values of that type are with its constructors">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360745123484" ID="ID_1419649173" MODIFIED="1360825751605" TEXT="Options">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360745126659" ID="ID_875676050" MODIFIED="1360745355647" TEXT="Building">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360745488594" ID="ID_1350462776" MODIFIED="1360745490927" TEXT="NONE">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360826179090" ID="ID_1452339101" MODIFIED="1360826185401" TEXT="are also constructors">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360745491441" ID="ID_282798554" MODIFIED="1360745496680" TEXT="SOME e">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360745368274" ID="ID_1491613061" MODIFIED="1360745443064" TEXT="Accessing">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360745443066" ID="ID_1368550309" MODIFIED="1360745447321" TEXT="isSome">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360745633353" ID="ID_553118774" MODIFIED="1360745640498" TEXT="&apos;a option -&gt; bool">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360745447809" ID="ID_954136172" MODIFIED="1360745452063" TEXT="valOf">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360745647145" ID="ID_1252245018" MODIFIED="1360745652142" TEXT="&apos;a option -&gt; &apos;a">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360745469618" ID="ID_954138893" MODIFIED="1360745472319" TEXT="Type">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360745472320" ID="ID_285654487" MODIFIED="1360745478351" TEXT="t option">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360582958115" ID="ID_1885709979" MODIFIED="1360825769444" TEXT="list">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360826238200" ID="ID_1766585519" MODIFIED="1360826258578" TEXT="[] and :: are constructors">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360826474967" ID="ID_32944554" MODIFIED="1360826524182">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun append (xs,ys) =
    </p>
    <p>
      &#160;&#160;case xs of
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;[ ] =&gt; ys
    </p>
    <p>
      &#160;&#160;&#160;&#160;| x::xs' =&gt; x::append(xs', ys)
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360592063531" ID="ID_44637022" MODIFIED="1360592079285" TEXT="avoid using each of types when one-of is better">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360592082490" ID="ID_550796314" MODIFIED="1360592148448">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      { student_num : int,
    </p>
    <p>
      first : string,
    </p>
    <p>
      middle : string option,
    </p>
    <p>
      last : string }
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360592158250" ID="ID_806060225" MODIFIED="1360592169586" TEXT="bad style">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360592214256" ID="ID_105612347" MODIFIED="1360592230836" TEXT="use the student_num and ignore other fields unless the student_num is ~1">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360592247138" ID="ID_1990641509" MODIFIED="1360592267057" TEXT="gives up the benefits of the variant checking">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360592343272" ID="ID_1400175126" MODIFIED="1360592405473">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      datatype exp = Constant of int
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Negate of exp
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Add of exp * exp
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Multiply of exp * exp
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360582490854" ID="ID_1635824615" MODIFIED="1360588242151" TEXT="Self reference">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360582962563" ID="ID_1335556200" MODIFIED="1360588242151" TEXT="list">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360583868766" ID="ID_1314123902" MODIFIED="1360588242151" TEXT="construct to refer to by position or field">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360769056452" ID="ID_1668060154" MODIFIED="1360769063247" TEXT="Synonym">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360769063249" ID="ID_508139835" MODIFIED="1360769066740" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360769066742" ID="ID_1740073936" MODIFIED="1360769084012" TEXT="type aname = t">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360769374292" ID="ID_1999183569" MODIFIED="1360769390840" TEXT="convenient to shorten things">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360769395431" ID="ID_1888351221" MODIFIED="1360769407291" TEXT="type card = suit * rank">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360033161821" ID="ID_719263836" MODIFIED="1360947548827">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Abstract types and modules
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="12"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360947315278" ID="ID_580598614" MODIFIED="1360947548828" TEXT="signatures">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360947332046" ID="ID_891888620" MODIFIED="1360947368376">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      signature SIGNAME =
    </p>
    <p>
      sig types-for-bindings end
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360947377502" ID="ID_512168092" MODIFIED="1360947386190" TEXT="ALLCAPS convention">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360947431406" ID="ID_1345786230" MODIFIED="1360947436545" TEXT="ascribing">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360947436546" ID="ID_1719900137" MODIFIED="1360947465788">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      structure MyModule :&gt; SIGNAME =
    </p>
    <p>
      struct bindings end
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360952643801" ID="ID_1073055056" MODIFIED="1360952651912" TEXT="ADT">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360947711444" ID="ID_184764059" MODIFIED="1360947745644" TEXT="hides binding and types">
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="idea"/>
</node>
<node COLOR="#111111" CREATED="1360952656481" ID="ID_190471114" MODIFIED="1360952669161" TEXT="you can know something exists but you can&apos;t know it definition">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360952706289" ID="ID_862633544" MODIFIED="1360952710201" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360952717392" ID="ID_1663777292" MODIFIED="1360952727357">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <b>type</b>&#160;rational
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360953291628" ID="ID_1610655314" MODIFIED="1360953449432" TEXT="2 key restrictions">
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="yes"/>
<node COLOR="#111111" CREATED="1360953264629" ID="ID_1662432222" MODIFIED="1360953441499" TEXT="deny bindings exist">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360953278060" ID="ID_1228057586" MODIFIED="1360953442347" TEXT="make types abstract">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360953310084" ID="ID_1136808601" MODIFIED="1360953332512" TEXT="clients cannot create values of them">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360953333068" ID="ID_1222241024" MODIFIED="1360953338426" TEXT="can&apos;t access their pieces directly">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360949493839" ID="ID_1365314141" MODIFIED="1360949498806" TEXT="invariants">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360949498807" ID="ID_869804330" MODIFIED="1360949515610" TEXT="control what can be inputted from the outside">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360949520951" ID="ID_647044355" MODIFIED="1360949535915" TEXT="functions rely on these conditions to function correctly">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360033161910" ID="ID_581777638" MODIFIED="1360952976597" STYLE="fork">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Bindings
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="12"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360238393585" ID="ID_440021972" MODIFIED="1360588242140" TEXT="can&apos;t use later bindings">
<font NAME="Verdana" SIZE="12"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360247473754" ID="ID_1381026485" MODIFIED="1360829081807">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <font size="13px" color="rgb(0, 0, 0)" face="sans-serif"><span class="Apple-converted-space">&#160;</span><span style="display: inline !important; font-family: sans-serif; float: none; line-height: 19.1875px; white-space: normal; font-weight: normal; word-spacing: 0px; font-size: 13px; font-variant: normal; background-color: rgb(255, 255, 255); text-transform: none; font-style: normal; color: rgb(0, 0, 0); letter-spacing: normal; text-align: start; text-indent: 0px">the association of objects (data and/or code) with</span><span class="Apple-converted-space">&#160;</span></font><u><font size="13px" face="sans-serif" color="rgb(11, 0, 128)"><a href="http://en.wikipedia.org/wiki/Identifier" style="font-family: sans-serif; background-position: initial initial; background-repeat: repeat; line-height: 19.1875px; white-space: normal; font-weight: normal; text-decoration: underline; font-size: 13px; word-spacing: 0px; font-variant: normal; background-color: rgb(255, 255, 255); background-image: none; text-transform: none; font-style: normal; color: rgb(11, 0, 128); letter-spacing: normal; text-align: start; text-indent: 0px" title="Identifier">identifiers</a></font></u><span style="font-family: sans-serif; display: inline !important; float: none; line-height: 19.1875px; white-space: normal; font-weight: normal; font-size: 13px; word-spacing: 0px; font-variant: normal; background-color: rgb(255, 255, 255); text-transform: none; font-style: normal; color: rgb(0, 0, 0); letter-spacing: normal; text-align: start; text-indent: 0px"><font size="13px" face="sans-serif" color="rgb(0, 0, 0)">.</font></span><span><sup id="cite_ref-tkac08_1-0" class="reference" style="font-family: sans-serif; line-height: 1em; white-space: normal; font-weight: normal; word-spacing: 0px; font-variant: normal; background-color: rgb(255, 255, 255); text-transform: none; font-style: normal; color: rgb(0, 0, 0); letter-spacing: normal; text-align: start; text-indent: 0px"><font face="sans-serif" color="rgb(11, 0, 128)"><a href="http://en.wikipedia.org/wiki/Name_binding#cite_note-tkac08-1" style="background-position: initial initial; background-repeat: repeat; white-space: nowrap; text-decoration: initial; background-image: none; color: rgb(11, 0, 128)">[</a></font></sup></span>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360247858091" ID="ID_1626569086" MODIFIED="1360588242140" TEXT="Kinds of Bindings">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360238387315" ID="ID_1088836687" LINK="#ID_1239226852" MODIFIED="1360953110045">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      functions
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="yes"/>
</node>
<node COLOR="#111111" CREATED="1360238387325" ID="ID_1878771626" MODIFIED="1360588242142">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      records
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360289520688" ID="ID_516240198" MODIFIED="1360588242142" TEXT="Variables">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360358207226" ID="ID_1601402434" MODIFIED="1360588242142" TEXT="binding evaluates its expression when the binding is evaluated not every time it is used">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360585685879" ID="ID_1056292024" MODIFIED="1360588242143" TEXT="Datatype">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360586640553" ID="ID_1793352456" MODIFIED="1360588242143" TEXT="Building">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360585966502" ID="ID_1717065222" MODIFIED="1360588242143">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      datatype mytype = TwoInts of int * int
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Str of string
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Pizza
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360586358795" ID="ID_1409066586" MODIFIED="1360588242143" TEXT="any value of type mytype is made from one of the constructors">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360586388467" ID="ID_447604245" MODIFIED="1360588242143" TEXT="Constructors">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360586088974" ID="ID_1272880046" MODIFIED="1360588242143" TEXT="TwoInts : int * int -&gt; mytype">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360586123597" ID="ID_1305304219" MODIFIED="1360588242144" TEXT="Str : string -&gt; mytype">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360586132092" ID="ID_180304570" MODIFIED="1360588242144" TEXT="Pizza : mytype">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360585772170" ID="ID_1332315139" MODIFIED="1360588242144" TEXT="Constructors aka tags">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360585786070" ID="ID_988150779" MODIFIED="1360588242144" TEXT="Capitalized">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360585864039" ID="ID_1634133314" MODIFIED="1360588242144" TEXT="is either">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360585831071" ID="ID_1816759760" MODIFIED="1360588242144" TEXT="a function that makes values of the new type">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360585883711" ID="ID_1343960199" MODIFIED="1360588242145" TEXT="or a value of the new type">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360585957678" ID="ID_183307320" MODIFIED="1360588242145" TEXT="can be named anything">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360594814175" ID="ID_1548837243" MODIFIED="1360594840475" TEXT="Syntax: datatype t = C1 of t1 | C2 of t2 | ... | Cn of tn">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360595060726" ID="ID_923286670" MODIFIED="1360595081837" TEXT="adds type t and constructors Ci of type ti -&gt; t">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360595081838" ID="ID_1131886673" MODIFIED="1360595101052" TEXT="Ci v is a value ie the result includes the tag">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360586644760" ID="ID_882539264" MODIFIED="1360588242145" TEXT="Access">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360595324316" ID="ID_1461513027" MODIFIED="1360595415580" TEXT="Case Expression">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360586665089" ID="ID_1905638132" MODIFIED="1360588242145" TEXT="check what variant it is (what constructor made it)">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360586682216" ID="ID_764239212" MODIFIED="1360595339316" TEXT="extract the data (if that variant has any)">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360033161829" ID="ID_1647647581" MODIFIED="1360743940577">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      polymorphic
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360286762451" ID="ID_53631507" MODIFIED="1360588242140" TEXT="inferred based on how arguments are used">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360738911713" ID="ID_373043331" MODIFIED="1360738915845" TEXT="Key Steps">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360738915848" ID="ID_1289842441" MODIFIED="1360738925649" TEXT="determine types of bindings in order">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360738934104" ID="ID_556883977" MODIFIED="1360738941987" TEXT="except mutual recursion">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360738942399" ID="ID_882214009" MODIFIED="1360738974653" TEXT="cannot use later bindings: won&apos;t type check">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360739479332" ID="ID_149420451" MODIFIED="1360739487866" TEXT="collect all the facts for type checking">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360739488276" ID="ID_1172906432" MODIFIED="1360739509984" TEXT="facts constrain the type of the function">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360739330405" ID="ID_805733825" MODIFIED="1360739342353" TEXT="it can infer types with type variables">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360739343084" ID="ID_950293588" MODIFIED="1360739352295" TEXT="great for code reuse and understanding functions">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360245509490" ID="ID_1360587793" MODIFIED="1360680117673" TEXT="REPL">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360245516195" ID="ID_1952172383" MODIFIED="1360588242146" TEXT="Error Messages">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360245559135" ID="ID_818101232" MODIFIED="1360588242146" TEXT="use command">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360245569762" ID="ID_932035963" MODIFIED="1360588242146" TEXT="types in the file&apos;s bindings line by line">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360245651767" ID="ID_1635382740" MODIFIED="1360588242146">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Read, Eval, Print, Loop
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360245781759" ID="ID_926846695" MODIFIED="1360588242146" TEXT="always restart the REPL C-d">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360295024160" ID="ID_738944707" MODIFIED="1360588242147" TEXT="never parentheses it doesn&apos;t have to">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360366734757" ID="ID_92543980" MODIFIED="1360680117674" TEXT="Idioms">
<font NAME="Georgia" SIZE="16"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360366718390" ID="ID_1252997074" MODIFIED="1360588242147" TEXT="infix">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360366907140" ID="ID_1988508449" MODIFIED="1360588242147" TEXT="o">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360366910812" ID="ID_1165531687" MODIFIED="1360588242147" TEXT="combines functions">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360590399767" ID="ID_224017698" MODIFIED="1360680117683" TEXT="Pattern Matching">
<font NAME="Georgia" SIZE="16"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360589326129" ID="ID_125697976" MODIFIED="1360595415579" TEXT="Case Expression">
<arrowlink DESTINATION="ID_1461513027" ENDARROW="Default" ENDINCLINATION="1325;0;" ID="Arrow_ID_661892248" STARTARROW="Default" STARTINCLINATION="1325;0;"/>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360595440499" ID="ID_1603042469" MODIFIED="1360595442262" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360589991162" ID="ID_587766825" MODIFIED="1360590065659">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      case <b>e0</b>&#160;of
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<b>p1</b>&#160;=&gt; e1
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;| <b>p2</b>&#160;=&gt; e2
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;...
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;| <b>pn</b>&#160;=&gt; en
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360589539925" ID="ID_702930895" MODIFIED="1360589754245">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun f x =&#160;(* f has type mytype -&gt; int *)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;case x of
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Pizza =&gt; 3
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| TwoInts(i1,i2) =&gt; i1+i2
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;| Str s =&gt; String.size s
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360589756291" ID="ID_1600129935" MODIFIED="1360589766823" TEXT="Type-checking">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360589767211" ID="ID_28393341" MODIFIED="1360589774777" TEXT="all branches must have same type">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360589808074" ID="ID_125029325" MODIFIED="1360589824485" TEXT="x is an expression. you evaluate the exp and match it">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360595677378" ID="ID_1195508857" MODIFIED="1360595702782" TEXT="1. evaluate e to a value (v)">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360595703536" ID="ID_22998486" MODIFIED="1360595737654" TEXT="2. if pi is the first pattern to match v then result is evaluation of ei in env &quot;extended by the match&quot;">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360595754240" ID="ID_1145353774" MODIFIED="1360595807801" TEXT="Pattern Ci (x1, ..., xn) matches value Ci(v1, ..., vn) and extends the env with x1 to v1 ... xn to vn">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360595820832" ID="ID_1512955465" MODIFIED="1360595840235" TEXT="for &quot;no data&quot; constructors, pat Ci matches value Ci">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360589374050" ID="ID_451320586" MODIFIED="1360589390724" TEXT="keywords">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360589390725" ID="ID_970839562" MODIFIED="1360589392042" TEXT="key">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360589394062" ID="ID_1439296718" MODIFIED="1360589394864" TEXT="of">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360590171376" ID="ID_159769859" MODIFIED="1360590175877" TEXT="Patterns">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360590175878" ID="ID_754043053" MODIFIED="1360590179732" TEXT="are not expressions">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360590184784" ID="ID_789078591" MODIFIED="1360590216290" TEXT="Constructor name followed by the right number of variables">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360595502907" ID="ID_802110630" MODIFIED="1360595526372" TEXT="can use anywhere an expression goes">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360595526375" ID="ID_742897915" MODIFIED="1360595539554" TEXT="does not need to be the whole function body">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360590981210" ID="ID_1099880790" MODIFIED="1360590988433" TEXT="Benefits">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360590989938" ID="ID_74206002" MODIFIED="1360591232683" TEXT="cannot forget a case">
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="yes"/>
<node COLOR="#111111" CREATED="1360591488672" ID="ID_1683160984" MODIFIED="1360597817602" TEXT="Warning: match nonexhaustive">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360597892098" ID="ID_111403440" MODIFIED="1360597922995" TEXT="if you try and match a variant not specified you will get an error">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360597931778" ID="ID_857006923" MODIFIED="1360597953194" TEXT="uncaught exception Match [nonexhaustive match failure]">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360590995874" ID="ID_1123648482" MODIFIED="1360591237580" TEXT="cannot duplicate a case">
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="yes"/>
<node COLOR="#111111" CREATED="1360591197575" ID="ID_191348077" MODIFIED="1360597750441" TEXT="Error: match redundant">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360591151518" ID="ID_844676026" MODIFIED="1360591156632" TEXT="compile time error">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360591001691" ID="ID_1700323265" MODIFIED="1360595369389" TEXT="will not forget to test the variant correctly and get an exception (like hd [])">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360591023506" ID="ID_618544865" MODIFIED="1360591059334" TEXT="can be generalized and made more powerful, leading to elegant and concise code">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360766956778" ID="ID_885654680" MODIFIED="1360766960895" TEXT="Module">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360817162697" ID="ID_1320829544" MODIFIED="1360817166965" TEXT="Signature">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360817166967" ID="ID_159757941" MODIFIED="1360817175704" TEXT="type for a module">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360817204505" ID="ID_1773003235" MODIFIED="1360820976274" TEXT="hide bindings inside module">
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="idea"/>
<node COLOR="#111111" CREATED="1360820853175" ID="ID_319478701" MODIFIED="1360821001782" TEXT="Deny bindings exist">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360820861007" ID="ID_59743180" MODIFIED="1360821001239" TEXT="Make types abstract">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360820883684" ID="ID_315202491" MODIFIED="1360820899964" TEXT="clients cannot create values of them or acces their pieces directly">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360821804657" ID="ID_1228877938" MODIFIED="1360821819290" TEXT="allow different implementations to be equivalent">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360821819291" ID="ID_562118247" MODIFIED="1360821828842" TEXT="no client can tell which you are using">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360821829168" ID="ID_1918640667" MODIFIED="1360821837948" TEXT="can improve/replace/choose implementations later">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360821838616" ID="ID_1711039760" MODIFIED="1360821852975" TEXT="easier to do if you start with more abstract sigs">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1360817260792" ID="ID_300095280" MODIFIED="1360817268209" TEXT="conventional to use ALLCAPS">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360817398407" ID="ID_560182310" MODIFIED="1360817401200" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360817401203" ID="ID_108708681" MODIFIED="1360817447975">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      signature SIGNAME =
    </p>
    <p>
      sig types-for-bindings end
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360817865653" ID="ID_1458355106" MODIFIED="1360819953403" TEXT="can define the signature seperately then ascribe to the module">
<arrowlink DESTINATION="ID_339792833" ENDARROW="Default" ENDINCLINATION="299;0;" ID="Arrow_ID_1619132517" STARTARROW="None" STARTINCLINATION="67;0;"/>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360817458735" ID="ID_1927039546" MODIFIED="1360819939932" TEXT="ascribing">
<cloud/>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360817462037" ID="ID_339792833" MODIFIED="1360819953403">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      structure MyModule :&gt; SIGNAME =
    </p>
    <p>
      struct bindings end
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#cc0000" CREATED="1359982527259" ID="ID_628526100" MODIFIED="1361215280588">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="../../../Users/Denis/Pictures/racketicon.png" />
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1361213047727" ID="ID_118042513" MODIFIED="1361213085904" TEXT="Tools &amp; Resources">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1361213062374" ID="ID_1336801006" MODIFIED="1361213065733" TEXT="DrRacket">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361213133789" ID="ID_352459336" MODIFIED="1361213143004" TEXT="ctrl-e">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361213157149" ID="ID_612199545" MODIFIED="1361213166452" TEXT="#lang racket">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361213173749" ID="ID_911143548" MODIFIED="1361213188278" TEXT="(provide (all-defined-out))">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1361213085907" ID="ID_1115107937" MODIFIED="1361213103949" TEXT="http://racket-lang.org">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361392790065" ID="ID_1089446823" MODIFIED="1361392793105" TEXT="REPL">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361392793107" ID="ID_441261280" MODIFIED="1361392799144" TEXT="doesn&apos;t work the same as ML">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361392799857" ID="ID_1714370744" MODIFIED="1361392809619" TEXT="don&apos;t define recursive functions">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1361213812688" ID="ID_584791204" MODIFIED="1361213815567" TEXT="Constructs">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1361213633729" ID="ID_1022175165" MODIFIED="1361213638018" TEXT="functions">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361213663145" ID="ID_1966937439" MODIFIED="1361213669927" TEXT="anonymous function">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361213669928" ID="ID_921296512" MODIFIED="1361213711734">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      (lambda (x)
    </p>
    <p>
      &#160;&#160;expression)
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361213911584" ID="ID_1241237084" MODIFIED="1361213991438">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      (define cube
    </p>
    <p>
      &#160;&#160;(lambda (x)
    </p>
    <p>
      &#160;&#160;&#160;&#160;(* x x x)))
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361213994432" ID="ID_516171550" MODIFIED="1361214027229">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      (define (cube x)
    </p>
    <p>
      &#160;&#160;(* x x x))
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1361213145621" ID="ID_1460225780" MODIFIED="1361213824612" TEXT="Syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361213638021" ID="ID_1726317367" MODIFIED="1361311761600">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      (<b>define</b>&#160;(name x y z)
    </p>
    <p>
      &#160;&#160;body)
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361213837352" ID="ID_1296834166" MODIFIED="1361213856569" TEXT="can take any number of arguments">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361213856571" ID="ID_908913043" MODIFIED="1361213866230" TEXT="ex. (define x x x x)">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361465188612" ID="ID_1576339408" MODIFIED="1361465194290" TEXT="(name)">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361465194293" ID="ID_711292885" MODIFIED="1361465201525" TEXT="zero arg function call">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1361465287795" ID="ID_1752894232" MODIFIED="1361465611158" TEXT="thunk">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361465306140" ID="ID_1517342649" MODIFIED="1361465316674" TEXT="put expr in a func">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361465447427" ID="ID_182178745" MODIFIED="1361465450206" TEXT="syntax">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361465450207" ID="ID_1762219172" MODIFIED="1361465477646">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      (define (my-if x y z)
    </p>
    <p>
      &#160;&#160;(if x (y) (z)))
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1361465611160" ID="ID_561113504" MODIFIED="1361465619306" TEXT="definition">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361465619308" ID="ID_632022204" MODIFIED="1361465636839" TEXT="a zero-arg function sed to delay evaluation">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1361213149367" ID="ID_885590312" MODIFIED="1361213151640" TEXT="comment">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361213151642" ID="ID_1087799507" MODIFIED="1361213154345" TEXT=";">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361569848429" ID="ID_1841971286" MODIFIED="1361569851297" TEXT="single line">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1361569854494" ID="ID_1951178778" MODIFIED="1361569871795">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <b>#|</b>&#160;... <b>|#</b>
    </p>
  </body>
</html>
</richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361569873926" ID="ID_892570320" MODIFIED="1361569878069" TEXT="multi line">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1361214101054" ID="ID_1628152059" MODIFIED="1361214106079" TEXT="conditional">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361214106081" ID="ID_4294159" MODIFIED="1361214176644">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      (define (pow x y)
    </p>
    <p>
      &#160;&#160;(if (= y 0)
    </p>
    <p>
      &#160;&#160;&#160;&#160;1
    </p>
    <p>
      &#160;&#160;&#160;&#160;(* x&#160;&#160;(pow1 x (- y 1)))))
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361360418282" ID="ID_1747679959" MODIFIED="1361360424255" TEXT="nested">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361360424256" ID="ID_1889824301" MODIFIED="1361360427402" TEXT="cond">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361366315516" ID="ID_1728505341" MODIFIED="1361366381635">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      (<b>cond</b>&#160;<b>[</b>#t 1<b>]</b>
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<b>[</b>#f 0<b>]</b>)
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361366386380" ID="ID_1804583963" MODIFIED="1361366404665" TEXT="base case should be true or there will be weirdness">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1361214489212" ID="ID_1626195525" MODIFIED="1361214492662" TEXT="Lists">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361214492664" ID="ID_269668932" MODIFIED="1361214495908" TEXT="empty list">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361214495910" ID="ID_303060031" MODIFIED="1361214497114" TEXT="null">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361214538379" ID="ID_1092682797" MODIFIED="1361214543813" TEXT="boolean">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361214543816" ID="ID_1546041768" MODIFIED="1361214547078" TEXT="null?">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1361214499500" ID="ID_1248674795" MODIFIED="1361214506004" TEXT="cons constructor">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361214506006" ID="ID_1385459930" MODIFIED="1361214507347" TEXT="cons">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1361214561355" ID="ID_1511255664" MODIFIED="1361214569733" TEXT="Build">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361214569735" ID="ID_58171586" MODIFIED="1361214713312">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      (<b>list</b>&#160;e1 ... en)
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361215074144" ID="ID_1443562572" MODIFIED="1361215084655" TEXT="&gt; &apos;(e1 ... en)">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1361368075368" ID="ID_1338181334" MODIFIED="1361368078766" TEXT="Access">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361368078768" ID="ID_1957608062" MODIFIED="1361368101116">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      (<b>list-ref</b>&#160;xs index)
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1361214524550" ID="ID_1125213282" MODIFIED="1361567626974" TEXT="car">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361214521819" ID="ID_380724800" MODIFIED="1361214524548" TEXT="head">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1361214530279" ID="ID_591672254" MODIFIED="1361567629557" TEXT="cdr">
<font BOLD="true" NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361214527387" ID="ID_301488334" MODIFIED="1361214530277" TEXT="tail">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1361310556531" ID="ID_1039511025" MODIFIED="1361310558006" TEXT="term">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361310561995" ID="ID_1115366604" MODIFIED="1361567625224" TEXT="atom">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361310565327" ID="ID_364452537" MODIFIED="1361310572827" TEXT="#f">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361310574179" ID="ID_1051742414" MODIFIED="1361310576140" TEXT="#t">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361310578971" ID="ID_25645118" MODIFIED="1361310580578" TEXT="34">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361310581108" ID="ID_570482827" MODIFIED="1361310583294" TEXT="&quot;hi&quot;">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361310583836" ID="ID_318396707" MODIFIED="1361310585574" TEXT="null">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361310586027" ID="ID_1302780171" MODIFIED="1361310591229" TEXT="4.0">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361310592267" ID="ID_22383037" MODIFIED="1361310593445" TEXT="x">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1361310596187" ID="ID_97735144" MODIFIED="1361310602155" TEXT="special form">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361310602158" ID="ID_308943955" MODIFIED="1361310610834" TEXT="define">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361310611091" ID="ID_1955754352" MODIFIED="1361310612961" TEXT="lambda">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361310613203" ID="ID_688647291" MODIFIED="1361310613858" TEXT="if">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1361310624635" ID="ID_1459962543" MODIFIED="1361310649244" TEXT="sequence">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1361390984326" ID="ID_585659305" MODIFIED="1361390986231" TEXT="Let">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361390986233" ID="ID_808162921" MODIFIED="1361390990384" TEXT="let*">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361390990386" ID="ID_913212329" MODIFIED="1361391027547" TEXT="similar to ML">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1361390998630" ID="ID_1033250598" MODIFIED="1361391000639" TEXT="let">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361391000641" ID="ID_58432391" MODIFIED="1361391021263" TEXT="use environment before the let">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1361391120557" ID="ID_710603717" MODIFIED="1361391124301" TEXT="letrec">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361391124303" ID="ID_821188017" MODIFIED="1361391127997" TEXT="mutually recursive">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1361391373035" ID="ID_1447694415" MODIFIED="1361391379224" TEXT="local defines">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361391379226" ID="ID_1825724125" MODIFIED="1361391385563" TEXT="similar to letrec">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1361392610242" ID="ID_512478265" MODIFIED="1361392619683" TEXT="Top-level bindings">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1361214757386" ID="ID_1683768944" MODIFIED="1361214765769" TEXT="Style">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1361214765776" ID="ID_499362302" MODIFIED="1361214773963" TEXT="dash names">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361214773966" ID="ID_1608958859" MODIFIED="1361214777030" TEXT="my-append">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1361310787234" ID="ID_97102336" MODIFIED="1361310807221" TEXT="[ ] and ( ) are interchangeable but have conventions">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#cc0000" CREATED="1359982533086" FOLDED="true" ID="ID_56951974" MODIFIED="1361216312572">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="../../../Users/Denis/Pictures/ruby.png" />
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360033161751" ID="ID_908277988" MODIFIED="1360680117687">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Ruby basics
      </li>
    </ul>
  </body>
</html></richcontent>
<font NAME="Georgia" SIZE="16"/>
</node>
</node>
</node>
<node COLOR="#0033ff" CREATED="1359982430628" HGAP="68" ID="ID_1435228231" MODIFIED="1361466063477" POSITION="left" VSHIFT="-156">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Master language
    </p>
    <p>
      concepts and
    </p>
    <p>
      recognize them in
    </p>
    <p>
      strange guises
    </p>
  </body>
</html></richcontent>
<edge STYLE="sharp_bezier" WIDTH="8"/>
<font NAME="Georgia" SIZE="30"/>
<node COLOR="#cc0000" CREATED="1360033161903" ID="ID_1238292414" MODIFIED="1360680117632">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Recursive functions and recursive types
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360033161882" ID="ID_944928480" MODIFIED="1361153175607">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Tail recursion
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1361153179504" ID="ID_584624828" MODIFIED="1361213057207" TEXT="no more work to be done">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360248940034" ID="ID_1554032695" MODIFIED="1360680117633" TEXT="more powerful than loops">
<font NAME="Georgia" SIZE="16"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360735663831" ID="ID_576027498" MODIFIED="1360735689059" TEXT="Functions over lists are usually recursive">
<font NAME="Georgia" SIZE="16"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360735689726" ID="ID_1056457259" MODIFIED="1360735700601" TEXT="The way to construct them">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360735700602" ID="ID_252875344" MODIFIED="1360735712066" TEXT="What should be the answer for the empty list">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360735712566" ID="ID_1416443954" MODIFIED="1360735726089" TEXT="What should be the answer for the non empty list?">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1361153196103" ID="ID_410397113" MODIFIED="1361213057212" TEXT="mutual recursion">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1361153761548" ID="ID_1311262905" MODIFIED="1361213057215">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      fun
    </p>
    <p>
      and
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#cc0000" CREATED="1360033161888" ID="ID_1008572280" MODIFIED="1360680117633">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Algebraic datatypes
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#cc0000" CREATED="1360033161846" ID="ID_1329948428" MODIFIED="1360680117633">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Equivalence and effects
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360858439991" ID="ID_1473889371" MODIFIED="1360858499303" TEXT="thniking about this all the time refactoring">
<font NAME="Georgia" SIZE="16"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360858523770" ID="ID_277581739" MODIFIED="1360858531750" TEXT="code maintenance">
<font NAME="Georgia" SIZE="16"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360858532169" ID="ID_1460843692" MODIFIED="1360858546794" TEXT="backward compatibility">
<font NAME="Georgia" SIZE="16"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360858547211" ID="ID_1515514353" MODIFIED="1360858552342" TEXT="optimization">
<font NAME="Georgia" SIZE="16"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360858552828" ID="ID_901101624" MODIFIED="1360858556566" TEXT="abstraction">
<font NAME="Georgia" SIZE="16"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360858699800" ID="ID_1911331014" MODIFIED="1360858702538" TEXT="definition">
<font NAME="Georgia" SIZE="16"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1360858657318" ID="ID_1883134132" MODIFIED="1360858705936" TEXT="two functions are quivalent if they have the sam observable behaviour no matter how they are used anywhere in any program">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360858730854" ID="ID_907941518" MODIFIED="1360858741812" TEXT="produce quivalent results">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360858742148" ID="ID_1307688729" MODIFIED="1360858751240" TEXT="have the same termination behaviour">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360858751506" ID="ID_393853655" MODIFIED="1360858759440" TEXT="mutate memory in the same way">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360858759964" ID="ID_742094722" MODIFIED="1360858768453" TEXT="do the same input/output">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360858768962" ID="ID_1582902431" MODIFIED="1360858780840" TEXT="raise the same exceptions">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360860062289" ID="ID_600181624" MODIFIED="1360860067016" TEXT="types">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360860067018" ID="ID_1177134492" MODIFIED="1360860084671" TEXT="PL equivalence">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360860085178" ID="ID_872980621" MODIFIED="1360860091665" TEXT="asymptotic">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360860092508" ID="ID_264437291" MODIFIED="1360860095855" TEXT="systems">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360858838931" ID="ID_1255588819" MODIFIED="1360858853041" TEXT="easier to be equivalent if">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360858853043" ID="ID_1386209539" MODIFIED="1360858882788" TEXT="there are fewer possible arguments with a type sys and abstraction">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360858883195" ID="ID_1903740219" MODIFIED="1360858891391" TEXT="avoid side effects">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1360858891392" ID="ID_1583144428" MODIFIED="1360858894810" TEXT="mutation">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360858895306" ID="ID_1653857478" MODIFIED="1360858900694" TEXT="input/output">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360858902857" ID="ID_393038812" MODIFIED="1360858906498" TEXT="exceptions">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1360859161145" ID="ID_365240930" MODIFIED="1360859176457" TEXT="functional programming has advantages">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360859234217" ID="ID_394402813" MODIFIED="1360859242760" TEXT="standard equivalences">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360859242761" ID="ID_571344955" MODIFIED="1360859256586" TEXT="syntactic sugar">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360859257063" ID="ID_688132982" MODIFIED="1360859356569" TEXT="consistently rename bound vars and uses">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360859521257" ID="ID_792228784" MODIFIED="1360859531271" TEXT="use a helper function or do not">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360859656865" ID="ID_1746096482" MODIFIED="1360859667225" TEXT="unecessary function wrapping">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360859893959" ID="ID_1785466087" MODIFIED="1360859899112" TEXT="beware shadowing">
<font NAME="Georgia" SIZE="16"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360860039498" ID="ID_1812417200" MODIFIED="1360860050326" TEXT="doesn&apos;t take into account performance">
<font NAME="Georgia" SIZE="16"/>
</node>
</node>
<node COLOR="#cc0000" CREATED="1360033161837" ID="ID_1097045453" MODIFIED="1360680117633">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Parametric polymorphism and container types
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#cc0000" CREATED="1360033161800" ID="ID_1314280091" MODIFIED="1360680500545">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Dynamic vs. static typing
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1361318675226" ID="ID_1887743364" MODIFIED="1361318679106" TEXT="dynamic">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1361318679108" ID="ID_1919744395" MODIFIED="1361318685385" TEXT="no type checking">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361318697114" ID="ID_1771731683" MODIFIED="1361318789734" TEXT="won&apos;t see type errors until the code is run">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1361318688450" ID="ID_217291635" MODIFIED="1361318694636" TEXT="static">
<font NAME="Georgia" SIZE="16"/>
</node>
</node>
<node COLOR="#cc0000" CREATED="1360033161784" ID="ID_431220756" MODIFIED="1360680117634">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Implementing languages, especially higher-order functions
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#cc0000" CREATED="1360033161775" ID="ID_722622727" MODIFIED="1360680117634">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Macros
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#cc0000" CREATED="1360033161758" ID="ID_1994567019" MODIFIED="1361318112838">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Abstract types via dynamic type-creation and simple contracts
    </p>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#cc0000" CREATED="1360033161745" ID="ID_1777262570" MODIFIED="1360680117635">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Object-oriented programming is dynamic dispatch
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#cc0000" CREATED="1360033161738" ID="ID_1336278848" MODIFIED="1360680117635">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Pure object-orientation
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#cc0000" CREATED="1360033161731" ID="ID_783333515" MODIFIED="1360680117636">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Implementing dynamic dispatch
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#cc0000" CREATED="1360033161724" ID="ID_1277941858" MODIFIED="1360680117636">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Multiple inheritance, interfaces, and mixins
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#cc0000" CREATED="1360033161718" ID="ID_1791557834" MODIFIED="1360680117636">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        OO vs. functional decomposition and extensibility
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#cc0000" CREATED="1360033161711" ID="ID_551832753" MODIFIED="1360680117636">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Subtyping for records, functions, and objects
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#cc0000" CREATED="1360033161704" ID="ID_139630241" MODIFIED="1360680117637">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Class-based subtyping
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#cc0000" CREATED="1360033161697" ID="ID_192820981" MODIFIED="1360680117637">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Subtyping
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#cc0000" CREATED="1360033161683" ID="ID_541734409" MODIFIED="1360680117637">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <ul style="font-style: normal; color: rgb(51, 51, 51); text-transform: none; padding-bottom: 0px; margin-right: 0px; font-size: 14.44444465637207px; line-height: 20.98958396911621px; white-space: normal; margin-left: 25px; margin-top: 0px; font-variant: normal; text-align: start; background-color: rgb(255, 255, 255); text-indent: 0px; margin-bottom: 10.5px; letter-spacing: normal; font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; padding-left: 0px; padding-top: 0px; padding-right: 0px; word-spacing: 0px">
      <li style="line-height: 21px">
        Subtyping vs. parametric polymorphism; bounded polymorphism
      </li>
    </ul>
  </body>
</html></richcontent>
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#cc0000" CREATED="1360584327714" ID="ID_1185248730" MODIFIED="1360680117638" TEXT="Syntactic Sugar">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360584337235" ID="ID_622121463" MODIFIED="1360680117638" TEXT="Syntactic">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360584345553" ID="ID_901369877" MODIFIED="1360588242105" TEXT="Can describe the semantics entirely by the corresponding record syntax">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360584372833" ID="ID_1185592668" MODIFIED="1360680117638" TEXT="Sugar">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360584377645" ID="ID_1287383500" MODIFIED="1360588242105" TEXT="Makes the language easier to use">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1360584473056" ID="ID_646389465" MODIFIED="1360680117639" TEXT="simplifies">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1360584482580" ID="ID_469398837" MODIFIED="1360588242106" TEXT="understanding the language">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1360584491576" ID="ID_1123960679" MODIFIED="1360588242106" TEXT="implementing the language">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#cc0000" CREATED="1360764150112" ID="ID_220468747" MODIFIED="1360764159786" TEXT="State machine">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
</node>
<node COLOR="#cc0000" CREATED="1361464872551" ID="ID_633769159" MODIFIED="1361464878869" TEXT="Delayed evaluation">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1361466109358" ID="ID_1337077646" MODIFIED="1361466111535" TEXT="thunks">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1361466111537" ID="ID_1710237344" MODIFIED="1361466122199" TEXT="let you skip an expensive computation if you don&apos;t need it">
<font NAME="Verdana" SIZE="12"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#111111" CREATED="1361565686515" ID="ID_25033048" MODIFIED="1361565711009" TEXT="stream">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361565689862" ID="ID_173179209" MODIFIED="1361570589884" TEXT="a thunk that when called produces a pair">
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="idea"/>
</node>
<node COLOR="#111111" CREATED="1361566387446" ID="ID_790853607" MODIFIED="1361566389667" TEXT="The pair contains a value and the rest of the stream">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361570560376" ID="ID_1506821040" MODIFIED="1361570580960" TEXT="produces an infinite seq of vals">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361570609568" ID="ID_1587952641" MODIFIED="1361570617363" TEXT="division of labor">
<font NAME="Verdana" SIZE="12"/>
<icon BUILTIN="idea"/>
<node COLOR="#111111" CREATED="1361570617936" ID="ID_751009519" MODIFIED="1361570622112" TEXT="producer">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361570627184" ID="ID_1309915778" MODIFIED="1361570648730" TEXT="knows how to create any number of values">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
<node COLOR="#111111" CREATED="1361570622392" ID="ID_1014111202" MODIFIED="1361570624268" TEXT="consumer">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361570651032" FOLDED="true" ID="ID_1816750420" MODIFIED="1361571303692" TEXT="decides how many values to ask for">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node COLOR="#111111" CREATED="1361566833563" ID="ID_1610553683" MODIFIED="1361566848293" TEXT="a function that when called evaluates e and returns result">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361566850547" ID="ID_1671429149" MODIFIED="1361566870121" TEXT="(lambda () e)">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361566918226" ID="ID_1795459280" MODIFIED="1361566938713" TEXT="zero argument function used for the purpose of delaying">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361566976250" ID="ID_1457452161" MODIFIED="1361566987380" TEXT="instead of doing this: e">
<font NAME="Verdana" SIZE="12"/>
</node>
<node COLOR="#111111" CREATED="1361566987866" ID="ID_1862754738" MODIFIED="1361567010348" TEXT="delay by doing this: (lambda () e)">
<font NAME="Verdana" SIZE="12"/>
<node COLOR="#111111" CREATED="1361567010351" ID="ID_130107482" MODIFIED="1361567021859" TEXT="zero arg function">
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1361471608400" ID="ID_1489218841" MODIFIED="1361471615226" TEXT="force">
<font NAME="Georgia" SIZE="16"/>
<node COLOR="#111111" CREATED="1361471615228" ID="ID_829747251" MODIFIED="1361471690332">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      (define (my-force p)
    </p>
    <p>
      &#160;&#160;(if (mcar p)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;(mcdr p)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;(begin (set-mcar! p #t)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;(set-mcdr! p ((mcdr p)))
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;(mcdr p))))
    </p>
  </body>
</html></richcontent>
<font NAME="Verdana" SIZE="12"/>
</node>
</node>
</node>
<node COLOR="#cc0000" CREATED="1361566441700" ID="ID_920801737" MODIFIED="1361566454627" TEXT="eager">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1361566454630" ID="ID_776881723" MODIFIED="1361566468580" TEXT="function evaluated before call">
<font NAME="Georgia" SIZE="16"/>
</node>
</node>
<node COLOR="#cc0000" CREATED="1361467003312" ID="ID_980209750" MODIFIED="1361467011517" TEXT="Lazy evaluation">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1361467011518" ID="ID_1654873068" MODIFIED="1361467033918" TEXT="not compute until needed">
<font NAME="Georgia" SIZE="16"/>
</node>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1361467034128" ID="ID_1931008688" MODIFIED="1361467050014" TEXT="remember the answer so future uses comple immediately">
<font NAME="Georgia" SIZE="16"/>
</node>
</node>
<node COLOR="#cc0000" CREATED="1361564542915" ID="ID_1595874167" MODIFIED="1361564549696" TEXT="Memoization">
<edge STYLE="bezier" WIDTH="thin"/>
<font NAME="Verdana" SIZE="20"/>
<node BACKGROUND_COLOR="#ffffff" COLOR="#009900" CREATED="1361564556398" ID="ID_221981371" MODIFIED="1361564570231" TEXT="keep a cache of prev results">
<font NAME="Georgia" SIZE="16"/>
</node>
</node>
</node>
</node>
</map>
