functor
import
   System
   Application
   Stack
define
   InitStack = {Stack.push 5 {Stack.push 4 {Stack.new}}}
   Result # NewStack = {Stack.pop InitStack}
   {System.show NewStack}
   {Application.exit 0}
end
