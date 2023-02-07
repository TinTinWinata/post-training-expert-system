package app;

import jess.JessException;
import jess.QueryResult;
import jess.ValueVector;

public class Template {

	public Template() {
		try {
			QueryResult queryRes = Main.engine.runQueryStar("simple-q", new ValueVector());
			queryRes.next();
			System.out.println(queryRes.getString("name"));
			System.out.println(queryRes.getString("price"));
			System.out.println(queryRes.getString("type"));
		} catch (JessException e) {
			e.printStackTrace();
		}
	}

}
