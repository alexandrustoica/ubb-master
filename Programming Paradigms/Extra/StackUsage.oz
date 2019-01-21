functor
import
   System
   Application
   Stack
define
   InitStack = {Stack.push 5 {Stack.push 4 {Stack.new}}}
   thread R1 # NewStack = {Stack.pop InitStack} end
   thread R2 # NewStack = {Stack.pop InitStack} end
   {System.show R1#R2}
   {Application.exit 0}
end
