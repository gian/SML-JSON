(*******************************************************************************
*  Standard ML JSON parser
*  Copyright (C) 2010  Gian Perrone
*
*  This program is free software: you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation, either version 3 of the License, or
*  (at your option) any later version.
*
*  This program is distributed in the hope that it will be useful,
*  but WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*  GNU General Public License for more details.
*
*  You should have received a copy of the GNU General Public License
*  along with this program.  If not, see <http://www.gnu.org/licenses/>.
******************************************************************************)

structure JSONTrace =
struct
   type json_data = unit

   fun json_object l = print "json_object\n"
   fun json_pair (k,v) = print "json_pair\n"
   fun json_array l = print "json_array\n" 
   fun json_value x = print "json_value\n"
   fun json_string s = print "json_string\n"
   fun json_int _ = print "json_int\n"
   fun json_real _ = print "json_real\n"
   fun json_bool _ = print "json_bool\n"
   fun json_null () = print "json_null\n"

   fun error_handle (msg,pos,data) =
      raise Fail ("Error: " ^ msg ^ " near " ^ Int.toString pos ^ " data: " ^
                  data)
end

structure T = JSONParser (JSONTrace);

fun main () =
let
   val k = CommandLine.arguments ()

   val _ = if length k = 0 then 
               raise Fail "No filename supplied"
           else ()
   
   val fp = TextIO.openIn (hd k)
   val fc = TextIO.inputAll fp
   val _ = TextIO.closeIn fp
   val _ = T.parse fc
in
   ()
end

val _ = main ()

