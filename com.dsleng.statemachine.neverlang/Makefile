CC=/home/suresh/apps/neverlang3/Neverlang/dist/bin/nlgc
CCI=/home/suresh/apps/neverlang3/Neverlang/dist/bin/nlgi
CCS=/home/suresh/apps/neverlang3/Neverlang/dist/bin/nlg
jc=javac
ja=java
CP=/home/suresh/apps/neverlang3/Neverlang/dist/*.jar
DEP=/home/suresh/apps/neverlang3/Neverlang/dist/DependencyGraph.jar:/home/suresh/apps/neverlang3/Neverlang/dist/Neverlang.jar:/home/suresh/apps/neverlang3/Neverlang/dist/lib/Dexter.jar:/home/suresh/apps/neverlang3/Neverlang/dist/lib/Lexter.jar:/home/suresh/apps/neverlang3/2statemachine/lib/utils.jar:.
EXECCP= /home/suresh/apps/neverlang3/2statemachine/lib/statemachine.jar:.
CP = $(DEP)

all: clean nl compile sm runit
singleFork: fork1 runit
multiFork: fork2 runit
nl:
	$(CC) pool/*.nl
	$(CC) LanguageVariants/*.nl
sm:
	mkdir -p com/dsleng/statemachine/test
	CLASSPATH=$(CP) $(CCS) neverlang.examples.statemachine.BaseSM grammar/emptySM >  com/dsleng/statemachine/test/Test1.java
fork1:
	mkdir -p com/dsleng/statemachine/test
	CLASSPATH=$(CP) $(CCS) neverlang.examples.statemachine.BaseSM grammar/fork1SM >  com/dsleng/statemachine/test/Test1.java
fork2:
	mkdir -p com/dsleng/statemachine/test
	CLASSPATH=$(CP) $(CCS) neverlang.examples.statemachine.MultiSM grammar/fork2SM >  com/dsleng/statemachine/test/Test1.java
runit:
	$(jc) -cp $(EXECCP)  com/dsleng/statemachine/test/Test1.java
	$(ja) -cp $(EXECCP) com.dsleng.statemachine.test.Test1

compile:
#	$(jc) -cp $(CP) neverlang/examples/*.java
	$(jc) -cp $(CP) neverlang/examples/statemachine/*.java
	$(jc) -cp $(CP) neverlang/examples/statemachine/usecase/*.java
run:
	$(CCI) neverlang.examples.statemachine.SMGuard
update:
	cp -rv neverlang/* /home/suresh/workspace/xtend/sm/neverlang.tag/src/neverlang/

test: clean all compile
	$(CCS) neverlang.examples.statemachine.BaseSM grammar/emptySM 
	$(CCS) neverlang.examples.statemachine.SMStart grammar/startSM 
	$(CCS) neverlang.examples.statemachine.SMFinal grammar/finalSM 
	$(CCS) neverlang.examples.statemachine.SMStartFinal grammar/startfinalSM 
	$(CCS) neverlang.examples.statemachine.SMGuard grammar/guardSM 
	$(CCS) neverlang.examples.statemachine.SMComposite grammar/compositeSM 
fork: clean all compile
	$(CCS) neverlang.examples.statemachine.UMLFork grammar/umlFork 
	$(CCS) neverlang.examples.statemachine.ClassicFork grammar/clsFork 
	$(CCS) neverlang.examples.statemachine.RhapsodyFork grammar/rpyFork 
graph:
	$(ja) -cp $(DEP) neverlang.extras.cvl.DepGraph neverlang.examples.statemachine.BaseSM
	$(ja) -cp $(DEP) neverlang.extras.cvl.DepGraph neverlang.examples.statemachine.SMComposite
	$(ja) -cp $(DEP) neverlang.extras.cvl.DepGraph neverlang.examples.statemachine.ClassicFork
	$(ja) -cp $(DEP) neverlang.extras.cvl.DepGraph neverlang.examples.statemachine.ForkLanguages
	 dot -T pdf neverlang.examples.statemachine.SMComposite.dot > slices.pdf
clean:
	rm -rf neverlang/
	rm -rf com/
