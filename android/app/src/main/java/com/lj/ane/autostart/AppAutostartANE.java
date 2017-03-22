package com.lj.ane.autostart;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class AppAutostartANE implements FREExtension {

	/*
	 * Creates a new instance of ANESampleContext when the context is created 
	 * from the actionscript code.
	 */
	public FREContext createContext(String extId) {	
		return new AppAutostartANEContext();
	}
	
	/*
	 * Called if the extension is unloaded from the process. Extensions
	 * are not guaranteed to be unloaded; the runtime process may exit without
	 * doing so.
	 */
	@Override
	public void dispose() {
	}

	/*
 	 * Extension initialization.
 	 */  
	public void initialize( ) {
	}
}
