package org.snowfk.demoContact;

import org.snowfk.web.WebModuleConfig;

public class DemoContactConfig extends WebModuleConfig {

	@Override
	public Class[] provideWebHandlerClasses() {

		return new Class[] { ContactWebHandler.class,GroupWebHandler.class };
	}

	@Override
	public Class[] provideEntityClasses() {

		return new Class[] { Group.class,Contact.class};
	}

}
