package com.collinprice.rooted;

import org.appcelerator.kroll.KrollModule;
import org.appcelerator.kroll.annotations.Kroll;

import org.appcelerator.titanium.TiApplication;
import org.appcelerator.kroll.common.Log;
import org.appcelerator.kroll.common.TiConfig;


@Kroll.module(name="ComCollinpriceRooted", id="com.collinprice.rooted")
public class ComCollinpriceRootedModule extends KrollModule {

	private static final String LCAT = "ComCollinpriceRootedModule";
	private static final boolean DBG = TiConfig.LOGD;

	public ComCollinpriceRootedModule() {
		super();
	}

	@Kroll.method
	public boolean isRooted() {
		return RootUtil.isDeviceRooted();
	}

}

