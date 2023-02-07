package app;

import jess.JessException;
import jess.Rete;

public class Main {

	public static Rete engine;
	
	public Main() {
		engine = new Rete();
		String path = "app/main.clp";
		try {
			engine.batch(path);
			engine.reset();
			engine.run();
		} catch (JessException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		new Main();
	}

}
