module neverlang.examples.statemachine.StartFinalState {
    imports {
        neverlang.examples.statemachine.utils.StateCnt;
    }
    reference syntax {
        StateDef <-- "State" ":" Identifier "initial" "final" ";";
    }
    role(evaluation){
        0.{ 
        }.
    }
    role(translate){
        0.{ 
            String semi = ";";
            String stateClass = $1.identifier;
            String stateName = $$StateCnt.getValue(stateClass);
            $0.Decl = "public class " + $1.identifier + " extends State { public " + $1.identifier + "(){super(\"" + $1.identifier + "\"" + ")" + semi + "}}"; 
            String line1 = "State " + stateName + " = new State(\"" + $1.identifier + "\")" + semi;  
            String line2 =  stateName + ".makeFinal()" + semi; 
            String line3 =  stateName + ".makeInitial()" + semi; 
            String line4 = "addState(" + stateName + ")" + semi; 
            $0.Impl = line1 + "\n" + line2 + "\n" + line3 + "\n" + line4 + "\n";
        }.
    }
}
