# Adobe ColdFusion 2023 Coding Examples

This document compiles various ColdFusion examples demonstrating core concepts, syntax, and best practices in Adobe ColdFusion 2023.

## Table of Contents

1. [Introduction to ColdFusion](#introduction-to-coldfusion)
   - [What is ColdFusion?](#what-is-coldfusion)
   - [Using cfoutput](#using-cfoutput)
   - [Tag vs Script Syntax](#tag-vs-script-syntax)
   - [Commenting in Tag Syntax](#commenting-in-tag-syntax)
   - [Using cfdump and writeDump()](#using-cfdump-and-writedump)

2. [Variables and Data Types](#variables-and-data-types)
   - [Creating Variables](#creating-variables)
   - [Weakly Typed Language](#weakly-typed-language)
   - [Creating Lists](#creating-lists)
   - [List Delimiters](#list-delimiters)
   - [Empty List Items](#empty-list-items)
   - [Finding Items in Lists](#finding-items-in-lists)
   - [Basic Arrays](#basic-arrays)
   - [Empty Array Items](#empty-array-items)
   - [Finding in Arrays](#finding-in-arrays)
   - [Merging Arrays](#merging-arrays)
   - [Multi-Dimensional Arrays](#multi-dimensional-arrays)
   - [Array Functions](#array-functions)
   - [Creating Structures](#creating-structures)
   - [Keys in Structures](#keys-in-structures)
   - [Finding in Structures](#finding-in-structures)
   - [Merging and Copying Structures](#merging-and-copying-structures)
   - [Shallow Copy vs Deep Copy](#shallow-copy-vs-deep-copy)
   - [Null Support](#null-support)

3. [Main ColdFusion Constructs](#main-coldfusion-constructs)
   - [If/Else in Script Syntax](#ifelse-in-script-syntax)
   - [Nested If Statements](#nested-if-statements)
   - [Simple If Tag](#simple-if-tag)
   - [Comparison Operators](#comparison-operators)
   - [Ternary Operator](#ternary-operator)
   - [Switch Case](#switch-case)
   - [Break Statement](#break-statement)
   - [If in Switch Case](#if-in-switch-case)
   - [For Loop](#for-loop)
   - [While and Do-While Loops](#while-and-do-while-loops)
   - [For-In Loop](#for-in-loop)
   - [Looping Over Lists](#looping-over-lists)
   - [Looping Over Arrays](#looping-over-arrays)
   - [Looping Over Structures](#looping-over-structures)
   - [Break and Continue](#break-and-continue)

4. [Functions](#functions)
   - [Simple Functions](#simple-functions)
   - [Function Arguments](#function-arguments)
   - [Required and Optional Arguments](#required-and-optional-arguments)
   - [Argument Types](#argument-types)
   - [Passing Arguments](#passing-arguments)
   - [Return Values](#return-values)
   - [Function Tags](#function-tags)

5. [Scopes](#scopes)
   - [Variables Scope](#variables-scope)
   - [Function Variable Scope](#function-variable-scope)
   - [CGI Scope](#cgi-scope)
   - [Application Scope](#application-scope)
   - [Session Scope](#session-scope)
   - [Session ID and Cookies](#session-id-and-cookies)
   - [Server Scope](#server-scope)
   - [Locking](#locking)

6. [Reusing Code](#reusing-code)
   - [Simple Include](#simple-include)
   - [Variables Scope with Includes](#variables-scope-with-includes)
   - [Common Use Cases for Includes](#common-use-cases-for-includes)
   - [Including Function Libraries](#including-function-libraries)
   - [Using cfimport and Custom Tags](#using-cfimport-and-custom-tags)
   - [Using cfmodule](#using-cfmodule)

7. [Application.cfc](#applicationcfc)
   - [Basic Setup](#basic-setup)
   - [Application Events](#application-events)
   - [Session Management](#session-management)
   - [Error Handling](#error-handling)
   - [Mappings and Custom Tag Paths](#mappings-and-custom-tag-paths)

8. [Caching](#caching)
   - [Basic Caching](#basic-caching)
   - [Advanced Caching](#advanced-caching)
   - [Using Cache Regions](#using-cache-regions)
   - [Output Caching](#output-caching)

9. [Database Operations](#database-operations)
   - [Using cfquery](#using-cfquery)
   - [Using this.datasource](#using-thisdatasource)
   - [Displaying Query Data](#displaying-query-data)
   - [Grouping Query Output](#grouping-query-output)
   - [Dynamic Queries](#dynamic-queries)
   - [Using Query Parameters](#using-query-parameters)
   - [Query Metadata](#query-metadata)
   - [Using QueryExecute](#using-queryexecute)
   - [Caching Queries](#caching-queries)
   - [Query of Queries](#query-of-queries)
   - [Using ValueList](#using-valuelist)
   - [Other Query Tags](#other-query-tags)

10. [Object Oriented Programming](#object-oriented-programming)
    - [Creating Components](#creating-components)
    - [Methods in Components](#methods-in-components)
    - [Creating Component Instances](#creating-component-instances)
    - [Constructor Method](#constructor-method)
    - [Public and Private Methods](#public-and-private-methods)
    - [Accessors](#accessors)
    - [Inheritance](#inheritance)
    - [Interfaces](#interfaces)
    - [Composition](#composition)
    - [Basic CRUD Operations](#basic-crud-operations)
    - [Caching Components](#caching-components)

---

## Introduction to ColdFusion

### What is ColdFusion?

```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>What is ColdFusion?</title>
</head>
<body>
	<cfif isDefined('form.name')>
		<cfoutput>
			<p>Dear #form.name#,<p>
			<p>Welcome to the Adobe ColdFusion Specialist Certification Program.</p>
		</cfoutput>
	<cfelse>
		<form method="POST">
			<div>
				<label for="name">Your Name</label>
				<input name="name" id="name" type="text" />
			</div>
			<div>
				<button type="submit">Send</button>
			</div>
		</form>
	</cfif>
</body>
</html>
```

### Using `cfoutput`

```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Printing data with cfoutput</title>
</head>
<body>
	<h1>Printing data on the screen</h1>
	
	<cfset fName = "Damien" />

	<p>The value of the fName variable is #fName#.</p>

</body>
</html>
```

### Tag vs Script Syntax

```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The tag and the script syntax</title>
</head>
<body>
	<h1>The tag and the script syntax</h1>
	
	<cfset fName = "Damien" />
	<cfoutput>
		<p>The value of the fName variable is #fName#.</p>
	</cfoutput>

</body>
</html>
```

### Commenting in Tag Syntax

```cfm
<!---
	index.cfm

	This is the index file for the company website.

	Written by Nolan, May 2019
--->
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>
</head>
<body>

	<!-- Users listing -->
	<h2>Users</h2>

	<cfset aryUsers = [ "John", "Paul", "George", "Ringo" ] />
	<cfloop array="#aryUsers#" index="curUser">
		<cfoutput>
			<div>#curUser#</div>
		</cfoutput>
	</cfloop>

	<!-- Employees listing -->
	<h2>Employees</h2>
	<cfscript>
		aryEmployees = [ "Mick", "Keith", "Charlie", "Ron", "Brian" ];	// this is our list of new employees
		/*
		for( e in aryEmployees )
		{
			WriteOutput( "<div>#e#</div>" );
		}
		*/
	</cfscript>
</body>
</html>
```

### Using `cfdump` and `writeDump()`

```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>&lt;cfdump&gt; and writeDump()</title>
</head>
<body>
	<h1>Using &lt;cfdump&gt; and writeDump()</h1>
	
	<p>
	<!--- Dumping a string --->
		<cfset fName = "Damien" />
		<cfdump var="#fName#" />
	<br />
	<!--- Dumping a number --->
		<!--- <cfset age = 43 />
		<cfdump var="#age#" /> --->
	<br />
	<!--- Dumping a boolean --->
		<!--- <cfset hasGlasses = true />
		<cfdump var="#hasGlasses#" /> --->
	<br />
	<!--- Dumping an array --->
		<!--- <cfset beatles = ["John", "Paul", "George", "Ringo"] />
		<cfdump var="#beatles#" label="Dumping an Array"/> --->
	<br />
	<!--- Dumping a structure --->
		<!--- <cfset student =  { name = "Alvin", age = 22,hairColor = "brown" } />
		<cfdump var="#student#" label="Dumping a structure" /> --->
	
	</p>
	
	<p>
	<!--- <cfscript>
		// dumping a string
		fName = 'Damien';
		writeDump(fname);
		writeOutput('<br />');
		
		
		//dumping a number
		age = 43;
		writeDump(age);
		writeOutput('<br />');
		
		//dumping a boolean
		hasGlasses = true;
		writeDump(hasGlasses);
		writeOutput('<br />');
		
		//dumping an array
		beatles = ["John", "Paul", "George", "Ringo"];
		writeDump(var=beatles, label="Dumping an Array");
		writeOutput('<br />');
		
		//dumping a structure
		student = { name = "Alvin", age = 22,hairColor = "brown" };
		writeDump(var=student, label="Dumping a structure");
		writeOutput('<br />');
	</cfscript> --->
	</p>
	
</body>
</html>
```

---

## Variables and Data Types

### Creating Variables

```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Creating Variables</title>
</head>
<body>
	<cfset myVariable = "ColdFusion" />

	<cfoutput>
		<p>The value of my variable is #myVariable#.</p>
	</cfoutput>
	
</body>
</html>
```

### Weakly Typed Language

```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>CFML is weakly typed</title>
</head>
<body>
    <h1>CFML is weakly typed</h1>
	<cfset myVariable = "ColdFusion" />

	<cfoutput>
		<p>The value of my variable is #myVariable#. It is a string variable.</p>
    </cfoutput>
	
</body>
</html>
```

### Creating Lists

```cfm
<cfscript>
	// basic "string" variables
	person1 = "John";
	person2 = "Paul";
	person3 = "George";
	person4 = "Ringo";

	// also a string variable, but with data separated by commas
	people = "John,Paul,George,Ringo";

	WriteOutput( "<p>The list of people:</p>" );
	WriteOutput( "<p>#people#</p>" );

	// a list containing numbers, but wrapped in quotation marks to make it a "string"
	testScores = "99,84,101";

	WriteOutput( "<p>The list of test scores:</p>" );
	WriteOutput( "<p>#testScores#</p>" );

	// a list containing both numbers and text
	namesAndAges = "David,71,Tony,68,Woody,67,Mick,54";

	WriteOutput( "<p>The list of names and ages:</p>" );
	WriteOutput( "<p>#namesAndAges#</p>" );
</cfscript>
```

### List Delimiters

```cfm
<cfscript>
	// also a string variable, but with data separated by commas
	people = "John,Paul,George,Ringo";

	WriteOutput( "<p>The list of people:</p>" );
	WriteOutput( "<p>#people#</p>" );

	// newList = listChangeDelims( people, "$" );

	// WriteOutput( "<p>The new list of people:</p>" );
	// WriteOutput( "<p>#newList#</p>" );

	// WriteOutput( "<p>The list contains #ListLen( newList )# items.</p>" );
	// WriteOutput( "<p>The list contains #ListLen( newList, "$" )# items.</p>" );
</cfscript>
```

### Empty List Items

```cfm
<cfscript>
	people = "Mick,,,,Keith,,,,Charlie,Ronnie,,,,,Bill";

	numItems = ListLen( people );
	// numItems = ListLen( people, ",", true );

	WriteOutput( "<p>The list contains #numItems# items.</p>" );

	// WriteOutput( "<p>The first item is: #ListFirst( people )#</p>" );
	// WriteOutput( "<p>The second item is: #ListGetAt( people, 2, ",", true )#</p>" );
</cfscript>
```

### Finding Items in Lists

```cfm
<cfscript>
	studentNames = "Chino Moreno,Stephen Carpenter,Abe Cunningham,Frank Delgado,Sergio Vega";

	foundIdx = ListFind( studentNames, "Steph" );
	// foundIdx = ListContains( studentNames, "Steph" );
	// foundIdx = ListFindNoCase( studentNames, "STephen Carpenter" );
	// foundIdx = ListContainsNoCase( studentNames, "stEPH" );
	// foundIdx = studentNames.listFind( "Steph" );
	// foundIdx = studentNames.listContains( "Steph" );
	// foundIdx = studentNames.listFindNoCase( "stEPH" );
	// foundIdx = studentNames.listContainsNoCase( "stEPH" );

	if( foundIdx == 0 )
	{
		WriteOutput( "<p>No matching name found.</p>" );
	}
	else 
	{
		WriteOutput( "<p>That is student number #foundIdx# in the list.</p>" );	
	}
</cfscript>
```

### Basic Arrays

```cfm
<cfscript>
	name1 = "John";
	name2 = "Paul";
	name3 = "George";
	name4 = "Ringo";

	users = ArrayNew( 1 );
	users[ 1 ] = "John";
	users[ 2 ] = "Paul";
	users[ 3 ] = "George";
	users[ 4 ] = "Ringo";
	WriteDump( users );

	// ArrayAppend( users, "Pete" );
	// ArrayAppend( users, "Stuart" );
	// WriteDump( users );

	// users = [ "John", "Paul", "George", "Ringo" ];
	// users.append( "Pete" );
	// users.append( "Stuart" );
	// WriteDump( users );	

	// userData = ArrayNew( 1 );
    // userData[ 1 ] = "James Hetfield";
    // userData[ 2 ] = 48;
    // ArrayAppend( userData, "123 Main Street" );
    // userData.append( Now() );

    // WriteDump( userData );

    // userData = [ "James Hetfield", 48, "123 Main Street", Now() ];
    // WriteDump( userData );
</cfscript>
```

### Empty Array Items

```cfm
<cfscript>
	authors = [ "Stephen King", "", "Chuck Klosterman", "", "David Sedaris", "Nick Hornby", "Judy Blume" ];
	WriteDump( authors );

	// movies = ArrayNew( 1 );
	// movies[ 1 ] = "Pretty In Pink";
	// movies[ 2 ] = "Top Gun";
	// movies[ 3 ] = "Clue";
	// movies[ 4 ] = "Sneakers";
	// movies[ 5 ] = "The Breakfast Club";
	// WriteDump( movies );

	// movies = ArrayNew( 1 );
	// movies.append( "Pretty In Pink" );
	// movies.append( "Top Gun" );
	// movies.append( "Clue" );
	// movies.append( "Sneakers" );
	// movies.append( "The Breakfast Club" );
	// WriteDump( movies );
</cfscript>
```

### Finding in Arrays

```cfm
<cfscript>
	movies = [ "Pretty In Pink", "The Breakfast Club", "Labyrinth", "Clue", "Sneakers", "Top Gun" ];

	WriteOutput( "<p>The first movie in the array is: #ArrayFirst( movies )#</p>" );
	WriteOutput( "<p>The first movie in the array is: #movies.first()#</p>" );

	// WriteOutput( "<p>The last movie in the list is: #ArrayLast( movies )#</p>" );
	// WriteOutput( "<p>The last movie in the list is: #movies.last()#</p>" );
	
	// foundIdx = ArrayFind( movies, "The Breakfast Club" );
	// WriteOutput( "<p>The Breakfast Club is movie number #foundIdx# in the list</p>" );
	
	// WriteOutput( "<p>The Breakfast Club is movie number #movies.find( "The Breakfast Club" )# in the list</p>" );

	studentNames = [ "Chino Moreno", "Stephen Carpenter", "Abe Cunningham", "Frank Delgado", "Sergio Vega" ];

	// foundIdx = ArrayFind( studentNames, "Stephen Carpenter" );
	// foundIdx = ArrayFindNoCase( studentNames, "STePhen Carpenter" );
	// foundIdx = studentNames.find( "Steph" );
	// foundIdx = studentNames.findNoCase( "STephen Carpenter" );

	// if( foundIdx == 0 )
	// {
	// 	WriteOutput( "<p>No matching name found.</p>" );
	// }
	// else 
	// {
	// 	WriteOutput( "<p>That is student number #foundIdx# in the array.</p>" );	
	// }
	
	// isFound = ArrayContains( studentNames, "Stephen Carpenter" );
	// isFound = ArrayContainsNoCase( studentNames, "STephen Carpente" );
	// isFound = studentNames.contains( "Stephen Carpenter" );

	// if( isFound )
	// {
	// 	WriteOutput( "<p>Yes that student is in the array</p>" );
	// }
	// else 
	// {
	// 	WriteOutput( "<p>That student was not found.</p>" );
	// }
</cfscript>
```

### Merging Arrays

```cfm
<cfscript>
	books = [ "Charlie and The Chocolate Factory", "Where The Sidewalk Ends", "James and the Giant Peach" ];
	WriteDump( books );

	movies = [ "Top Gun", "Clue", "Weird Science" ];
	WriteDump( movies );

	// movies.append( books );
	// WriteDump( movies );

	// movies.append( books, true );
	// WriteDump( movies );
</cfscript>
```

### Multi-Dimensional Arrays

```cfm
<cfscript>
	customerInfo = ArrayNew( 2 );

	customerInfo[ 1 ][ 1 ] = "John";
	customerInfo[ 1 ][ 2 ] = "Lennon";
	customerInfo[ 1 ][ 3 ] = "john@vanedlay.biz";

	customerInfo[ 2 ][ 1 ] = "George";
	customerInfo[ 2 ][ 2 ] = "Harrison";
	customerInfo[ 2 ][ 3 ] = "george@vanedlay.biz";

	WriteDump( customerInfo );

	WriteOutput( "<p>George's email address is #customerInfo[ 2 ][ 3 ]#</p>" );
</cfscript>
```

### Array Functions

```cfm
<cfscript>
    aBands = ['Beatles', 'Rolling Stones', 'Deep Purple', 'AC / DC'];

    // arrayAppend() => Appends an element to the end of an array.
    // ArrayAppend(aBands, 'U2');
    // aBands.append('U2');

    // arrayPrepend() => Inserts an array element at the beginning of an array.
    // arrayPrepend(aBands, 'Genesis');
    // aBands.prepend('Genesis');

    // arrayInsertAt() => Inserts a value at a specified position in an array.
    // arrayInsertAt(aBands, 3, 'Black Sabbath');
    // aBands.insertAt(3, 'Black Sabbath');
    
    // arrayDelete() => Deletes an object from an array.
    // arrayDeleteNoCase() => Deletes an object from an array, case insensitive.
    // arrayDelete(aBands, 'Deep purple');
    // aBands.delete('Deep Purple');

    // arrayDeleteAt() => Deletes an object from an array at a particular index.
    // arrayDeleteAt(aBands, 2);
    // aBands.deleteAt(2);

    // arrayClear() => deletes all elements in an array
    // arrayClear(aBands);
    // aBands.clear();

    writedump(aBands);

    // aNumbers = [5,8,7,3,9,12,47,95];

    // arrayAvg() => Calculates the average of the values in an array
    // result = ArrayAvg(aNumbers);
    // result = aNumbers.avg();

    // arraySum() => Calculates the sum of all the elements in an array.
    // result = ArraySum(aNumbers);
    // result = aNumbers.sum();

    // arrayMax() => Finds the maximum value of the elements in an array.
    // result = ArrayMax(aNumbers);
    // result = aNumbers.max();

    // arrayMin() => Finds the minimum value of the elements in an array.
    // result = ArrayMin(aNumbers);
    // result = aNumbers.min();

    // writedump(result);

    // arrayToList() => Converts a one-dimensional array to a list.
    // lBands = arrayToList(aBands);
    // lBands = aBands.toList();

    // writeDump(lBands);
    
    // listToArray() => Copies the elements of a list to an array.
    // aBandsFromList = listToArray(lbands);
    // aBandsFromList = lBands.listToArray();

    // writeDump(aBandsFromList);
</cfscript>
```

### Creating Structures

```cfm
<cfscript>
	aryBandMembers = [ "John", "Paul", "George", "Ringo" ];
	WriteDump( aryBandMembers );

	structBandMembers = { harmonica: "John",
						  bass: "Paul",
						  guitar: "George",
						  drums: "Ringo"
					    };
	WriteDump( structBandMembers );

	// student1 = { 
	// 		name = "Alvin",
	// 		age = 22,
	// 		hairColor = "brown"
	// 	};

	// WriteDump( student1 );
	
	// student2 = StructNew();
	// student2.name = "Simon";
	// student2.age = 25;
	// student2.hairColor = "black";

	// WriteDump( student2 );
</cfscript>
<!--- <cfset student3 = { name = "Theodore",
					age = 27,
					hairColor = "green"
} />
<cfdump var="#student3#" /> --->

<!--- <cfset student4 = StructNew() />
<cfset student4.name = "Dave" />
<cfset student4.age = 42 />
<cfset student4.hairColor = "blonde" />
<cfdump var="#student4#" /> --->
```

### Keys in Structures

```cfm
<cfscript>
	userInfo = {
		name: "Joey",
		age: 26
	};

	WriteDump( userInfo );

	// userInfo.AGE = 55;
	// userINFO.NAME = "Richard";

	// WriteDump( userInfo );

	// authorInfo = {
	// 	authorName: "Stephen King",
	// 	age: 54
	// };

	// WriteDump( authorInfo );

	// authorInfo[ "list of books" ] = "Christine,It,Cujo,Eyes of the Dragon,The Stand";

	// WriteDump( authorInfo );

	// WriteOutput( "<p>Author Name is: #authorInfo.authorName#</p>" );

	// WriteOutput( "<p>Books written include:</p>" );

	// WriteOutput( authorInfo.list of books );

	// WriteOutput( authorInfo[ "list of books" ] );
	// WriteOutput( authorInfo[ "LIST of books" ] ); // case sensitivity doesn't matter
	// WriteOutput( authorInfo[ "LIST of    books" ] ); // matching the spacing does matter
</cfscript>
```

### Finding in Structures

```cfm
<cfscript>
	userInfo = {
		name = "Joey Ramone",
		age  = 25,
		hairColor = "black",
		weight = "200lbs",
		address = "123 Main Street",
		city = "Brooklyn",
		state = "CA",
		postalCode = "11321",
		email = "joey@ramones.biz"
	};

	// userInfo.insert( "height", "5 foot 8" );
	
	if( userInfo.keyExists( "height" ) )
	{
		WriteOutput( "Joey's height is #userInfo.height#" );

		// WriteOutput( "Joey's height is #userinfo.find( 'height' )#" );
	
		// WriteDump( userinfo.findKey( 'state' ) );

		// WriteDump( userInfo.findValue( 'CA' ) );
	}
	else 
	{
		WriteOutput( "We don't have height data for that person." );
	}	

	// if( StructKeyExists( userInfo, "height" ) )
	// {
	// 	WriteOutput( "Joey's height is #userInfo.height#" );
	// 	WriteOutput( "Joey's height is #structFind( userinfo, 'height' )#" );
	
	// 	WriteDump( structFindKey( userinfo, 'state' ) );

	// 	WriteDump( structFindValue( userinfo, 'CA' ) );
	// }
	// else 
	// {
	// 	WriteOutput( "We don't have height data for that person." );
	// }
</cfscript>
```

### Merging and Copying Structures

```cfm
<cfscript>
	companyInfo = {
		name = "Vandelay Industries",
		yearFounded = 1987,
		location = "New York",
		color = "red"
	};

	productInfo = {
		partNumber = "123-ABC",
		color = "green",
		price = "4.99",
		weight = "12 lbs"
	};

	WriteDump( companyInfo );
	WriteDump( productInfo );

	// companyInfo.append( productInfo );

	// WriteDump( companyInfo );
	// WriteDump( productInfo );

	///////////////////
	//Copying structs
	///////////////////

	// customer1 = {
	// 	name = "Blair Sheehan",
	// 	hairColor = "brown",
	// 	eyes = "blue",
	// 	weight = "130 lbs"
	// };

	// WriteDump( customer1 );

	// customer2 = customer1;
	// WriteDump( customer2 );

	// customer2 = customer1.copy();
	// customer2 = StructCopy( customer1 );
	// WriteDump( customer2 );
	
	// customer2.eyes = "green";
	// WriteDump( customer2 );
</cfscript>
```

### Shallow Copy vs Deep Copy

```cfm
<cfscript>
	user1 = {
		name = "Joey Ramone",
		age = 55,
		eyeColor = "brown",
		favoriteBooks = [ "Christine", "It", "High Fidelity", "Looking For Alaska" ],
		addressInfo = {
			address = "123 Main Street",
			city = "Brooklyn", 
			state = 'NY',
			postalCode = "12134"
		}
	};

	user2 = user1.copy();
	// user2 = user1.duplicate();

	WriteDump( user1 );
	WriteDump( user2 );

	// user1.favoriteBooks.append( "The Stand" );

	// WriteDump( user1 );
	// WriteDump( user2 );

	// user1.addressInfo.city = "San Francisco";

	// WriteDump( user1 );
	// WriteDump( user2 );
</cfscript>
```

### Null Support

```cfm
<cfscript>
    someVar = null;

    writeDump(someVar);

    //writeDump(isNull(somevar));
</cfscript>
```

---

## Main ColdFusion Constructs

### If/Else in Script Syntax

```cfm
<cfscript>
    
</cfscript>
```

### Nested If Statements

```cfm
<cfscript>
    age = 4

    if ( age > 20 )
    {
        WriteOutput( "<p>Welcome to the show!</p>" );
    }
    else if ( age < 21 and age > 12 )
    {
        WriteOutput( "<p>You are allowed in the teen center portion of the club.</p>" );
    }
    else if ( age > 1 and age < 6 )
    {
        WriteOutput( "Children under 6 are allowed in free with a parent." );
    }
    else
    {
        WriteOutput( "<p>Sorry, you are not old enough to enter.</p>" );
    }

    WriteOutput( "<p>Thnk you for using our application</p>" );
</cfscript>
```

### Simple If Tag

```cfm
<cfset age = 74 />
```

### Comparison Operators

```cfm
<cfset age = 43 />

<cfif age GT 20>
    <p>Welcome to the show !</p>
<cfelse>
    <p>Sorry, you are not old enough to enter.</p>
</cfif>

<cfscript>
  ageScript = 43;
   
  if(ageScript > 20){
      writeOutput("<p>Welcome to the show !</p>");
  } else {
      writeOutput("<p>Sorry, you are not old enough to enter.</p>");
  }
</cfscript>
```

### Ternary Operator

```cfm
<cfscript>
    age = 43;
     
    //Ternary operator basic syntax : Condition ? Value if true : Value if false

    if(age > 20){
        writeOutput("<p>Welcome to the show !</p>");
    } else {
        writeOutput("<p>Sorry, you are not old enough to enter.</p>");
    }
</cfscript>
```

### Switch Case

```cfm
<cfscript>
	grade = 3;

	if( grade == 1 )
	{
		WriteOutput( "First graders are in room A-5" );
	}
	else if( grade == 2 )
	{
		WriteOutput( "Second graders are in room B-22" );
	}
	else if( grade == 3 )
	{
		WriteOutput( "Third graders are in room 7" );
	}
	else if( grade == 4 )
	{
		WriteOutput( "Fourth graders are in room D-3" );
	}
	else if( grade == 5 )
	{
		WriteOutput( "Fifth graders are in room 98" );
	}
	else if( grade == 6 )
	{
		WriteOutput( "Sixth graders are in room 54" );
	}
	else 
	{
		WriteOutput( "We don't teach that grade at this school." );	
	}
</cfscript>
```

### Break Statement

```cfm
<cfscript>
	grade = 4;

	switch( grade )
	{
		case 1: WriteOutput( "First graders are in room A-5" );
				break;

		case 2: WriteOutput( "Second graders are in room B-22" );
				break;

		case 3: WriteOutput( "Third graders are in room 17." );
				break;

		case 4: WriteOutput( "Fourth graders are in room D-3" );
				break;

		case 5: WriteOutput( "Fifth graders are in room 98" );
				break;

		case 6: WriteOutput( "Sixth graders are in room 54" );
				break;

		default: WriteOutput( "We don't teach that grade at this school." );
				 break;
	}
</cfscript>
```

### If in Switch Case

```cfm
<cfscript>
	firstName = "John";

	switch( firstName )
	{
		case "John":
					WriteOutput( "John plays harmonica" );
					break;

		case "Paul":
					WriteOutput( "Paul plays bass" );
					break;

		case "George":
					WriteOutput( "George plans electric guitar" );
					break;

		case "Ringo":
					WriteOutput( "Ringo plays drums." );
					break;

		default: WriteOutput( "That is not a Beatle." );
				 break;
	}
</cfscript>
```

### For Loop

```cfm
<cfscript>
	for( i = 0; i < 5; i++ )
	{
		WriteOutput( "<p>I is: #i#</p>" );
	}

	// for( i = 5; i > 0; i-- )
	// {
	// 	WriteOutput( "<p>I is: #i#</p>" );
	// }

	// for( i = 0; i < 10; i = i + 2 )
	// {
	// 	WriteOutput( "<p>I is: #i#</p>" );
	// }
</cfscript>
```

### While and Do-While Loops

```cfm
<cfscript>
	i = 10;

	WriteOutput( "<ol>" );

	while( i < 20 )
	{
		WriteOutput( "<li>Hello</li>" );
		i++;
	}
	// do
	// {
	// 	WriteOutput( "<li>Hello</li>" );
	// 	i++;
	// }
	// while( i > 20 );

	WriteOutput( "</ol>" );
</cfscript>
```

### For-In Loop

```cfm
<cfscript>
	aryPunkBands = [ "7 Seconds", "Green Day", "Fugazi", "Descendents", "The Clash" ];

	WriteOutput( "<ol>" );

	// notice we're starting with i = 1 
	// because arrays in CFML are 1-based, not 0-based
	for( i = 1; i <= aryPunkBands.len(); i++ )
	{
		WriteOutput( "<li>#aryPunkBands[ i ]#</li>" );
	}

	// for( p in aryPunkBands )
	// {
	// 	WriteOutput( "<li>#p#</li>" );
	// }

	WriteOutput( "</ol>" );
</cfscript>
```

### Looping Over Lists

```cfm
<cfscript>
	students = "Steph,Chino,Abe,Sergio,Frank,Chi";

	for( i = 1; i lte ListLen( students ); i++ )
	{
		WriteOutput( "<div>#ListGetAt( students, i )#</div>" );
	}

	// for( i in students )
	// {
	// 	WriteOutput( "<div>#i#</div>" );
	// }
</cfscript>

<cfoutput>
	<!--- <cfloop from="1" to="#ListLen( students )#" index="i">
		<div>#ListGetAt( students, i )#</div>
	</cfloop> --->

	<!--- <cfloop list="#students#" index="i">
		<div>#i#</div>
	</cfloop> --->
</cfoutput>

<cfscript>
	students = "Steph,Chino,Abe,Sergio,Frank,Chi";

	students.listEach( function( element, index, list ) {
		writeOutput( "<div>#index#:#element#</div>" );
	});

	// WriteOutput( element );
	// WriteOutput( index );
	// WriteOutput( list );
</cfscript>
```

### Looping Over Arrays

```cfm
<cfscript>
	students = [ "Steph", "Chino", "Abe", "Sergio" ,"Frank", "Chi" ];

	for( i = 1; i lte ArrayLen( students ); i++ )
	{
		WriteOutput( "<div>#students[ i ]#</div>" );
	}

	// for( i in students )
	// {
	// 	WriteOutput( "<div>#i#</div>" );
	// }
</cfscript>

<cfoutput>
	<!--- <cfloop from="1" to="#ArrayLen( students )#" index="i">
		<div>#students[ i ]#</div>
	</cfloop> --->

	<!--- <cfloop array="#students#" index="i">
		<div>#i#</div>
	</cfloop> --->
</cfoutput>

<cfscript>
	// students = [ "Steph", "Chino", "Abe", "Sergio", "Frank", "Chi" ];

	// students.each( function( element, index, array ) {
	// 	writeOutput( "<div>#index#:#element#</div>" );
	// });

	// WriteOutput( element );
	// WriteOutput( index );
	// WriteOutput( array );
</cfscript>
```

### Looping Over Structures

```cfm
<cfscript>
	userInfo = {
		name = "Joey Ramone",
		age  = 25,
		hairColor = "black",
		weight = "200lbs",
		address = "123 Main Street",
		city = "Brooklyn",
		state = "CA",
		postalCode = "11321",
		email = "joey@ramones.biz"
	};

	userInfo[ "height" ] = "5 foot 8";

	for( item in userInfo )
	{
		WriteOutput( "<div>#item#</div>" );
		// WriteOutput( "<div>#userInfo[ item ]#</div>" );
		// WriteOutput( "<div>#item#: #userInfo[ item ]#</div>" );
	}

	// userInfo.each( function( key, value ){
	// 	// WriteOutput( "<div>#key#</div>" );
	// 	// WriteOutput( "<div>#value#</div>" );
	// 	WriteOutput( "<div>#key#: #userInfo[ key ]#</div>" );
	// });
</cfscript>
```

### Break and Continue

```cfm
<cfscript>
    WriteOutput("<ul>");
    for( i = 1; i <= 10; i++ )
	{
        //if(i == 5)
        //{
        //    break;
        //} 
        WriteOutput( "<li>I is : #i#</li>" );
	}
    WriteOutput("</ul>");
</cfscript>

<!---
<ul>
    <cfloop index="i" from="1" to="10">
        <cfif i EQ 5>
            
        </cfif>
        <cfoutput><li>I is #i#</li></cfoutput>
    </cfloop>
</ul>
--->

<p>Whatever comes after the loop</p>
```

---

## Functions

### Simple Functions

```cfm
<cfscript>
	function sayHello()
	{
		WriteOutput( "<p>Hello from ColdFusion!</p>" );
	}

	sayHello();
	sayHello();
	sayHello();
	sayHello();
	sayHello();
</cfscript>
```

### Function Arguments

```cfm
<cfscript>
	function sayHello( myName )
	{
		WriteOutput( "<p>Hello, #arguments.myName#</p>" );
	}

	sayHello( "Nolan" );
	sayHello( "Alvin" );
	sayHello( "Simon" );
	sayHello( "Theodore" );
	sayHello( "Ziggy" );	

	//////////////////////
	// Multiple arguments
	//////////////////////

	// function computeAverage( test1, test2, test3 )
	// {
	// 	var average = ( arguments.test1 + arguments.test2 + arguments.test3 ) / 3;

	// 	WriteOutput( "<p>The average is #average#</p>" );
	// }

	// computeAverage( 99, 100, 87 );
	// computeAverage( 100, 77, 91 );
	// computeAverage( 91, 81, 84 );
	// computeAverage( 55, 88, 91 );
</cfscript>
```

### Required and Optional Arguments

```cfm
<cfscript>
	function computeAverage( required test1, required test2, required test3, testType )
	{
		var average = ( arguments.test1 + arguments.test2 + arguments.test3 ) / 3;

		if( StructKeyExists( arguments, "testType" ) )
		{
			WriteOutput( "<p>The #arguments.testType# average is #average#</p>" );	
		}
		else 
		{
			WriteOutput( "<p>The average is #average#</p>" );	
		}
	}

	computeAverage( 99, 100, 55 );
	computeAverage( 99, 100, 55 );
</cfscript>
```

### Argument Types

```cfm
<cfscript>
	function computeAverage( required numeric test1, required numeric test2, required numeric test3, string testType )
	{
		var average = ( arguments.test1 + arguments.test2 + arguments.test3 ) / 3;

		if( StructKeyExists( arguments, "testType" ) )
		{
			WriteOutput( "<p>The #arguments.testType# average is #average#</p>" );	
		}
		else 
		{
			WriteOutput( "<p>The average is #average#</p>" );	
		}
	}

	computeAverage( 65, 77, 87 );
	computeAverage( 99, 35, 25, "English" );
</cfscript>
```

### Passing Arguments

```cfm
<cfscript>
	function computeAverage( required test1, required test2, required test3, testType )
	{
		var average = ( arguments.test1 + arguments.test2 + arguments.test3 ) / 3;

		if( StructKeyExists( arguments, "testType" ) )
		{
			WriteOutput( "<p>The #arguments.testType# average is #average#</p>" );	
		}
		else 
		{
			WriteOutput( "<p>The average is #average#</p>" );	
		}
	}

	computeAverage( 99, 100, 55 );
	computeAverage(test1=99, test2=100, test3=55);

	args1 = {
		test1 = 99,
		test3 = 55,
		test2 = 100
	};
	computeAverage( argumentCollection=args1 );

	computeAverage( 99, 100, 55, "History" );
	computeAverage( test1=99, test2=100, test3=55, testType="History" );

	args2 = {
		test1 = 99,
		test2 = 100,
		test3 = 55,
		testType = "History"
	};
	computeAverage( argumentCollection=args2 );
</cfscript>
```

### Return Values (Example A)

```cfm
<cfscript>
	numeric function computeAverage( test1, test2, test3 )
	{
		var average = ( arguments.test1 + arguments.test2 + arguments.test3 ) / 3;

		return average;
	}

	void function display( required string answer, string testType )
	{
		if( StructKeyExists( arguments, "testType" ) )
		{
			WriteOutput( "<p>The #arguments.testType# average is #answer#</p>" );	
		}
		else 
		{
			WriteOutput( "<p>The average is #answer#</p>" );	
		}
	}

	average1 = computeAverage( 43, 100, 87 );
	display( average1 );

	average2 = computeAverage( 55, 77, 91 );
	display( average2, "English" );

	average3 = computeAverage( 100, 81, 84 );
	display( average3, "History" );

	average4 = computeAverage( 8, 42, 91 );
	display( average4 );
</cfscript>
```

### Return Values (Example B)

```cfm
<cfscript>
	function computeAverage( test1, test2, test3 )
	{
		var average = ( arguments.test1 + arguments.test2 + arguments.test3 ) / 3;

		return average;
	}

	any function display( required string answer, string testType )
	{
        var output = "";

		if( StructKeyExists( arguments, "testType" ) )
		{
			output = "<p>The #arguments.testType# average is #answer#</p>";
		}
		else 
		{
			output = "<p>The average is #answer#</p>";
        }
        
        return output;
	}

	average1 = computeAverage( 43, 100, 87 );
    formattedOutput = display( average1 );
    WriteOutput( formattedOutput );

	average2 = computeAverage( 55, 77, 91 );
    formattedOutput = display( average2, "English" );
    WriteOutput( formattedOutput );

	average3 = computeAverage( 100, 81, 84 );
    formattedOutput = display( average3, "History" );
    WriteOutput( formattedOutput );

	average4 = computeAverage( 8, 42, 91 );
    formattedOutput = display( average4 );
    WriteOutput( formattedOutput );
</cfscript>
```

### Function Tags

```cfm
<cffunction name="computeAverage" returntype="numeric">
    <cfargument name="test1" type="numeric" required="true"/>
    <cfargument name="test2" type="numeric" required="true"/>
    <cfargument name="test3" type="numeric" required="true"/>
    
    <cfset var average = (arguments.test1 + arguments.test2 + arguments.test3) / 3 />

    <cfreturn average />
</cffunction>

<cfoutput>
    <p>The average is #computeAverage(55,89,12)#</p>
</cfoutput>
```

---

## Scopes


### Variables Scope

```cfm
<cfset fName = "Damien" />
<cfset age = 43 />
<cfset favoriteBands = ["Genesis", "Simple Minds", "Tool", "Opeth"] />
<cfset address = {
    city = "Thuin",
    zip = 6530,
    country = "Belgium"
} />
<cfoutput>
    <p>The name is #fName#, and the age is #age#</p>
</cfoutput>

<!--- <cfdump var="#variables#" /> --->

<!--- <cfoutput>
    <p>There are #variables.count()# variables in the Variables scope.</p>
</cfoutput> --->

<!--- <cfoutput>
    <p>The name is #variables.fName#, and the age is #variables.age#</p>
    <p>The name is #variables['fName']#, and the age is #variables['age']#</p>
</cfoutput> --->

<cfscript>
    // fName = "Damien";
    // age = 43;
    // favoriteBands = ["Genesis", "Simple Minds", "Tool", "Opeth"];
    // address = {
    //     city = "Thuin",
    //     zip = 6530,
    //     country = "Belgium"
    // };

    // writeOutput("<p>The name is #fName#, and the age is #age#</p>");

    // writeDump(variables);

    // writeOutput("<p>There are #variables.count()# variables in the Variables scope.</p>");

    // writeOutput("<p>The name is #variables.fName#, and the age is #variables.age#</p>");
</cfscript>
```

### Function Variable Scope

```cfm
<cfscript>
    variables.fName = "Andrew";
    variables.lName = "Fletcher";

    // writeDump(var=variables, label = 'the global Variables scope');
    
    string function sayHello (){
        var greeting = "Hello";
        //var fName = "Dave";
        //var lName = "Gahan";

        // writeDump(var = local, label = "The local var scope of the function");

        return greeting & ' ' & variables.fName & ' ' & variables.lName & '.';
    }

    writeOutput("<p>#sayHello()#</p>");
    writeOutput("<p>#greeting & ' ' & variables.fName & ' ' & variables.lName#</p>")
</cfscript>
```

### CGI Scope

```cfm
<cfscript>
	writeDump(cgi);

	// cgi.custom = "Some Text";
</cfscript>
```

### Application.cfc

```cfc
component 
{
	writeoutput("<p>I am the main Application.cfc file</p>"); 
}
```

### Blog App Application.cfc

```cfc
component 
{
	writeoutput("<p>I am the blog app Application.cfc file</p>"); 
}
```

### Blog App Main File

```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The blog app</title>
</head>
<body>
	<h1>Welcome to the Blog App</h1>
	
</body>
</html>
```

### Message Board App Application.cfc

```cfc
component 
{
	writeoutput("<p>I am the message board app Application.cfc file</p>"); 
}
```

### Message Board App Main File

```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The Message board app</title>
</head>
<body>
	<h1>Welcome to the MessageBoard App</h1>
	
</body>
</html>
```

### Older Application.cfm vs Application.cfc

#### Application.cfc
```cfc
component 
{
	writeoutput("<p>I am the blog app Application.cfc file</p>"); 
}
```

#### Application.cfm
```cfm
<p>I am the older Application.cfm file</p>
```

#### Blog App Main File
```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The blog app</title>
</head>
<body>
	<h1>Welcome to the Blog App</h1>
	
</body>
</html>
```

### Application Scope

#### Blog App Application.cfc
```cfc
component 
{
	this.name = "myBlogApp";
	//this.name = "MyApp";

	//this.applicationTimeout = createTimespan(0, 2, 0, 0);
}
```

#### Blog App Main File
```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The blog app</title>
</head>
<body>
	<h1>Welcome to the Blog App</h1>
	<cfset application.color =  "red" />
	<cfoutput>
		<p>This application's color is #application.color#</p>
	</cfoutput>
	<p>To the <a href="login.cfm">Login page</a></p>
	<!--- <cfdump var="#application#" /> --->
</body>
</html>
```

#### Blog App Login Page
```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The blog app</title>
</head>
<body>
	<h1>Please login to the app</h1>
	<cfoutput>
		<p>This application's color is #application.color#</p>
	</cfoutput>
	<p>To the <a href="blogApp.cfm">BlogApp page</a></p>
</body>
</html>
```

#### Message Board App Application.cfc
```cfc
component 
{
	this.name = "MyMessageBoardApp";
	//this.name = "MyApp";

	//this.applicationTimeout = createTimespan(0, 4, 0, 0);
}
```

#### Message Board App Main File
```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The Message board app</title>
</head>
<body>
	<h1>Welcome to the MessageBoard App</h1>

	<cfset application.color = "green" />
	<cfoutput>
		<p>This application's color is #application.color#</p>
	</cfoutput>
	<!--- <cfdump var="#application#" /> --->
	
</body>
</html>
```

### Session Scope

#### Application.cfc with Session Management
```cfc
component 
{
	this.name = "myBlogApp";
	this.applicationTimeout = createTimeSpan(0, 2, 0, 0); //2 hours
	
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0, 0, 45, 0);// 45 mins
	
	public void function onSessionStart() {
		
		//set some defaults in the session scope
		session.created = Now();
		session.userAgent = cgi.http_user_agent;
	}
}
```

#### Blog App Main File
```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The blog app</title>
</head>
<body>
	<h1>Welcome to the Blog App</h1>
	<p>To the <a href="login.cfm">Login page</a></p>
	<cfdump var="#session#" />
</body>
</html>
```

#### Blog App Login Page
```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The blog app</title>
</head>
<body>
	<h1>Please login to the app</h1>
	<p>To the <a href="blogApp.cfm">BlogApp page</a></p>
	<cfdump var="#session#" />
	
</body>
</html>
```

### Session ID and Cookies

#### Application.cfc
```cfc
component 
{
	this.name = "myBlogApp";
	this.applicationTimeout = createTimeSpan(0, 2, 0, 0); //2 hours
	
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0, 0, 45, 0);// 45 mins
	
	public void function onSessionStart() {
		
		//set some defaults in the session scope
		session.created = Now();
		session.userAgent = cgi.http_user_agent;
	}
}
```

#### Blog App Main File with Cookies
```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The blog app</title>
</head>
<body>
	<h1>Welcome to the Blog App</h1>
	<p>To the <a href="login.cfm">Login page</a></p>
	<cfdump var="#session#" />
	
	<!--- <cfcookie  name="myCookie" value="myValue" /> --->

	<!--- <cfdump var="#cookie#" /> --->
</body>
</html>
```

### Server Scope

#### Blog App Application.cfc
```cfc
component 
{
	this.name = "myBlogApp";
	this.applicationTimeout = createTimeSpan(0, 2, 0, 0); //2 hours
}
```

#### Blog App Main File with Server Scope
```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The blog app</title>
</head>
<body>
	<h1>Welcome to the Blog App</h1>

	<cfdump var="#server#" />
	
	<!--- <cfset server.companyName = "CF Specialists INC." />
	
	<cfoutput>
	<p>This site belongs to the #server.companyName# company.</p>
	</cfoutput> --->
</body>
</html>
```

#### Message Board App Application.cfc
```cfc
component 
{
	this.name = "MyMessageBoardApp";
	this.applicationTimeout = createTimeSpan(0, 2, 0, 0); //2 hours
}
```

#### Message Board App Main File Using Server Scope
```cfm
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>The Message board app</title>
</head>
<body>
	<h1>Welcome to the MessageBoard App</h1>
	
	<cfoutput>
	<p>This site belongs to the #server.companyName# company.</p>
	</cfoutput>
	
</body>
</html>
```

### Locking

```cfm
<cfscript>
	application.totalTicketsSold = application.totalTicketsSold + myNewticketOrder;

	// lock scope="Application" timeout="10" type="Exclusive"
	// {
	// 	application.totalTicketsSold = application.totalTicketsSold + myNewticketOrder;
	// }
</cfscript>

<!--- 
One user on the site:
1. CF retrieves the value for application.totalTicketsSold.
2. CF adds that value to myNewticketOrder.
3. CF then combines those 2 as the -NEW- value for application.totalTicketsSold.
--->

<!--- 
Two users on the site at the same time:
1. User 1 starts to run that line of code. application.totalTicketsSold is 105.
2. User 2 starts to run that line of code. application.totalTicketsSold is 105. 
3. User 1 adds 5 tickets, making the total 110.
4. User 2 adds 2 tickets, making the total 107.
5. User 1 saves the new total back into application.totalTicketsSold as 110.
6. User 2 saves the new total back into application.totalTicketsSold as 107.
--->

<!--- 
Two users w/ locks in place: 
1. User 1 starts, hits the lock tag, and aquires the lock.
2. User 1 runs the line of code, application.totalTicketsSold is 105.
3. User 2 starts to run the code, hits the lock. Because User 1 has aquired the lock, User 2 waits here.
4. User 1 adds 5 tickets, making the total 110.
5. User 1 saves the new total back into application.totalTicketsSold as 110.
6. User 1 exits the lock and continues on with the rest of the request.
7. User 2 aquires the lock.
8. User 2 reads application.totalTicketsSold as 110.
9. User 2 adds 2 tickets, making the total 112.
10. User 2 saves the new total of 112 into application.totalTicketsSold.
11. User 2 exits the lock and continues on with the rest of the request.
--->

<!--- For more info:
https://helpx.adobe.com/coldfusion/developing-applications/developing-cfml-applications/using-persistent-data-and-locking/locking-code-with-cflock.html
--->
```

## Reusing Code

### Simple Include

Including external files is a common way to reuse code in ColdFusion. Here's a simple example of using `cfinclude`:

#### Header Include File (includes/incHeader.cfm)

```cfm
<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Vandelay Industries Intranet</title>
    <link rel="stylesheet" href="css/site.css" />
</head>
<body>
    
<div>Vandelay Industries Intranet</div>
<ul class="main-menu">
    <li><a href="index.cfm">Home Page</a></li>
    <li><a href="customers.cfm">Customers</a></li>
    <li><a href="orders.cfm">Orders</a></li>
</ul>
    
</cfoutput>
```

#### Footer Include File (includes/incFooter.cfm)

```cfm
<cfoutput>
    <div>
        (c) #Year( Now() )#
    </div>
</body>
</html>
</cfoutput>
```

#### Main Page Using Includes (index.cfm)

```cfm
<cfinclude template="includes/incHeader.cfm" />

<h1>Welcome to the Vandelay Industries Intranet</h1>

<p>
    Lorem ipsum dolor sit amet consectetur adipisicing elit. Necessitatibus incidunt cumque quas, id unde reprehenderit inventore omnis eius repellendus officiis temporibus odio delectus tempora molestias, optio exercitationem voluptatum. Aspernatur, provident.
</p>

<p>
    Lorem ipsum dolor sit amet consectetur adipisicing elit. Necessitatibus incidunt cumque quas, id unde reprehenderit inventore omnis eius repellendus officiis temporibus odio delectus tempora molestias, optio exercitationem voluptatum. Aspernatur, provident.
</p>

<p>
    Lorem ipsum dolor sit amet consectetur adipisicing elit. Necessitatibus incidunt cumque quas, id unde reprehenderit inventore omnis eius repellendus officiis temporibus odio delectus tempora molestias, optio exercitationem voluptatum. Aspernatur, provident.
</p>

<cfinclude template="includes/incFooter.cfm" />
```

### Variables Scope with Includes

When including files, the variables defined in those files become part of the variables scope of the calling page.

#### moreVariables.cfm

```cfm
<cfscript>
workAddress = {
    street = 'rue Beussart',
    zip = '1495',
    city = 'Villers-la-Ville',
    country = 'Belgium'
};
companyName = 'DiDaXo';
glasses = true;
userName = 'damienbkx';
</cfscript>
```

#### index.cfm

```cfm
<cfscript>
    userName = 'Damien';
    age = 43;
    favoriteBands = ['Genesis', 'Pink Floyd', 'Opeth', 'Tool'];
    homeAddress = {
        street = "rue d'Anderlues",
        zip = '6530',
        city = 'Thuin',
        country = 'Belgium'
    };

    include ('inc/moreVariables.cfm');

    writeDump(variables);
</cfscript>
```

### Common Use Cases for Includes

#### Constants Files

```cfm
<cfscript>
    ORDER_COMPLETED = 1;
    ORDER_REJECTED = 2;
    ORDER_IN_PROGRESS = 3;
    ORDER_AT_SHIPPING = 4;
    ORDER_AWAITING_PAYMENT = 5;
</cfscript>
```

#### Company Information

```cfm
<cfscript>
    CUSTOMER_SERVICE_PHONE_NUMBER = "916.555.1212";
    CUSTOMER_SERVICE_MANAGER = "J. Lennon";
</cfscript>
```

#### Utility Functions

```cfm
<cfscript>
    CURRENT_SALES_TAX = 0.08;

    numeric function getSalesTax( required numeric price )
    {
        var tax = arguments.price * CURRENT_SALES_TAX;
        return tax;
    }

    numeric function getPackageVolume( required numeric height,
                                       required numeric width,
                                       required numeric depth )
    {
        var volume = arguments.height * arguments.width * arguments.depth;
        return volume;
    }
</cfscript>
```

### Including Function Libraries

```cfm
<cfscript>
    include "include/utils.cfm";

    average1 = computeAverage( 43, 100, 87 );
    output = formatAnswer( average1 );
    WriteOutput( output );

    average2 = computeAverage( 55, 77, 91 );
    output = formatAnswer( average2 );
    WriteOutput( output );
</cfscript>
```

#### utils.cfm

```cfm
<cfscript>
function computeAverage( test1, test2, test3 )
{
    var average = ( arguments.test1 + arguments.test2 + arguments.test3 ) / 3;
    return average;
}

string function formatAnswer( required string answer, string testType )
{
    var output = "";

    if( StructKeyExists( arguments, "testType" ) )
    {
        output = "<p>The #arguments.testType# average is #answer#</p>";
    }
    else 
    {
        output = "<p>The average is #answer#</p>";
    }
    
    return output;
}
</cfscript>
```

### Using cfimport and Custom Tags

#### Importing Custom Tags

```cfm
<cfimport taglib="myCustomTags" prefix="ct" />

<ct:siteHeader>

<h1>Welcome to the Vandelay Industries Intranet</h1>

<p>
    Lorem ipsum dolor sit amet consectetur adipisicing elit. Necessitatibus incidunt cumque quas, id unde reprehenderit inventore omnis eius repellendus officiis temporibus odio delectus tempora molestias, optio exercitationem voluptatum. Aspernatur, provident.
</p>

<ct:siteFooter>
```

#### Custom Tag with Execution Modes

```cfm
<cfparam name="attributes.pageTitle" default="Vandelay Industries Intranet" />
<cfif thisTag.executionMode EQ 'start'>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        
        <cfoutput>
            <title>#attributes.pageTitle#</title>
        </cfoutput>
        <link rel="stylesheet" href="css/site.css" />
    </head>
    <body>
        
    <div>Vandelay Industries Intranet</div>
    <ul class="main-menu">
        <li><a href="index.cfm">Home Page</a></li>
        <li><a href="customers.cfm">Customers</a></li>
        <li><a href="orders.cfm">Orders</a></li>
        <li><a href="contact.cfm">Contact Us</a></li>
    </ul>
<cfelse>

    <cfoutput>
            <div>
                (c) #Year( Now() )#
            </div>
        </body>
        </html>
    </cfoutput>
    
</cfif>
```

### Using cfmodule

```cfm
<cf_siteChrome pageTitle="Vandelay Industries Intranet - Home">

    <h1>Welcome to the Vandelay Industries Intranet</h1>
    
    <p>
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Necessitatibus incidunt cumque quas, id unde reprehenderit inventore omnis eius repellendus officiis temporibus odio delectus tempora molestias, optio exercitationem voluptatum. Aspernatur, provident.
    </p>
    
</cf_siteChrome>
```

## Application.cfc

The Application.cfc file is the central configuration file for a ColdFusion application. Here's a comprehensive example:

```cfc
component 
{
    this.name = "VandelayIndustries_Intranet" & left( hash( getCurrentTemplatePath()), 64 );

    this.applicationTimeout = CreateTimeSpan( 5, 0, 0, 0 ); // 5 days

    this.customTagPaths = [ expandPath( '/VandelayCustomTags' ) ];

    this.mappings = 
    {
        "/foo"      = expandPath( '/userdata/foo' ),
        "/oldphotos" = expandPath( '/wwwroot/assets/archived/olderStaffPhotos' ),
        "/catalog"  = expandPath( '/wwwroot/app/v2/catalogdata/' )
    };

    this.sessionManagement = true;
    this.sessionTimeout = CreateTimeSpan( 0, 0, 45, 0 ); // 45 minutes

    this.datasources.my_datasource = {
        "driver" = "MSSQLServer",
        "username" = "sa",
        "password" = "password",
        "url" = "jdbc:macromedia:sqlserver://localhost\MSSQL2008;databaseName=vandelayDB;;sendStringParametersAsUnicode=false;querytimeout=0;MaxPooledStatements=1000"
    };

    this.datasources.my_datasource_reporting_server = {
        "driver" = "MSSQLServer",
        "username" = "sa",
        "password" = "password",
        "url" = "jdbc:macromedia:sqlserver://localhost\MSSQL2008;databaseName=vandelayReporting;;sendStringParametersAsUnicode=false;querytimeout=0;MaxPooledStatements=1000"
    };

    // CF ORM settings
    this.ormenabled = true;
    this.ormsettings.cfclocation = "model";
    this.ormSettings.dbCreate = "none";         // CFHibernate will NOT alter the database structure.
    this.ormSettings.dialect = "MicrosoftSQLServer";

    this.datasource = "my_datasource";

    this.blockedExtForFileUpload = "cfm, cfc, jsp";

    public boolean function onApplicationStart() 
    {
        application.fileServerIPAddress         = "121.55.10.112";
        application.customerServiceEmailAddress = "support@vandelay.biz";
        application.mailServerIPAddress         = "10.5.11.99";
        return true; 
    }

    public void function onSessionStart() 
    { 
        session.created = Now(); // timestamp when this session was created;
        session.IPCreated = cgi.remote_addr;    // where did this user come from?
        session.loggedIn = false;   // new users are logged out by default;
        session.isAdmin = false;    // no way a new user can be an admin if they haven't logged in yet.
    } 

    // the target page is passed in for reference, 
    // but you are not required to include it
    function onRequestStart( string targetPage ) 
    {

    }

    function onRequest( string targetPage ) 
    {
        try 
        {
           include arguments.targetPage;
        } 
        catch (any e) 
        {
            WriteOutput( "Error trying to include template." );
            WriteDump( e );
        }
    }
    
    function onRequestEnd( string targetPage ) 
    {
        
    }

    function onSessionEnd( struct SessionScope, struct ApplicationScope ) 
    {
        // this won't extend the life of a session, it has already ended
        onSessionStart();

        // neither will this, for the same reason.
        location( "/index.cfm", addtoken=false );
    }

    function onApplicationEnd( struct ApplicationScope ) 
    {

    }

    function onError( any Exception, string EventName ) 
    {
        WriteOutput( "bad thing happened!" );
        WriteDump( arguments.exception );
        WriteDump( arguments.eventName );
    }

    public boolean function onMissingTemplate( required string targetPage ) 
    { 
        WriteOutput( "The #arguments.targetPage# page was not found!" );
        // log this 404 somewhere for later research...
        return true; 
    } 
}
```

## Caching

### Basic Caching

#### Setting Cache

```cfm
<cfscript>
    users = ArrayNew( 1 );
    users[ 1 ] = "John";
    users[ 2 ] = "Paul";
    users[ 3 ] = "George";
    users[ 4 ] = "Ringo";

    cachePut('myCacheData', users);

    writeDump( var = users, label = 'Original Array');
    
    // check to make sure object was cached
    writeoutput('<BR><BR>Was Item Cached?' & cacheIdExists('myCacheData'));
</cfscript>
```

#### Getting Cache

```cfm
<cfscript>
    data = cacheget("myCacheData");

    for (user in data) {
        writeOutput(user & '<br>');
    }
</cfscript>
```

#### Setting Cache Time

```cfm
<cfscript>
    users = ArrayNew( 1 );
    users[ 1 ] = "John";
    users[ 2 ] = "Paul";
    users[ 3 ] = "George";
    users[ 4 ] = "Ringo";

    cachePut( 'mycachedata', users, createTimespan(0,1,0,0), createTimespan(0,0,5,0) );

    writedump( cacheGetMetadata('mycachedata') );
</cfscript>
```

#### Handling Null Cache

```cfm
<cfscript>
    data = cacheget("mycachedata");

    if (isNull(data)) {
        writeDump('cached data not found');
    } else {
        for (user in data) {
            writeOutput(user & '<br>');
        }
    }
</cfscript>
```

#### Complete Cache Example

```cfm
<cfscript>
    data = cacheget("mycachedata");

    if (isNull(data)) {
        writeOutput('Not In cache, rebuilding.<br><br>');
        data = setUserArrayToCache();
    }
    
    for (user in data) {
        writeOutput(user & '<br>');
    }

    array function setUserArrayToCache(){
        var users = ArrayNew( 1 );
        users[ 1 ] = "John";
        users[ 2 ] = "Paul";
        users[ 3 ] = "George";
        users[ 4 ] = "Ringo";    
        cachePut('mycachedata', users, createTimespan(0,1,0,0), createTimespan(0,0,5,0));

        return cacheget("mycachedata");
    }
</cfscript>
```

### Advanced Caching

#### Dynamic Cache Keys

```cfm
<cfscript>
    // key names can be just about anything (all are valid)    
    cacheKey = 'myApp.cachdata.usercache.#randRange(1111,9999)#';
    // cacheKey = '@^&*(^&*())';
    // cacheKey = createuuid();

    structBandMembers = { harmonica: "John",
                            bass: "Paul",
                            guitar: "George",
                            drums: "Ringo"
                        };

    cachePut(cacheKey, structBandMembers, createTimespan(0,1,0,0), createTimespan(0,0,15,0));

    writeDump( var = cacheGet( cacheKey ), label="Data for cache key: #cacheKey#" );

    writeDump( var =  cacheGetAllIds(), label="Cache Keys" );
</cfscript>
```

#### Caching Various Data Types

```cfm
<cfset queryOptions = {datasource = "CFTrainingDSN"}/>
<cfscript>
    myQuery = queryExecute('select * from tusers');
    cachePut('mySampleQuery', myQuery, createTimespan(0,1,0,0), createTimespan(0,0,15,0));
    
    myObject = new sample();
    cachePut('mySampleObject', myObject, createTimespan(0,1,0,0), createTimespan(0,0,15,0));

    myFile = fileRead( expandpath('sample_file.txt') );
    cachePut('mySampleFile', myFile, createTimespan(0,1,0,0), createTimespan(0,0,15,0));

    cacheGetAll = cacheGetAllIds();
    writeDump( cacheGetAll );
    
    for (i in cacheGetAll) {
        writeDump( var = cachegetmetadata(i), label="Cache object: #i#" );
    }
</cfscript>
```

#### Removing Cache

```cfm
<cfscript>
    // remove single cache item
    cacheKeys = 'mySampleObject';
    cacheRemove(cacheKeys, false);

    // get all ids and remove them
    // cacheKeys = cacheGetAllIds().tolist();
    // cacheRemove(cacheKeys, false);
    
    // remove all the easier way
    // cacheKeys = 'ALL'
    // cacheRemoveAll();

    writeoutput('Cache removed : #cacheKeys#');
</cfscript>
```

### Using Cache Regions

#### Creating a Cache Region

```cfm
<cfscript>
    // create automatically by just declaring one in a cacheput()
    users = ArrayNew( 1 );
    users[ 1 ] = "John";
    users[ 2 ] = "Paul";
    users[ 3 ] = "George";
    users[ 4 ] = "Ringo";

    cachePut('mycachedata', users, createTimespan(0,1,0,0), createTimespan(0,0,5,0),'myCacheRegion', false);

    // get all ids in region
    writedump( cacheGetAllIds('myCacheRegion') ); 
</cfscript>
```

#### Creating a Region with Properties

```cfm
<cfscript>
    users = ArrayNew( 1 );
    users[ 1 ] = "John";
    users[ 2 ] = "Paul";
    users[ 3 ] = "George";
    users[ 4 ] = "Ringo";

    // define a cache region with basic properties and create region
    properties = {
        timeToLiveSeconds = 21600,
        timeToIdleSeconds = 3500,
        maxentrieslocalheap = 5,
        eternal = false
    }; 
    cacheRegionNew('myParamCacheRegion', properties, false);
    cachePut('mycachedata', users, '', '','myParamCacheRegion', true);
        
    writeDump( cacheGetProperties('myParamCacheRegion') );

    //setting properties after region creation
    properties = {
        maxentrieslocalheap = 10
    }; 
    cacheSetProperties(properties, 'myParamCacheRegion'); 
    writeDump( cacheGetProperties('myParamCacheRegion') );
</cfscript>
```

#### Working with Cache Regions

```cfm
<cfscript>
    result = '';
    cachePut('sampleData', 'test data 1','', '','myCacheRegion', true);
    
    result = cacheGet('sampleData', 'myCacheRegion');

    if ( cacheRegionExists('myCacheRegion') ) {
        result = cacheGetAllIds('myCacheRegion')
    }

    // removing region
    //cacheRegionRemove('myCacheRegion');
    
    // remove item from cache region
    // cacheRemove('sampleData', true, 'myCacheRegion', true);

    
    // remove from region with wildcard
    cachePut('othersampleData1', 'test data 1', '', '', 'myCacheRegion', false);
    cachePut('othersampleData2', 'test data 2', '', '', 'myCacheRegion', false);

    cacheRemove('Data', false, 'myCacheRegion', false);
    result = cacheGetAllIds('myCacheRegion')
    
    writeDump( result );
</cfscript>
```

### Output Caching

#### Basic Content Caching

```cfm
<cfcache action="cache" timespan="#createtimespan(0,0,15,0)#" idletime="#createtimespan(0,0,0,5)#">
    <!DOCTYPE html>
    <html>
        <body>
        <cfoutput>Random Number #randrange(111,999)#</cfoutput>
        <h1>My First Heading</h1>

        <p>My first paragraph.</p>

        </body>
    </html>
</cfcache>
```

#### Caching Page Segments

```cfm
<!DOCTYPE html>
<html>
    <body>
        <cfoutput>Random Number #randrange(111,999)#</cfoutput>
        <h1>My First Heading</h1>
        <cfcache action="cache" timespan="#createtimespan(0,0,15,0)#" idletime="#createtimespan(0,0,0,5)#">
            <h5>
                <cfoutput>Cached Random Number #randrange(1111,9999)#</cfoutput>
            </h5>
        </cfcache>
        <p>My first paragraph.</p>
    </body>
</html>
```

#### Cache Based on URL Parameters

```cfm
<!DOCTYPE html>
<html>
    <body>
        <cfoutput>Random Number #randrange(111,999)#</cfoutput>
        <h1>My First Heading</h1>
        <cfcache action="cache" 
                 timespan="#createtimespan(0,0,15,0)#" 
                 idletime="#createtimespan(0,0,0,15)#" 
                 usequerystring="true">
            <h3>This is the content for cachid #<cfoutput>#url?.cacheid ?: 'None'#</cfoutput></h3>            
            <h5>
                <cfoutput>Cached Random Number #randrange(1111,9999)#</cfoutput>
            </h5>
        </cfcache>

        <p>My first paragraph.</p>
        <ul>
            <li><a href="?">None</a></li>
            <li><a href="?cacheid=1">Sample 1</a></li>
            <li><a href="?cacheid=2">Sample 2</a></li>
            <li><a href="?cacheid=33">Sample 33</a></li>
        </ul>
    </body>
</html>
```

#### Expiring Cache

```cfm
<cfcache action="flush" expireURL="04_expiring_cache.cfm?cacheid=3">

<!DOCTYPE html>
<html>
    <body>
        <cfoutput>Random Number #randrange(111,999)#</cfoutput>
        <h1>My First Heading</h1>
        <cfcache action="cache" 
                 timespan="#createtimespan(0,0,15,0)#" 
                 idletime="#createtimespan(0,0,1,0)#" 
                 usequerystring="true">
            <h5>
                <cfoutput>Cached Random Number #randrange(1111,9999)#</cfoutput>
            </h5>
            <h3>cacheid = <cfoutput>#url?.cacheid ?: 'None'#</cfoutput></h3>
        </cfcache>

        <p>My first paragraph.</p>
        <ul>
            <li><a href="?">None</a></li>
            <li><a href="?cacheid=1">Sample 1</a></li>
            <li><a href="?cacheid=2">Sample 2</a></li>
            <li><a href="?cacheid=33">Sample 33</a></li>
        </ul>
    </body>
</html>
```

## Database Operations

### Using cfquery

```cfm
<cfquery name="qAllusers" datasource="CFTrainingDSN">
    SELECT UserID, firstName, lastName, Email
    FROM tUsers
    ORDER BY firstName
</cfquery>

<cfdump var="#qAllusers#" />
```

### Using this.datasource

```cfm
<!--- In Application.cfc --->
<cfset this.datasource = "CFTrainingDSN" />

<!--- In your page --->
<cfquery name="qAllusers">
    SELECT UserID, firstName, lastName, Email
    FROM tUsers
    ORDER BY firstName
</cfquery>

<cfdump var="#qAllusers#" />
```

### Displaying Query Data

```cfm
<cfquery name="qAllUsers">
    SELECT UserID, FirstName, LastName, Email
    FROM tUsers
    ORDER BY FirstName
</cfquery>

<ul>
    <cfoutput query="qAllUsers">
        <li>#FirstName# #LastName# (#Email#)</li>
    </cfoutput>
</ul>
```

### Grouping Query Output

```cfm
<cfquery name="qAllMovies">
    SELECT MovieID, ReleaseDate, MovieName, Rating
    FROM tMovies
</cfquery>

<!--- Group output by Rating --->
<cfoutput query="qAllMovies" group="Rating">
    <h2>Rating: #Rating#</h2>
    <ul>
        <cfoutput>
            <li>#MovieName# (#DateFormat(ReleaseDate, "mm/dd/yyyy")#)</li>
        </cfoutput>
    </ul>
</cfoutput>
```

### Dynamic Queries

```cfm
<cfquery name="qMovies">
    SELECT MovieID, MovieName, ReleaseDate, Rating 
    FROM tMovies
</cfquery>

<h2>All Movies</h2>
<ul>
    <cfoutput query="qMovies">
        <li><a href="06_dynamicQueries.cfm?movieID=#qMovies.movieID#">#qMovies.MovieName#</a></li>
    </cfoutput>
</ul>

<cfif url.keyExists("movieID")>
    <cfquery name="qDetails" result="qDetailsResults">
        SELECT MovieID, MovieName, ReleaseDate, Rating 
        FROM tMovies
        WHERE MovieID = #url.movieID#
    </cfquery>

    <h2>Movie Details</h2>
    <cfoutput>
        <div>
            <div>Name: #qDetails.MovieName#</div>
            <div>Rating: #qDetails.Rating#</div>
            <div>Released: #DateFormat(qDetails.ReleaseDate, 'mm/dd/yyyy')#</div>
        </div>
    </cfoutput>
</cfif>
```

### Using Query Parameters

```cfm
<cfquery name="qMovies">
    SELECT MovieID, MovieName, ReleaseDate, Rating 
    FROM tMovies
</cfquery>

<h2>All Movies</h2>
<ul>
    <cfoutput query="qMovies">
        <li><a href="07_usingQueryParams.cfm?movieID=#qMovies.movieID#">#qMovies.MovieName#</a></li>
    </cfoutput>
</ul>

<cfif url.keyExists("movieID")>
    <cfquery name="qDetails" result="qDetailsResults">
        SELECT MovieID, MovieName, ReleaseDate, Rating 
        FROM tMovies
        WHERE MovieID = <cfqueryparam value="#url.movieID#" cfsqltype="cf_sql_integer" />
    </cfquery>

    <h2>Movie Details</h2>
    <cfoutput>
        <div>
            <div>Name: #qDetails.MovieName#</div>
            <div>Rating: #qDetails.Rating#</div>
            <div>Released: #DateFormat(qDetails.ReleaseDate, 'mm/dd/yyyy')#</div>
        </div>
    </cfoutput>
</cfif>
```

### Query Metadata

```cfm
<cfquery name="qAllUsers"> 
    SELECT UserID, FirstName, LastName, Email
    FROM tUsers
    ORDER BY FirstName
</cfquery>

<cfoutput>
    <h2>All users (#qAllUsers.recordcount# users)</h2>
    <p>The list of columns available is: #qAllUsers.columnList#</p>
</cfoutput>
<ul>
    <cfoutput query="qAllUsers">
        <li>User #qAllUsers.currentRow# : #qAllusers.firstName# #qAllusers.lastName#</li>
    </cfoutput>
</ul>
```

### Using QueryExecute

```cfm
<cfscript>
    sql = 'SELECT MovieID, MovieName, ReleaseDate, Rating FROM tMovies';

    qMovies = queryExecute(sql);
</cfscript>

<h2>All Movies</h2>
<ul>
    <cfoutput query="qMovies">
        <li><a href="09_usingQueryExecute.cfm?movieID=#qMovies.movieID#">#qMovies.MovieName#</a></li>
    </cfoutput>
</ul>

<cfif url.keyExists("movieID")>
    <cfscript>
        sql = 'SELECT MovieID, MovieName, ReleaseDate, Rating FROM tMovies WHERE MovieID = ?';
        aParams = [{value = url.movieID, cfsqltype = 'cf_sql_integer'}];
        stOptions = {result = 'qDetails_results'};

        qDetails = queryExecute(sql, aParams, stOptions);
    </cfscript>
    
    <h2>Movie Details</h2>
    <cfoutput>
        <div>
            <div>Name: #qDetails.MovieName#</div>
            <div>Rating: #qDetails.Rating#</div>
            <div>Released: #DateFormat(qDetails.ReleaseDate, 'mm/dd/yyyy')#</div>
        </div>
        <p>The executed SQL is #qDetails_results.sql#</p>
    </cfoutput>
</cfif>
```

### Caching Queries

#### Script Syntax

```cfm
<cfscript>
    sql = "SELECT MovieID, MovieName, Rating, ReleaseDate FROM tMovies";
    params = {};

    if(url.keyExists("movieID"))
    {
        sql = sql & " WHERE MovieID = :MovieID";
        params = { MovieID = { value = url.MovieID, cfsqltype="cf_sql_integer" } };
    }
    
    qMovies = QueryExecute(sql, params, { result="rsltMovies", cachedwithin="#createTimespan(0, 0, 5, 0)#" });
</cfscript>

<cfoutput>
    <h1>Movie Info</h1>

    <cfloop query="qMovies">
        <div><a href="cachingQueries_script.cfm?movieID=#qMovies.movieID#">#qMovies.MovieName# (#qMovies.MovieID#)</a></div>
    </cfloop>
</cfoutput>
```

#### Tag Syntax

```cfm
<cfquery name="qMovies" result="rsltMovies" cachedwithin="#createTimespan(0, 0, 5, 0)#">
    SELECT MovieID, MovieName, Rating, ReleaseDate
    FROM tMovies
    <cfif IsDefined("url.movieID")>
        WHERE MovieID = <cfqueryparam value="#url.movieID#" cfsqltype="integer" />
    </cfif>
</cfquery>

<cfoutput>
    <h1>Movie Info</h1>

    <cfloop query="qMovies">
        <div><a href="cachingQueries_tag.cfm?movieID=#qMovies.MovieID#">#qMovies.MovieName# (#qMovies.MovieID#)</a></div>
    </cfloop>
</cfoutput>
```

### Query of Queries

```cfm
<cfquery name="qMovies" result="qMoviesResult" cachedwithin="#createTimeSpan(0, 0, 5, 0)#">
    SELECT MovieID, MovieName, ReleaseDate, Rating 
    FROM tMovies
</cfquery>

<cfif url.keyExists("movieID")>
    <cfquery name="qDetails" dbtype="query">
        SELECT MovieID, MovieName, ReleaseDate, Rating 
        FROM qMovies
        WHERE MovieID = <cfqueryparam value="#url.movieID#" cfsqltype="cf_sql_integer" />
    </cfquery>
    
    <h2>Movie Details</h2>
    <cfoutput>
    <div>
        <div>Name: #qDetails.MovieName#</div>
        <div>Rating: #qDetails.Rating#</div>
        <div>Released: #DateFormat(qDetails.ReleaseDate, 'mm/dd/yyyy')#</div>
    </div>
    </cfoutput>
</cfif>
```

### Using ValueList

```cfm
<cfquery name="qAllUsers">
    SELECT UserID, FirstName, LastName, Email
    FROM tUsers
    ORDER BY FirstName
</cfquery>

<p>This is the list of all user first names: <cfoutput>#ValueList(qAllUsers.FirstName)#</cfoutput></p>

<p>This is the list with custom delimiter: <cfoutput>#ValueList(qAllUsers.FirstName, " | ")#</cfoutput></p>
```

### Other Query Tags

```cfm
<cfdirectory directory="#expandPath('../')#" action="list" name="qDirectory" />

<cfoutput query="qDirectory" group="Directory">
    <p>#directory#</p>
    <ul>
        <cfoutput>
            <li>#name#</li>
        </cfoutput>
    </ul>
</cfoutput>

<!--- Directory list using script syntax --->
<cfscript>
    qDirectory = directoryList(path=expandPath('../'), listInfo="query", recurse=true, sort="directory asc, name asc");
</cfscript>
```

## Object Oriented Programming

### Creating Components

#### Script Syntax

```cfc
// MusicianScript.cfc
component 
{
    variables.musicianName = "John Lennon";
    variables.age          = 64;
    this.instrument   = "Harmonica";
}
```

#### Tag Syntax

```cfc
<!--- MusicianTag.cfc --->
<cfcomponent>
    <cfset variables.musicianName = "John Lennon" />
    <cfset variables.age = 64 />
    <cfset this.instrument = "Harmonica"/>
</cfcomponent>
```

#### Using Components

```cfm
<cfscript>
    comScript = createObject('component', 'com.MusicianScript');
    writeDump(var=comScript, label="ComScript");
</cfscript>

<cfset comTag = createObject('component', 'com.MusicianTag') />
<cfdump var="#comTag#" label="comTag" />

<cfoutput>
    <p>This scoped variable from the MusicianScript.cfc component = #comScript.instrument# </p>
    <p>This scoped variable from the MusicianTag.cfc component = #comTag.instrument# </p>
</cfoutput>
```

### Methods in Components

```cfc
// Actor.cfc
component
{
    public any function init()
    {
        return this;
    }

    public void function getPaid()
    {
        WriteOutput("<p>The actor is being paid for their recent work.</p>");
    }

    public void function renewUnionDues(numeric price)
    {
        WriteOutput("<p>The actor is paying #DollarFormat(arguments.price)# for SAG dues.</p>");
    }

    public numeric function getTaxes()
    {
        return 500;
    }
}
```

```cfm
<cfscript>
    act1 = new com.Actor();
    act1.getPaid();

    act1.renewUnionDues(100);

    taxAmt = act1.getTaxes();
    WriteOutput("The actor paid #taxAmt# in taxes this year.");
</cfscript>
```

### Creating Component Instances

```cfm
<cfscript>
    // Method 1: Using new keyword
    stu1 = new mycfcs.student();
    result1 = stu1.registerForClass();
    WriteOutput("<p>#result1#</p>");

    // Method 2: Using new keyword with constructor arguments
    stu2 = new mycfcs.student("John");
    result2 = stu2.registerForClass();
    WriteOutput("<p>#result2#</p>");

    // Method 3: Using CreateObject with init method
    stu3 = CreateObject("component", "mycfcs.student").init("George");
    result3 = stu3.registerForClass();
    WriteOutput("<p>#result3#</p>");
</cfscript>

<!--- Method 4: Using cfset with CreateObject --->
<cfset stu4 = CreateObject("component", "mycfcs.student").init("Paul") />
<cfset result4 = stu4.registerForClass() />
<cfoutput><p>#result4#</p></cfoutput>

<!--- Method 5: Using cfobject tag --->
<cfobject type="component" name="stu5" component="mycfcs.student">
<cfset stu5 = stu5.init("Ringo") />
<cfset result5 = stu5.registerForClass() /> 
<cfoutput><p>#result5#</p></cfoutput>
```

### Constructor Method (init)

```cfc
// Musician.cfc
component 
{
    variables.musicianName = "";
    variables.age          = "";
    variables.instrument   = "";
    
    public any function init(string musicianName="", numeric age=0, string instrument="")
    {
        variables.musicianName = arguments.musicianName;
        variables.age          = arguments.age;
        variables.instrument   = arguments.instrument;
        return this;
    }
    
    public any function displayMusicianInfo()
    {
        WriteOutput("<p>Name: #variables.musicianName#</p>");
        WriteOutput("<p>Age: #variables.age#</p>");
        WriteOutput("<p>Instrument: #variables.instrument#</p>");
    }
}
```

```cfm
<cfset musician1 = createObject('component', 'com.Musician').init("John Lennon", 64, "harmonica") />
<cfscript>
    musician2 = createObject('component', 'com.Musician').init("Paul McCartney", 70, "bass guitar");
    
    // Display musician info
    musician1.displayMusicianInfo();
    musician2.displayMusicianInfo();
</cfscript>
```

### Public and Private Methods

```cfc
// Musician.cfc
component
{
    variables.musicianName = "";
    variables.age          = "";
    variables.instrument   = "";

    public any function init(string musicianName="", numeric age=0, string instrument="")
    {
        variables.musicianName = arguments.musicianName;
        variables.age          = arguments.age;
        variables.instrument   = arguments.instrument;
        return this;
    }

    public any function displayMusicianInfo()
    {
        WriteOutput("<p>Name: #variables.musicianName#</p>");
        WriteOutput("<p>Age: #variables.age#</p>");
        WriteOutput("<p>Instrument: #variables.instrument#</p>");
    }

    private any function goOnTour()
    {
        WriteOutput("<p>The musician is going on tour.</p>");
    }
}
```

```cfm
<cfscript>
    mus1 = new com.Musician("Henry Rollins", 51, "Guitar");
    mus1.displayMusicianInfo();
    // mus1.goOnTour(); // This will cause an error as goOnTour is private
</cfscript>
```

### Accessors (Getters and Setters)

#### Manual Accessors

```cfc
// Musician.cfc
component
{
    variables.musicianName = "";
    variables.age          = "";
    variables.instrument   = "";

    public any function init(string musicianName="", numeric age=0, string instrument="")
    {
        setMusicianName(arguments.musicianName);
        setAge(arguments.age);
        setInstrument(arguments.instrument);

        return this;
    }

    // setters (mutators)
    public void function setMusicianName(string newName)
    {
        variables.musicianName = arguments.newName;
    }

    public void function setAge(numeric newAge)
    {
        variables.age = arguments.newAge;
    }

    public void function setInstrument(string newInstrument)
    {
        variables.instrument = arguments.newInstrument;
    }

    // getters (accessors)
    public string function getMusicianName()
    {
        return variables.musicianName;
    }

    public numeric function getAge()
    {
        return variables.age;
    }

    public string function getInstrument()
    {
        return variables.instrument;
    }

    public any function displayMusicianInfo()
    {
        WriteOutput("<p>Name: #getMusicianName()#</p>");
        WriteOutput("<p>Age: #getAge()#</p>");
        WriteOutput("<p>Instrument: #getInstrument()#</p>");
    }
}
```

#### Implicit Accessors

```cfc
// Author.cfc
component accessors="true"
{
    property name="authorName" type="string";
    property name="age" type="numeric";
    property name="bookTitle" type="string";

    public any function init(string authorName, numeric age, string bookTitle)
    {
        setAuthorName(arguments.authorName);
        setAge(arguments.age);
        setBookTitle(arguments.bookTitle);

        return this;
    }

    public any function displayAuthorInfo()
    {
        WriteOutput("<p>Name: #getAuthorName()#</p>");
        WriteOutput("<p>Age: #getAge()#</p>");
        WriteOutput("<p>Book Title: #getBookTitle()#</p>");
    }
}
```

#### Overriding Accessors

```cfc
// Comedian.cfc
component accessors="true"
{
    property name="comedianName" type="string";
    property name="age" type="numeric";
    property name="location" type="string"; 

    public any function init(string comedianName, numeric age, string location)
    {
        setComedianName(arguments.comedianName);
        setAge(arguments.age);
        setLocation(arguments.location);

        return this;
    }

    public void function setAge(numeric newAge)
    {
        if(arguments.newAge lt 1 or arguments.newAge gt 100)
        {
            throw(message="setAge() received an invalid value");
            abort;
        }
        else 
        {
            variables.age = arguments.newAge;    
        }
    }

    public string function getAge()
    {
        return variables.age & " years old";
    }

    public any function showComedianDetails()
    {
        WriteOutput("<p>Name: #getComedianName()#</p>");
        WriteOutput("<p>Age: #getAge()#</p>");
        WriteOutput("<p>Location: #getLocation()#</p>");
    }
}
```

### Inheritance

#### Base Class

```cfc
// Entertainer.cfc
component accessors="true"
{
    property name="name" type="string";
    property name="age" type="numeric";
    
    public any function init(name, age)
    {
        setName(arguments.name);
        setAge(arguments.age);
    
        return this;
    }

    public any function showInfo()
    {
        WriteOutput("<p>Name: #getName()#</p>");
        WriteOutput("<p>Age: #getAge()#</p>");
    }
}
```

#### Subclass

```cfc
// Actor.cfc
component accessors="true" extends="Entertainer"
{
    property name="SAGNumber" type="numeric";

    public any function init(string actorName="", numeric age=0, numeric SAGNumber="")
    {
        super.init(arguments.actorName, arguments.age);
        setSAGNumber(arguments.SAGNumber);
        return this;
    }

    public any function showActorDetails()
    {
        showInfo();
        WriteOutput("<p>SAG Number: #getSAGNumber()#</p>");
    }

    public any function renewUnionDues()
    {
        WriteOutput("<p>The actor is renewing his/her SAG union dues.</p>");
    }
}
```

#### Multi-Level Inheritance

```cfc
// Employee.cfc
component accessors="true"
{
    property name="name" type="string";
    
    public any function init(employeeName)
    {
        setName(arguments.employeeName);
        return this;
    }

    public void function getPaid()
    {
        WriteOutput("Employee #getName()# has been paid.");
    }
}

// Entertainer.cfc
component accessors="true" extends="Employee"
{
    property name="age" type="numeric";
    
    public any function init(name, age)
    {
        super.init(arguments.name);
        setAge(arguments.age);
        return this;
    }

    public any function showInfo()
    {
        WriteOutput("<p>Name: #getName()#</p>");
        WriteOutput("<p>Age: #getAge()#</p>");
    }
}

// Musician.cfc
component accessors="true" extends="Entertainer" 
{
    property name="instrument" type="string";    

    public any function init(string musicianName="", numeric age=0, string instrument="")
    {
        super.init(arguments.musicianName, arguments.age);
        setInstrument(arguments.instrument);
        return this;
    }

    public any function displayMusicianInfo()
    {
        showInfo();
        WriteOutput("<p>Instrument: #getInstrument()#</p>");
    }
}
```

### Interfaces

#### Interface Definition

```cfc
// ISwimmable.cfc
interface
{
    public void function swim();
}

// IQuackable.cfc
interface
{
    public void function quack();
}

// IFlyable.cfc
interface
{
    public void function fly();
}

// IEatable.cfc
interface
{
    public void function eat();
}
```

#### Implementing Interfaces

```cfc
// Duck.cfc (base class)
component accessors="true"
{
    property name="color" type="string";
    
    public any function init(color)
    {
        setColor(arguments.color);
        return this;
    }
}

// Mallard.cfc
component extends="Duck" implements="ISwimmable,IQuackable,IFlyable,IEatable"
{
    public void function swim()
    {
        WriteOutput("<p>The #getColor()# mallard is swimming in the river.</p>");
    }

    public void function quack()
    {
        WriteOutput("<p>The #getColor()# mallard is quacking...QUACK!</p>");
    }

    public void function fly()
    {
        WriteOutput("<p>The #getColor()# mallard is flying in the air!</p>");
    }    

    public void function eat()
    {
        WriteOutput("<p>The #getColor()# mallard is eating food.</p>");
    }    
}

// RubberDuck.cfc
component extends="Duck" implements="ISwimmable,IQuackable"
{
    public void function swim()
    {
        WriteOutput("<p>The #getColor()# rubber duck is floating in the tub.</p>");
    }

    public void function quack()
    {
        WriteOutput("<p>The #getColor()# rubber duck is quacking...SQUEAK!</p>");
    }
}

// WoodenDecoy.cfc
component extends="Duck" implements="ISwimmable"
{
    public void function swim()
    {
        WriteOutput("<p>The #getColor()# wooden decoy is floating in the water.</p>");
    }
}
```

### Composition

#### Simple Composition

```cfc
// InsurancePlan.cfc
component accessors="true"
{
    property name="provider" type="string";
    property name="copay" type="numeric";
    property name="deductible" type="numeric";

    public any function init(provider, copay, deductible)
    {
        setProvider(arguments.provider);
        setCopay(arguments.copay);
        setDeductible(arguments.deductible);
        return this;
    }
    
    public void function showPlanDetails()
    {
        WriteOutput("<p>Provider: #getProvider()#</p>");
        WriteOutput("<p>Copay: #DollarFormat(getCopay())#</p>");
        WriteOutput("<p>Deductible: #DollarFormat(getDeductible())#</p>");
    }
}

// Employee.cfc
component accessors="true"
{
    property name="FirstName" type="string";
    property name="LastName" type="string";
    property name="age" type="numeric";
    property name="healthPlan" type="com.InsurancePlan";

    public any function init(firstName, lastName, age, healthPlan)
    {
        setFirstName(arguments.firstName);
        setLastName(arguments.lastName);
        setAge(arguments.age);
        setHealthPlan(arguments.healthPlan);
        return this;
    }
    
    public void function showEmployeeDetails()
    {
        WriteOutput("<p>Name: #getFirstName()# #getLastName()#</p>");
        WriteOutput("<p>Age: #getAge()# years old.</p>");
        healthPlan.showPlanDetails();
    }
}
```

#### Advanced Composition

```cfc
// Department.cfc
component accessors="true"
{
    property name="departmentName" type="string";
    property name="teamMembers" type="array"; // Array of Employees

    public any function init(string departmentName)
    {
        setDepartmentName(arguments.departmentName);
        setTeamMembers([]);
        return this;
    }

    public void function addEmployee(Employee emp)
    {
        getTeamMembers().append(arguments.emp);
    }
    
    public void function displayDepartmentInfo()
    {
        WriteOutput("<p>Department Name: #getDepartmentName()#</p>");
        WriteOutput("<p>There are #getTeamMembers().len()# people in this department.</p>");

        for(var t in getTeamMembers())
        {
            t.showEmployeeDetails();
        }
    }
}

// Company.cfc
component accessors="true"
{
    property name="companyName" type="string";
    property name="departments" type="array";

    public any function init(string name)
    {
        setCompanyName(arguments.name);
        setDepartments([]);
        return this;
    }

    public void function addDepartment(Department d)
    {
        getDepartments().append(arguments.d);
    }
    
    public void function showCompanyDetails()
    {
        WriteOutput("<p>Company Name: #getCompanyName()#</p>");

        for(var d in getDepartments())
        {
            d.displayDepartmentInfo();
        }
    }
}
```

### Basic CRUD Operations

```cfc
// Movie.cfc
component 
{
    public any function init()
    {
        return this;
    }
    
    public query function select(numeric MovieID)
    {
        var sql = "SELECT MovieID, MovieName, ReleaseDate, Rating FROM tMovies";

        if(arguments.keyExists("MovieID"))
        {
            sql = sql & " WHERE MovieID = :MovieID";
            var params = { MovieID = { value = arguments.MovieID, cfsqltype="cf_sql_integer" } };
        }
        else 
        {
            var params = {};
        }

        var qResult = QueryExecute(sql, params);
        return qResult;
    }

    public void function insert(MovieName, Rating, ReleaseDate)
    {
        var sql = "INSERT INTO tMovies (MovieName, Rating, ReleaseDate) VALUES (:MovieName, :Rating, :ReleaseDate)";

        var params = {
            MovieName   = { value = arguments.MovieName, cfsqltype="cf_sql_varchar" },
            Rating      = { value = arguments.Rating, cfsqltype="cf_sql_varchar" },
            ReleaseDate = { value = arguments.ReleaseDate, cfsqltype="cf_sql_timestamp" }
        };

        QueryExecute(sql, params);
    }

    public void function update(MovieID, MovieName, Rating, ReleaseDate)
    {
        var sql = "UPDATE tMovies SET MovieName = :MovieName, Rating = :Rating, ReleaseDate = :ReleaseDate WHERE MovieID = :MovieID";

        var params = {
            MovieID     = { value = arguments.MovieID, cfsqltype="cf_sql_integer" },
            MovieName   = { value = arguments.MovieName, cfsqltype="cf_sql_varchar" },
            Rating      = { value = arguments.Rating, cfsqltype="cf_sql_varchar" },
            ReleaseDate = { value = arguments.ReleaseDate, cfsqltype="cf_sql_timestamp" }
        };

        QueryExecute(sql, params);
    }

    public void function delete(MovieID)
    {
        var sql = "DELETE FROM tMovies WHERE MovieID = :MovieID";

        var params = {
            MovieID = { value = arguments.MovieID, cfsqltype="cf_sql_integer" }
        };

        QueryExecute(sql, params);
    }

    public query function search(MovieName, Rating, ReleaseDate)
    {
        var sql = "SELECT MovieID, MovieName, Rating, ReleaseDate FROM tMovies WHERE 1=1 ";
        var params = {};

        if(arguments.keyExists("MovieName"))
        {
            sql = sql & "AND MovieName LIKE :MovieName";
            params.MovieName = { value = "%#arguments.MovieName#%", cfsqltype="cf_sql_varchar" }
        }

        if(arguments.keyExists("Rating"))
        {
            sql = sql & "AND Rating = :Rating";
            params.Rating = { value = arguments.Rating, cfsqltype="cf_sql_varchar" }
        }

        if(arguments.keyExists("ReleaseDate"))
        {
            sql = sql & "AND ReleaseDate = :ReleaseDate";
            params.ReleaseDate = { value = arguments.ReleaseDate, cfsqltype="cf_sql_timestamp" }
        }

        return QueryExecute(sql, params);
    }
}
```

### Caching Components in Application and Session Scopes

#### Application.cfc

```cfc
component
{
    this.name = "CachingComponentsExample";
    this.mappings["/model"] = getDirectoryFromPath(getCurrentTemplatePath()) & "model/";
    this.sessionmanagement = true;
    this.sessointimeout = CreateTimeSpan(0, 2, 0, 0);
    
    public boolean function onApplicationStart() 
    {
        application.objMovie = new model.Movie(); 
        application.objLogin = new model.Login();
        return true; 
    } 
}
```

#### Using Components from Application Scope

```cfm
<cfset qMovies = application.objMovie.select() />

<cfoutput>
    <h2>Movies</h2>
    <ul>
        <cfloop query="qMovies">
            <li>#qMovies.MovieName#</li>
        </cfloop>
    </ul>
</cfoutput>
```

#### Caching in Session Scope

```cfc
// UserInfo.cfc
component accessors="true"
{
    property name="UserID" type="numeric";
    property name="FirstName" type="string";
    property name="LastName" type="string";
    property name="Email" type="string";
}
```

```cfm
<cfscript>
    if(cgi.request_method eq "post")
    {
        qLogin = application.objLogin.select(form.email, form.password);

        if(qLogin.recordCount eq 1)
        {
            myDetails = new model.UserInfo();
            myDetails.setUserID(qLogin.UserID);
            myDetails.setFirstName(qLogin.firstName);
            myDetails.setLastName(qLogin.lastName);
            myDetails.setEmail(qLogin.email);
            session.info = myDetails;
            
            location(url="listMovies.cfm", addtoken="no");
        }
    }
</cfscript>

<!--- In listMovies.cfm --->
<cfoutput>
    <div>
        User: #session.info.getFirstName()# #session.info.getLastName()#
    </div>
</cfoutput>
```
