package com.lj.ane.autostart;

import java.util.HashMap;
import java.util.Map;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.lj.ane.autostart.commands.AllowCommand;

public class AppAutostartANEContext extends FREContext {

	public AppAutostartANEContext() {
		super();
	}

	@Override
	public void dispose() {
	}

	@Override
	public Map<String, FREFunction> getFunctions() {
		Map<String, FREFunction> functionMap = new HashMap<String, FREFunction>();
		functionMap.put("allow", new AllowCommand() );

		return functionMap;
	}
}
