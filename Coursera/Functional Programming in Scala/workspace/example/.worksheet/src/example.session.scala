package example

object session {;import org.scalaide.worksheet.runtime.library.WorksheetSupport._; def main(args: Array[String])=$execute{;$skip(55); 
	val xs = List(1,2,3);System.out.println("""xs  : List[Int] = """ + $show(xs ));$skip(16); 
	val x = xs.sum;System.out.println("""x  : Int = """ + $show(x ));$skip(19); 
	val high = xs.max;System.out.println("""high  : Int = """ + $show(high ))}
}
