package com.lasbambas.mantto.model;

public enum StateVersion {
	RELEASE("EN USO"),
	DEVELOPED("EN DESARROLLO"),
	OLD_RELEASE("ANTERIOR EN USO");
	
	private final String description;
	private StateVersion(String description){
		this.description=description;
	}
	public String getDescription() {
		return description;
	}
	
}
