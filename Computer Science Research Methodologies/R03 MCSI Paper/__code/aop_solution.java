aspect Logging {
    pointcut exec() : 
        execution(* f(* *) && * g(* *));
    after : exec() {
        print(@JointPoint.result)
    }
}