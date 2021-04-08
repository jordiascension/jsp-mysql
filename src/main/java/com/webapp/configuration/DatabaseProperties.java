package com.webapp.configuration;

import java.io.IOException;
import java.util.Properties;

public class DatabaseProperties {

	private static DatabaseProperties instancia = null;
	private Properties p;

	private DatabaseProperties() {

		p = new Properties();
		try {
			p.load(getClass().getClassLoader()
					.getResourceAsStream("dev-database.properties"));
		} catch (IOException e) {
// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static DatabaseProperties getInstancia() {

		if (instancia == null) {

			instancia = new DatabaseProperties();
		}
		return instancia;
	}

	public String getPropiedad(String clave) {

		return p.getProperty(clave);
	}
}
