component implements="exercises.11_design_patterns.03_factory.model.IUser"
{
	public any function init()
	{
		return this;
	}
	
	public query function select( numeric UserID )
	{
		var sql    = "SELECT UserID, FirstName, LastName, Password, Email FROM tUsers";
		var params = {};

		if( arguments.keyExists( "UserID" ) )
		{
			sql = sql & " WHERE UserID = :UserID";
			params = { UserID = { value = arguments.UserID, cfsqltype="integer" } };
		}

		return QueryExecute( sql, params );
	}

	public void function insert( FirstName, LastName, Email, Password )
	{
		var sql = "INSERT INTO tUsers ( FirstName, LastName, Password, Email ) 
			       VALUES ( :FirstName, :LastName, :Password, :Email )";

		var params = {
			FirstName   	 = { value = arguments.FirstName, cfsqltype="varchar" },
			LastName   		 = { value = arguments.LastName, cfsqltype="varchar" },
			Password   		 = { value = arguments.Password, cfsqltype="varchar" },
			Email   		 = { value = arguments.Email, cfsqltype="varchar" }
		};

		QueryExecute( sql, params );
	}

	public void function update( UserID, FirstName, LastName, Email, Password )
	{
		var sql = "UPDATE tUsers 
				      SET FirstName = :FirstName, 
					  	  LastName = :LastName, 
						  Password = :Password,
						  Email = :Email
					WHERE UserID = :UserID";

		var params = {
			UserID     		 = { value = arguments.UserID, cfsqltype="integer" },
			FirstName   	 = { value = arguments.FirstName, cfsqltype="varchar" },
			LastName   		 = { value = arguments.LastName, cfsqltype="varchar" },
			Password   		 = { value = arguments.Password, cfsqltype="varchar" },
			Email   		 = { value = arguments.Email, cfsqltype="varchar" }
		};

		QueryExecute( sql, params );
	}

	public void function delete( UserID )
	{
		var sql = "DELETE FROM tUsers WHERE UserID = :UserID";

		var params = {
			UserID = { value = arguments.UserID, cfsqltype="integer" }
		};

		QueryExecute( sql, params );
	}

	public query function search( FirstName, LastName, Email, Password )
	{
		var sql = "SELECT userID, FirstName, LastName, Password, Email FROM tUsers WHERE 1=1 ";
		var params = {};

		if( arguments.keyExists( "FirstName" ) )
		{
			sql = sql & " AND FirstName LIKE :FirstName";
			params.FirstName = { value = "%#arguments.FirstName#%", cfsqltype="varchar" }
		}

		if( arguments.keyExists( "LastName" ) )
		{
			sql = sql & " AND LastName = :LastName";
			params.LastName = { value = "%#arguments.LastName#%", cfsqltype="varchar" }
		}

		// we use "email" and "password" searching to find valid logins
		// so don't do "fuzzy" wildcard searches on those items, look for
		// exact matches only.
		if( arguments.keyExists( "Email" ) )
		{
			sql = sql & " AND Email LIKE :Email";
			params.Email = { value = arguments.Email, cfsqltype="varchar" }
		}

		if( arguments.keyExists( "Password" ) )
		{
			sql = sql & " AND Password LIKE :Password";
			params.Password = { value = arguments.Password, cfsqltype="varchar" }
		}		

		return QueryExecute( sql, params );
	}

	public void function save( UserID, FirstName, LastName, Email, Password )
	{
		if( structKeyExists( arguments, "UserID" ) && isNumeric( arguments.UserID ) )
		{
			this.update( argumentCollection=arguments );
		}
		else
		{
			this.insert( argumentCollection=arguments );
		}
	}
	
}
