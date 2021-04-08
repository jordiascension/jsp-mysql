package com.webapp.configuration;

import java.io.IOException;
import java.util.Properties;

public class DatabaseProperties {

	private static DatabaseProperties instancia = null;
	private Properties p;

	private DatabaseProperties() {

		p = new Properties();
		try {
			String environment = System.getenv("Entorno");
			String propFileName = environment + "-database.properties";

			p.load(getClass().getClassLoader()
					.getResourceAsStream(propFileName));
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

	public String getConnectionString() {

		return "jdbc:mysql://" + p.getProperty("server") + "/"
				+ p.getProperty("database");
	}

	public String getDatabaseUser() {

		return p.getProperty("user");
	}

	public String getDatabasePwd() {

		return p.getProperty("pwd");
	}

	public String getDatabaseDriver() {

		return p.getProperty("mysql-driver");
	}
}
