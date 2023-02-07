package app;

import jess.JessException;
import jess.QueryResult;
import jess.Rete;
import jess.ValueVector;

public class Main {

	public static Rete engine;
	
	public void startEngine() {
		System.out.println("Start Engine!");
		engine = new Rete();
		try {
			engine.batch("app/main4.clp");
			
//			engine.reset(); kalau di reset, maka yang di assert bakal ilang
//			kecuali ada di deffect
			
			engine.run();
		} catch (JessException e) {
			e.printStackTrace();
		}
	}
	public void query() {
		try {
			System.out.println("\nQuerying!\n");
			QueryResult queryRes = engine.runQueryStar("search-by-name", new ValueVector().add("Justine"));
			while(queryRes.next()) {
				System.out.println("Query Result : ");
				System.out.println(queryRes.getString("n"));
				System.out.println(queryRes.getString("a"));
				System.out.println("------------------------------");
			}
		} catch (JessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public Main() {
		startEngine();
		query();
		System.out.println("Finish Program");
	}

	public static void main(String[] args) {
		new Main();
	}

}
